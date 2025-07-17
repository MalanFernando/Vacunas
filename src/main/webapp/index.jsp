<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sistema de Registro de Vacunas</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<header class="header">
  <nav class="menu">
    <ul class="menu-nav">
      <li class="menu-logo"><span><strong>VACU</strong></span></li>
      <li class="nav-link"><a href="">Acerca de</a></li>
      <li class="nav-link"><a href="">Aprender mas</a></li>
      <li class="nav-link"><a href="">Mapas</a></li>
    </ul>
    <a class="menu-btn" href="register.jsp">Registrate</a>
  </nav>
</header>
<main class="main">
  <section class="main-message">
    <div class="msg">
      <h2 class="msg-title">Vacunación temprana</h2>
      <p class="msg-text">
        Gracias a la iniciativa de las instituciones publicas
      </p>
    </div>
    <ul class="main-sponsors">
      <li class="sps-msp">MSP</li>
      <li class="sps-dmq">Distrito Metropolitano de Quito</li>
      <li class="sps-hsf">Hospital San Francisco</li>
      <li class="sps-hca">Hosp. Carlos Andrade Marin</li>
    </ul>
  </section>
  <div class="main-form">
    <div class="form-head">
      <h3 class="hd-title">Iniciar Sesión</h3>
      <p>Lorem ipsum dolor sit, amet consectetur adipisicing
      </p>
    </div>
    <form class="form-content" action="LoginController" method="post">
      <div class="form-group">
        <label for="cedula">Numero de cédula <span>*</span></label>
        <input type="text" id="cedula" name="cedula" placeholder="0123456789" required pattern="[0-9]{10}"
               title="La cédula debe tener 10 dígitos">
      </div>
      <div class="form-group">
        <label for="password">Contraseña <span>*</span></label>
        <input type="password" id="password" name="password" required>
      </div>
      <button type="submit" class="form-btn">Iniciar sesion</button>
      <a href="forgot-password.jsp" class="form-recover"><strong>¿Olvidaste tu contraseña?</strong></a>
    </form>
    <p class="form-link">¿No tienes una cuenta? <a class="link-reg" href="register.jsp"><strong> Regístrate
      aquí</strong></a></p>
  </div>
  </div>
</main>
<footer class="footer">
  <img src="" alt="logo Instituto">
  <p>Lorem ipsum dolor sit amet consectetur cumque, adipisci ut totam.</p>
</footer>
</body>
</html>