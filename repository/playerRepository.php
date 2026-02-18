<?php

require_once './repository/database.php';

// Fonction qui fait la requête SQL d'ajout d'un utilisateur
function addPlayer(string $username, string $email, string $clearPassword )
{
    $sql = 'INSERT INTO player (username, email, password) VALUES (:username, :email, :password )';

    $query = getConnection()->prepare( $sql );

    $query->execute([
        'username' => $username,
        'email' => $email,
        'password' => password_hash( $clearPassword, PASSWORD_BCRYPT )
    ]);
}

// Fonction qui fait la requête SQL de récupération d'un utilisateur selon son username
function getPlayerByUsername( string $username ): array|bool
{
    $sql = 'SELECT * FROM player WHERE username = :username';

    $query = getConnection()->prepare( $sql );

    $query->execute([
        'username' => $username
    ]);

    return $query->fetch();
}

// Fonction qui fait la requête SQL de récupération d'un utilisateur selon son id
function getPlayerById( string|int $id ): ?array
{
    $sql = 'SELECT * FROM player WHERE id = :id';

    $query = getConnection()->prepare( $sql );

    $query->execute([
        'id' => $id
    ]);

    return $query->fetch();
}

// Fonction pour mettre à jour le mot de passe
function updatePlayerPassword(string|int $userId, string $newClearPassword)
{
    $sql = 'UPDATE player SET password = :password WHERE id = :id';

    $query = getConnection()->prepare($sql);

    $query->execute([
        'id'       => $userId, 
        'password' => password_hash($newClearPassword, PASSWORD_BCRYPT)
    ]);
}

// Fonction qui fait la requête SQL de suppression d'un utilisateur selon son id
function deletePlayer( string|int $playerId )
{
    $sql = 'DELETE FROM player WHERE id = :playerId';

    $query = getConnection()->prepare( $sql );

    $query->execute([
        'playerId' => $playerId
    ]);
}