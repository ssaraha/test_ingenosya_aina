<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Dirigeant;
use App\Entity\Societe;

use App\Form\SelectedType;
use App\Form\DirigeantType;
use App\Form\SocieteType;

use App\Repository\CodepostalRepository;
use App\Repository\VilleRepository;

use App\Helper\Helper;

use Doctrine\ORM\EntityManagerInterface;

class AddController extends AbstractController
{
    /**
     * @Route("/", name="app_add")
     */
    public function index(Request $request, EntityManagerInterface $em): Response
    {
        $dirigeant = new Dirigeant();
        $societe = new Societe;

        $form_select = $this->createForm(SelectedType::class, null);

        $form_dirigeant = $this->createForm(DirigeantType::class, $dirigeant);
        $form_dirigeant->handleRequest($request);

        $form_societe = $this->createForm(SocieteType::class, $societe);
        $form_societe->handleRequest($request);

        if ( $form_dirigeant->isSubmitted() && $form_dirigeant->isValid() ) {
            $this->addflash('success', 'Dirigeant enregistrée avec success');

            $em->persist($dirigeant);
            $em->flush();
        }

        if ( $form_societe->isSubmitted() && $form_societe->isValid() ) {
            
            $this->addflash('success', 'Societe enregistrée avec success');

            $em->persist($societe);
            $em->flush();
        }

        return $this->render('add/index.html.twig',
                    [
                        'select' => $form_select->createView(),
                        'dirigeant' => $form_dirigeant->createView(),
                        'societe' => $form_societe->createView()
                    ] 
                );
    }

    /**
     * @Route("/ville", name="app_ville")
     */
    public function getVille(Request $request, CodepostalRepository $codeRepo, VilleRepository $villeRepo, Helper $helper): Response
    {
        $array_ville = [];
        $code_postal = $codeRepo->find($request->query->get('id_code_postale'));
        $villes = $villeRepo->findBy(['codepostal' => $code_postal]);

        foreach ($villes as $ville) {
            $info_ville = $helper->transformVilleInfoToArray($ville);
            $array_ville[] = $info_ville;
        }
        //dd($array_ville);

        return new JsonResponse([ 'villes' => $array_ville]);
        
        
    }
}
