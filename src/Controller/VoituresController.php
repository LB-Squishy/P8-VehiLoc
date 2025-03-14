<?php

namespace App\Controller;

use App\Entity\Voiture;
use App\Form\VoitureType;
use App\Repository\VoitureRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class VoituresController extends AbstractController
{
    public function __construct(
        private VoitureRepository $voitureRepository,
        private EntityManagerInterface $entityManagerInterface,
    ) {}

    #[Route('/', name: 'app_home', methods: ['GET'])]
    public function index(): Response
    {
        $voitures = $this->voitureRepository->findAll();

        return $this->render('accueil.html.twig', [
            'voitures' => $voitures,
        ]);
    }

    #[Route('/voiture/add', name: 'app_car_add', methods: ['GET', 'POST'])]
    public function addVoiture(Request $request): Response
    {
        $voiture = new Voiture();
        $form = $this->createForm(VoitureType::class, $voiture);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $voiture = $form->getData();
            $this->entityManagerInterface->persist($voiture);
            $this->entityManagerInterface->flush();
            return $this->redirectToRoute('app_car_show', ['id' => $voiture->getId()]);
        }

        return $this->render('voitures/add.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/voiture/{id}', name: 'app_car_show', methods: ['GET'])]
    public function showVoiture(int $id): Response
    {
        $voiture = $this->voitureRepository->find($id);

        if (!$voiture) {
            return $this->redirectToRoute('app_home');
        }

        return $this->render('voitures/show.html.twig', [
            'voiture' => $voiture,
        ]);
    }

    #[Route('/voiture/{id}/delete', name: 'app_car_delete', methods: ['GET'])]
    public function deleteVoiture(int $id): Response
    {
        $voiture = $this->voitureRepository->find($id);

        if (!$voiture) {
            return $this->redirectToRoute('app_home');
        }

        $this->entityManagerInterface->remove($voiture);
        $this->entityManagerInterface->flush();
        return $this->redirectToRoute('app_home');
    }
}
