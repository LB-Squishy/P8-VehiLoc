<?php

namespace App\Controller;

use App\Repository\VoitureRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class VoituresController extends AbstractController
{
    #[Route('/', name: 'app_home', methods: ['GET'])]
    public function index(VoitureRepository $voitures): Response
    {
        $voitures = $voitures->findAll();

        return $this->render('voitures/accueil.html.twig', [
            'controller_name' => 'VoituresController',
            'voitures' => $voitures,
        ]);
    }
}
