<?php

// Inclusion du fichier de fonctions
require_once './utils/functions.php';

// On se donne accès à $_SESSION
session_start();

// On détruit la session
session_destroy();

// Redirection vers la page d'accueil
redirectTo( 'index.php' );