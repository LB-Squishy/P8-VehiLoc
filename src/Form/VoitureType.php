<?php

namespace App\Form;

use App\Entity\Voiture;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class VoitureType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class, [
                'label' => 'Nom de la voiture',
                'required' => true,
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Description',
                'required' => true,
            ])
            ->add('prixMensuel', NumberType::class, [
                'label' => 'Prix mensuel',
                'required' => true,
            ])
            ->add('prixJournalier', NumberType::class, [
                'label' => 'Prix journalier',
                'required' => true,
            ])
            ->add('places', ChoiceType::class, [
                'choices' => range(1, 9),
                'label' => 'Nombre de places',
                'choice_label' => function ($choice) {
                    return $choice;
                },
                'required' => true,
            ])
            ->add('transmission', ChoiceType::class, [
                'label' => 'Boîte de vitesse',
                'choices' => [
                    'manuelle' => true,
                    'automatique' => false,
                ],
                'required' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Voiture::class,
        ]);
    }
}
