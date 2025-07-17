<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Registro de Usuario</title>
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
      <h3 class="hd-title"><strong>Registrate</strong></h3>
      <p>Ingrese los datos del menor de edad para el registro</p>
    </div>
    <form class="form-content" action="RegisterController" method="post">
      <div class="form-group">
        <label for="cedula">Cédula <span>*</span></label>
        <input type="text" id="cedula" name="cedula" required pattern="[0-9]{10}"
               title="La cédula debe tener 10 dígitos">
      </div>
      <div class="form-group">
        <label for="nombre">Nombre <span>*</span></label>
        <input type="text" id="nombre" name="nombre" required>
      </div>
      <div class="form-group">
        <label for="email">Email(opcional)</label>
        <input type="email" id="email" name="email">
      </div>
      <div class="form-group">
        <label for="password">Contraseña <span>*</span></label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="form-group">
        <label for="confirm_password">Confirmar Contraseña <span>*</span></label>
        <input type="password" id="confirm_password" name="confirm_password" required>
      </div>
      <div class="form-group">
        <h5>Indica si eres personal medico<span>*</span></h5>
        <ul class="group-rol">
          <li>
            <input type="radio" id="rol_doctor" name="rol" value="DOCTOR" required>
            <label for="rol_doctor">Si</label>
          </li>
          <li>
            <input type="radio" id="rol_user" name="rol" value="USER" checked>
            <label for="rol_user">No</label>
          </li>
        </ul>
      </div>
      <button type="submit" class="form-btn">Registrarse</button>
    </form>
    <p class="form-link">¿Ya tienes una cuenta? <a class="link-reg" href="login.jsp"><strong> Inicia
      sesión</strong></a></p>
  </div>
</main>
<footer class="footer">
  <img src="" alt="logo Instituto">
  <p>Lorem ipsum dolor sit amet consectetur cumque, adipisci ut totam.</p>
</footer>
</body>
</html>