<?php include '../COMPONENTES/pontosdados.php'; ?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pontos Turísticos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="../CSS/pontos.css" />
  <link rel="stylesheet" href="../CSS/modal.css" />
</head>
<body>

<header>
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <div class="d-flex align-items-center">
      <a class="navbar-brand me-3" href="../index.php">
        <img src="../IMAGES/Explore.png" alt="Logo Explore Já" class="img-fluid logo-img">
      </a>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="favoritos.php">Favoritos</a></li>

        <!-- Se estiver na conta é exibido o nome e ele possuí a opção de deslogar-->
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

<main class="divclaro">

  <!-- Seleção de categoria -->
  <div class="container filtro-bar text-center my-4">
    <div class="d-flex flex-wrap justify-content-center">
      <?php foreach ($listaCategorias as $cat): 
        $isActive = ($idCategoria == $cat['id_categoria']) ? 'active' : ''; ?>
        <a href="?cidade=<?= $idCidade ?>&categoria=<?= $cat['id_categoria'] ?>" class="btn btn-outline-primary <?= $isActive ?>">
          <?= htmlspecialchars($cat['categoria']) ?>
        </a>
      <?php endforeach; ?>
    </div>
  </div>

  <!-- Seleção de cidade -->
  <div class="container my-4 text-center">
    <form method="GET" action="pontos.php" class="mt-4">
      <select name="cidade" class="form-select w-50 mx-auto" required onchange="this.form.submit()">
        <option selected disabled>Selecione uma cidade</option>
        <?php foreach ($listaCidades as $cidade): ?>
          <option value="<?= htmlspecialchars($cidade['id_cidade']) ?>" <?= $cidade['id_cidade'] == $idCidade ? 'selected' : '' ?>>
            <?= htmlspecialchars($cidade['cidade']) ?>
          </option>
        <?php endforeach; ?>
      </select>
    </form>
  </div>

  <!-- Nome da cidade -->
  <div class="container px-4">
    <div class="p-3 text-center rounded my-4" style="background-color: #f0f0f0;">
      <h2 class="mb-0"><?= htmlspecialchars($nomeCidade) ?></h2>
    </div>
  </div>

  <!--  Exibi os pontos turísticos e ao clicar leva para o especifico -->
  <?php if (count($pontos) > 0): ?>
    <section class="lista-pontos container my-5 container-fluid">
      <div class="row">
        <?php foreach ($pontos as $ponto): ?>
          <div class="col-12 col-md-4 mb-4 h-100">
            <a href="especifico.php?id=<?= $ponto['id_ponto'] ?>" class="text-decoration-none text-dark">
              <div class="card h-100 shadow-sm">
                <?php if (!empty($ponto['foto_principal'])): ?>
                  <img src="../IMAGES/<?= htmlspecialchars($ponto['foto_principal']) ?>"
                       class="card-img-top"
                       alt="<?= htmlspecialchars($ponto['ponto_turistico']) ?>"
                       style="height: 200px; object-fit: cover;">
                <?php endif; ?>
                <div class="card-body text-center">
                  <h5 class="card-title"><?= htmlspecialchars($ponto['ponto_turistico']) ?></h5>
                </div>
              </div>
            </a>
          </div>
        <?php endforeach; ?>
      </div>
    </section>
  <?php else: ?>
    <p class="aviso text-center mt-5">Nenhum ponto turístico encontrado para esta cidade<?= $idCategoria ? " e categoria selecionada." : "." ?></p>
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