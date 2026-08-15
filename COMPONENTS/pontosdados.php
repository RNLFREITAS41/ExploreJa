<?php
//Faz a ligação com a conexão e verifica se usuário já está logado
include '../PHP/conexao.php';
session_start();

//Pega o nome do usuário
$usuarioLogado = $_SESSION['usuario'] ?? null;

//Verifica se a cidade foi passada via GET
if (!isset($_GET['cidade'])) {
  echo "<p class='erro text-center mt-4'>Cidade não selecionada.</p>";
  exit;
}

$idCidade = $_GET['cidade'];
$idCategoria = $_GET['categoria'] ?? null;

//Busca todas as cidades (ordem alfabética)
function buscarCidades($conn) {
  $sql = "SELECT id_cidade, cidade FROM cidades ORDER BY cidade ASC";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Pega o nome da cidade pelo ID
function buscarNomeCidade($conn, $idCidade) {
  $sql = "SELECT cidade FROM cidades WHERE id_cidade = :id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':id', $idCidade, PDO::PARAM_INT);
  $stmt->execute();
  return $stmt->fetchColumn();
}

// Pega os pontos turísticos com ou sem a categoria
function buscarPontos($conn, $idCidade, $idCategoria = null) {
  $sql = "SELECT id_ponto, ponto_turistico, foto_principal FROM pontos_turisticos WHERE id_cidade = :id";
  if ($idCategoria) {
    $sql .= " AND id_categoria = :categoria";
  }
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':id', $idCidade, PDO::PARAM_INT);
  if ($idCategoria) {
    $stmt->bindParam(':categoria', $idCategoria, PDO::PARAM_INT);
  }
  $stmt->execute();
  return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function buscarCategorias($conn) {
  $sql = "SELECT id_categoria, categoria FROM categorias";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

//Executa as funções
$listaCidades = buscarCidades($conn);
$nomeCidade = buscarNomeCidade($conn, $idCidade);
$pontos = buscarPontos($conn, $idCidade, $idCategoria);
$listaCategorias = buscarCategorias($conn);