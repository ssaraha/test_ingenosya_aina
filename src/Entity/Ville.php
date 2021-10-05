<?php

namespace App\Entity;

use App\Repository\VilleRepository;
use Doctrine\ORM\Mapping as ORM;

use App\Entity\Traits\Timetrait;

/**
 * @ORM\Entity(repositoryClass=VilleRepository::class)
 * @ORM\Table(name="villes")
 * @ORM\HasLifecycleCallbacks
 */
class Ville
{
    use Timetrait;
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\ManyToOne(targetEntity=Codepostal::class, inversedBy="villes")
     */
    private $codepostal;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getCodepostal(): ?Codepostal
    {
        return $this->codepostal;
    }

    public function setCodepostal(?Codepostal $codepostal): self
    {
        $this->codepostal = $codepostal;

        return $this;
    }
}
