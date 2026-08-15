<?php
//Faz a ligação com a conexão e verifica se usuário já está logado
include 'PHP/conexao.php';
session_start();
//Pega o nome do usuário
$usuarioLogado = $_SESSION['usuario'] ?? null;

//Busca todas as cidades (ordem alfabética)
function buscarCidades($conn) {
  $sql = "SELECT id_cidade, cidade FROM cidades ORDER BY cidade ASC";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

//Busca cidades e suas imagens de maneira aleatória (9)
function buscarPontosAleatorios($conn, $limite = 9) {
  $sql = "SELECT id_ponto, ponto_turistico, foto_principal FROM pontos_turisticos ORDER BY RAND() LIMIT :limite";
  $stmt = $conn->prepare($sql);
  $stmt->bindValue(':limite', $limite, PDO::PARAM_INT);
  $stmt->execute();
  return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

//Executa as funções
$cidades = buscarCidades($conn);
$pontosAleatorios = buscarPontosAleatorios($conn);
