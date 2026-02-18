<?php

require_once './repository/database.php';


// fonction qui récupère l'historique de jeu
function getPlayerHistory(int|string $playerId): array
{
    $sql = 'SELECT 
                game.date_game, 
                result.noun_drink AS result_noun
            FROM game
            INNER JOIN result ON game.id_result = result.id
            WHERE game.id_player = :playerId
            ORDER BY game.date_game DESC';

    $query = getConnection()->prepare($sql);
    $query->execute([
        'playerId' => $playerId
    ]);

    return $query->fetchAll();
}

function saveGame(int $playerId, ?int $resultId)
{
    if ($resultId === null) {
        return; function saveGame(int $playerId, ?int $resultId) // Le ? permet de recevoir NULL sans planter
{
    if ($resultId === null) {
        return; 
    }

    $db = getConnection();
    $sql = 'INSERT INTO game (date_game, id_player, id_result) VALUES (NOW(), :id_p, :id_r)';
    $query = $db->prepare($sql);
    $query->execute([
        'id_p' => $playerId,
        'id_r' => $resultId
    ]);
}
    }

    $db = getConnection();
    $sql = 'INSERT INTO game (date_game, id_player, id_result) VALUES (NOW(), :id_p, :id_r)';
    $query = $db->prepare($sql);
    $query->execute([
        'id_p' => $playerId,
        'id_r' => $resultId
    ]);
}