<!-- Faz a ligação com a lógica principal -->
<?php include 'COMPONENTES/indexdados.php'; ?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Explore Já</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="./CSS/style.css">
  <link rel="stylesheet" href="./CSS/modal.css">
  <style>
    a:visited {
      color: #fff;
    }
  </style>
</head>
<body>

<div class="fundoinicial">
  <header>
    <nav class="navbar navbar-expand-lg">
      <div class="container-fluid">
        <div class="d-flex align-items-center">
          <a class="navbar-brand me-3" href="#">
            <img src="./IMAGES/Explore.png" alt="Logo Explore Já" class="img-fluid logo-img">
          </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNavbar">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            
            <!-- Se estiver na conta é exibido o nome e ele possuí a opção de deslogar-->
            <?php if ($usuarioLogado): ?>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <i class="bi bi-person-circle me-2"></i> <?= htmlspecialchars($usuarioLogado) ?>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                  <li><a class="dropdown-item text-danger" href="PHP/CONTA/deslogar.php">Sair</a></li>
                </ul>
              </li>
              <?php else: ?>
                <li class="nav-item">
                  <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalConta">
                    <i class="me-1"></i> Acesse sua conta
                  </a>
                </li>
                <?php endif; ?>

            <li class="nav-item"><a class="nav-link" href="PHP/favoritos.php">Favoritos</a></li>
            <li class="nav-item"><a class="nav-link" href="PHP/sobrenos.php">Sobre</a></li>
              </ul>
            </div>
          </div>
        </nav>
    </header>

  <div class="container-fluid divimagem text-center">
    <section class="banner-principal">
      <div class="container text-center text-white">
        <h1 class="fw-bold">Tá na dúvida de onde ir?</h1>
        <p>Explore os destinos mais incríveis de sua cidade!</p>
      </div>
    </section>

    <!-- O usuário pode selecionar a cidade, e depois de fazer isso
     o id da cidade é enviado via GET para a página de pontos -->
    <form action="PHP/pontos.php" method="GET" class="mt-4">
      <select name="cidade" class="form-select w-50 mx-auto" required>
        <option selected disabled>Selecione uma cidade</option>
        <?php foreach ($cidades as $cidade): ?>
          <option value="<?= htmlspecialchars($cidade['id_cidade']) ?>">
            <?= htmlspecialchars($cidade['cidade']) ?>
          </option>
        <?php endforeach; ?>
      </select>
      <button type="submit" class="btn mt-3 fw-bold">Explorar</button>
    </form>
  </div>
</div>

<!-- Modalzinho com a opção de fazer login ou cadastro -->
<div class="modal fade" id="modalConta" tabindex="-1" aria-labelledby="modalContaLabel">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="text-center">
        <h5 class="modal-title titulo-modal" id="modalContaLabel">Bem-vindo!</h5>
      </div>
      <div class="position-absolute top-0 end-0 m-3">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
      </div>
      <div class="modal-body text-center mt-4">
        <div class="d-grid gap-4 mt-4">
          <a href="./PHP/CONTA/login.php" class="btnlogin">Fazer Login</a>
          <a href="./PHP/CONTA/cadastro.php" class="btncadastro">Cadastrar-se</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!--  Exibi os pontos turísticos aleatórios e ao clicar leva para o especifico -->
<div class="container-fluid divclaro px-3">
  <div class="row g-4 py-5 justify-content-center">

    <?php foreach ($pontosAleatorios as $ponto): ?>
      <div class="col-12 col-md-4">
        <a href="PHP/especifico.php?id=<?= $ponto['id_ponto'] ?>" class="text-decoration-none text-dark">
          <div class="card h-100 shadow-sm">
            <?php if (!empty($ponto['foto_principal'])): ?>
              <img src="./IMAGES/<?= htmlspecialchars($ponto['foto_principal']) ?>"
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
</div>


<footer class="footer-site text-center text-light py-4">
  <div class="container">
    <p class="mb-1">© 2025 Explore Já. Todos os direitos reservados.</p>
    <p class="mb-0">
      <a href="#" class="link-footer">Política de Privacidade</a> |
      <a href="#" class="link-footer">Termos de Uso</a>
    </p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>