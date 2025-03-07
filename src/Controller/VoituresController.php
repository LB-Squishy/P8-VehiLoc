<?php

namespace App\Controller;

use App\Repository\VoitureRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
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
