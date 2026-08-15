<?php include '../COMPONENTES/especificodados.php'; ?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Informações</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="../CSS/especifico.css" />
  <link rel="stylesheet" href="../CSS/modal.css" />

  <!-- Mostra e esconde o formulário de avaliação -->
  <script>
    function mostrarFormulario() {
      document.getElementById('formAvaliacao').classList.remove('d-none');
      document.getElementById('btnFecharAvaliacao').classList.remove('d-none');
    }
    function fecharFormulario() {
      document.getElementById('formAvaliacao').classList.add('d-none');
      document.getElementById('btnFecharAvaliacao').classList.add('d-none');
    }
  </script>
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

<main class="container my-5">

  <!-- Exibe as mensagens e depois limpa a sessão (Correção do Protti) -->
  <?php if (!empty($_SESSION['flash'])): ?>
    <div class="mb-3">
      <?php foreach ($_SESSION['flash'] as $f): ?>
        <div class="alert alert-<?= htmlspecialchars($f['tipo']) ?> mb-2">
          <?= htmlspecialchars($f['mensagem']) ?>
        </div>
      <?php endforeach; unset($_SESSION['flash']); ?>
    </div>
  <?php endif; ?>

  <!-- Nome do ponto -->
  <div class="p-3 rounded mb-4">
    <h1 class="mb-0"><?= htmlspecialchars($ponto['ponto_turistico']) ?></h1>
  </div>

  <!-- Imagem do ponto -->
  <?php if (!empty($ponto['foto_principal'])): ?>
    <div class="row mb-4">
      <div class="col-md-6">
        <img src="../IMAGES/<?= htmlspecialchars($ponto['foto_principal']) ?>"
             alt="<?= htmlspecialchars($ponto['ponto_turistico']) ?>"
             class="img-fluid float-start me-3 mb-3 rounded"
             style="max-height: 300px; object-fit: cover;">
      </div>
    </div>
  <?php endif; ?>

  <!-- Botão de Favoritar/desfavoritar -->
  <?php if ($idUsuario): ?>
    <form method="POST" class="mb-4"
          action="<?= htmlspecialchars($_SERVER['PHP_SELF']) . '?id=' . urlencode((string)$idPonto) ?>">
      <input type="hidden" name="acao" value="favoritar">
      <button type="submit" name="favoritar" class="btn btn-warning">
        <?= $favoritado
            ? '<i class="bi bi-star-fill me-1"></i> Remover dos Favoritos'
            : '<i class="bi bi-star me-1"></i> Adicionar aos Favoritos' ?>
      </button>
    </form>
  <?php else: ?>
    <p class="text-muted">Você precisa fazer login para favoritar este ponto.</p>
  <?php endif; ?>

  <!-- Exibe as infos do ponto -->
  <div class="row">
    <div class="col-md-7">
      <div class="mb-3">
        <h5><i class="bi bi-info-circle-fill me-2"></i>Descrição</h5>
        <p><?= nl2br(htmlspecialchars($ponto['descricao'])) ?></p>
      </div>
      <div class="mb-3">
        <h5><i class="bi bi-clock-fill me-2"></i>Horário de Funcionamento</h5>
        <p><?= htmlspecialchars($ponto['horario_funcionamento']) ?></p>
      </div>
      <div class="mb-3">
        <h5><i class="bi bi-stars me-2"></i>Principais Atrações</h5>
        <p><?= nl2br(htmlspecialchars($ponto['principais_atracoes'])) ?></p>
      </div>
      <div class="mb-3">
        <h5><i class="bi bi-cash-coin me-2"></i>Preço Médio</h5>
        <p>R$ <?= number_format((float)$ponto['preco_medio'], 2, ',', '.') ?></p>
      </div>
      <div class="mb-3">
        <h5><i class="bi bi-geo-alt-fill me-2"></i>Endereço</h5>
        <p><?= htmlspecialchars($ponto['endereco']) ?> - <?= htmlspecialchars($ponto['cidade']) ?>, <?= htmlspecialchars($ponto['estado']) ?></p>
      </div>

    <!-- Link para Google Maps que pega a Latitude e Logintude que estão no banco 
     (OBS: ia usar API do google Maps, mas ia precisar do cartão de crédito e mother não liberou) -->

      <?php if (!empty($ponto['latitude']) && !empty($ponto['longitude'])): ?>
        <a href="https://www.google.com/maps?q=<?= urlencode($ponto['latitude'] . ',' . $ponto['longitude']) ?>"
           target="_blank" class="btn btn-outline-success mb-3">
          <i class="bi bi-geo-alt-fill me-1"></i> Ver no Google Maps
        </a>
      <?php endif; ?>
    </div>

    <div class="col-md-5">
      <div class="p-4 rounded" style="background-color: #f0f0f0;">
        <h5><i class="bi bi-bus-front-fill me-2"></i>Formas de Acesso</h5>
        <p><?= nl2br(htmlspecialchars($ponto['formas_acesso'])) ?></p>
      </div>
    </div>
  </div>

  <!-- Botões de avaliar, ver avaliações e fechar -->
  <div class="mt-5">
    <h4 class="mb-3">Avaliações</h4>
    <div class="mb-3">
      <button class="btn btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#modalAvaliacoes">Ver Avaliações</button>
      <?php if ($idUsuario): ?>

        <button class="btn btn-primary me-2" onclick="mostrarFormulario()">Avaliar este local</button>
        <button id="btnFecharAvaliacao" class="btn btn-outline-danger d-none" onclick="fecharFormulario()">Fechar avaliação</button>

      <?php endif; ?>
    </div>
  </div>

  <!-- Local para comentar - envia via POST  -->
  <?php if ($idUsuario): ?>
    <form method="POST" id="formAvaliacao" class="mb-4 d-none"
          action="<?= htmlspecialchars($_SERVER['PHP_SELF']) . '?id=' . urlencode((string)$idPonto) ?>">
      <input type="hidden" name="acao" value="comentar">
      <div class="mb-2">
        <label for="feedback" class="form-label">Comentário</label>
        <textarea name="feedback" id="feedback" class="form-control" rows="3" placeholder="Deixe seu comentário..." required></textarea>
      </div>
      <button type="submit" class="btn btn-success">Enviar Avaliação</button>
    </form>
  <?php endif; ?>

  
  <!-- Modalzinho com avaliações de outras pessoas -->
  <div class="modal fade" id="modalAvaliacoes" tabindex="-1" aria-labelledby="modalAvaliacoesLabel">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalAvaliacoesLabel">Avaliações de visitantes</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
        </div>
        <div class="modal-body">
          <?php if (!empty($avaliacoes)): ?>
            <?php foreach ($avaliacoes as $avaliacao): ?>
              <div class="border-bottom pb-2 mb-2">
                <small class="text-muted">
                  <?= htmlspecialchars($avaliacao['usuario']) ?> em <?= date('d/m/Y H:i', strtotime($avaliacao['data_avaliacao'])) ?>
                </small>
                <p class="mb-0"><?= nl2br(htmlspecialchars($avaliacao['feedback'])) ?></p>
              </div>
               <?php endforeach; ?>
               <?php else: ?>
                <p class="text-muted">Nenhuma avaliação ainda. Seja o primeiro a comentar!</p>
                <?php endif; ?>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
              </div>
            </div>
          </div>
        </div>

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
