<?php
session_start();
include 'conexao.php';

if (!isset($_SESSION['id_usuario'])) {
  header('Location: CONTA/login.php');
  exit;
}

$usuarioLogado = $_SESSION['usuario'] ?? null;
$idUsuario = $_SESSION['id_usuario'] ?? null;

$stmt = $conn->prepare("SELECT f.id_ponto, f.ponto_turistico, pt.cidade, pt.estado, pt.foto_principal FROM favoritos f JOIN pontos_turisticos pt ON f.id_ponto = pt.id_ponto WHERE f.id_usuario = :id_usuario");
$stmt->bindParam(':id_usuario', $idUsuario);
$stmt->execute();
$favoritos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Favoritos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="../CSS/sobrenos.css">
  <link rel="stylesheet" href="../CSS/modal.css">
  <link rel="stylesheet" href="../CSS/favoritos.css">
</head>
<body>

<header>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand me-3" href="../index.php">
        <img src="../IMAGES/Explore.png" alt="Logo Explore Já" class="img-fluid logo-img">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mainNavbar">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <?php if ($usuarioLogado): ?>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-person-circle me-2"></i> <?= htmlspecialchars($usuarioLogado) ?>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item text-danger" href="../PHP/CONTA/deslogar.php">Sair</a></li>
            </ul>
          </li>
        <?php endif; ?>
        </ul>
      </div>
    </div>
  </nav>
</header>


<main class="container my-5">
  <div class="mb-4 p-4 bg-light rounded shadow-sm">
    <h2 class="mb-4">Meus Favoritos</h2>
    </div>
    <?php if (empty($favoritos)): ?>
      <div class="alert alert-info">Você ainda não favoritou nenhum ponto turístico.</div>
    <?php else: ?>
      <div class="row">
        <?php foreach ($favoritos as $ponto): ?>
          <div class="col-md-4 mb-4">
            <div class="card h-100">
              <?php if (!empty($ponto['foto_principal'])): ?>
                <img src="../IMAGES/<?= htmlspecialchars($ponto['foto_principal']) ?>" class="card-img-top" alt="<?= htmlspecialchars($ponto['ponto_turistico']) ?>" style="height: 200px; object-fit: cover;">
              <?php endif; ?>
              <div class="card-body">
                <h5 class="card-title"><?= htmlspecialchars($ponto['ponto_turistico']) ?></h5>
                <p class="card-text"><?= htmlspecialchars($ponto['cidade']) ?>, <?= htmlspecialchars($ponto['estado']) ?></p>
                <a href="especifico.php?id=<?= $ponto['id_ponto'] ?>" class="btn btn-primary">Ver Detalhes</a>
              </div>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    <?php endif; ?>
</main>

<footer class="footer-site text-center text-light py-4 mt-5">
  <div class="container">
    <p class="mb-1">© 2025 Explore Já. Todos os direitos reservados.</p>
    <p class="mb-0">
      <a href="#" class="link-footer text-light">Política de Privacidade</a> |
      <a href="#" class="link-footer text-light">Termos de Uso</a>
    </p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>