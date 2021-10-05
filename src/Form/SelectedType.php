<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class SelectedType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder->add('choix', ChoiceType::class, [
            'choices'  => [
                'Dirigeants' => 1,
                'Societes' => 2,
            ],
            'label'  => 'Veuillez choisir entre dirigeant et société',
            'placeholder' => 'Veuillez choisir ...'
        ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
