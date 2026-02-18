<?php

require_once './repository/database.php';

// fonction qui récupère la questione et les responses
function getQuizStep(?int $questionId) {
    $db = getConnection();

    
    if ($questionId === null) {
        $stmt = $db->query("SELECT * FROM question WHERE is_first = 1 LIMIT 1");
    } else {
        $stmt = $db->prepare("SELECT * FROM question WHERE id = :id");
        $stmt->execute(['id' => $questionId]);
    }
    $question = $stmt->fetch();

    if (!$question) return null;

    
    $stmt = $db->prepare("SELECT * FROM response WHERE id_question = :id");
    $stmt->execute(['id' => $question['id']]);
    $responses = $stmt->fetchAll();

    return [
        'question' => $question,
        'responses' => $responses
    ];
}

// fonction qui récupère les détails du résultat de la question
function getResultById(int $id): array|bool
{
    $db = getConnection();
    $stmt = $db->prepare("SELECT * FROM result WHERE id = :id");
    $stmt->execute(['id' => $id]);
    
    return $stmt->fetch();
}