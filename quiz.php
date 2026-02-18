<?php

require_once './repository/quizRepository.php';

$id = (isset($_GET['id']) && !empty($_GET['id'])) ? (int)$_GET['id'] : null;

$quizData = getQuizStep($id);

if (!$quizData) {
    header('Location: index.php');
    exit();
}

$currentQuestion = $quizData['question'];
$availableResponses = $quizData['responses'];

// Inclusion de la vue
$template = './template/quiz.phtml';
include_once './template/layout.phtml';