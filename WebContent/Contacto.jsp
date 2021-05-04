<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="ISO-8859-1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portal Web Aboreto Carmelo Palma - Contacto</title>
  
  <!-- Icon -->
  <jsp:include page="imgShortIcon.jsp" />  

  <!-- CSS boostrap-->
  <link rel="stylesheet" href="css/bootstrap.min.css">

  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <link rel="stylesheet" href="css/styles3.css">

  <!-- FONT AWESOME -->
  <script src="https://kit.fontawesome.com/78a455df4c.js" crossorigin="anonymous"></script>


</head>

<body>

  <!-- Menu -->
  <jsp:include page="mainMenus.jsp" />

  <!-- Contenido -->
  <div class="container contact">
    <div class="row">
      <div class="col-md-3">
        <div class="contact-info text-light ">
          <img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image" />
          <h4>Contactonos</h4>
          <h4>¡Estamos a tu disposición!</h4>
        </div>
      </div>
      <div class="col-md-9">
        <div class="contact-form">
          <div class="form-group">
            <label class="control-label col-sm-2" for="fname">Nombres:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="fname" placeholder="" name="fname">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="lname">Apellidos:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lname" placeholder="" name="lname">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="email">Correo:</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" id="email" placeholder="" name="email">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="Descripción">Descripción:</label>
            <div class="col-sm-10">
              <textarea class="form-control" rows="5" id="comment"></textarea>
            </div>
          </div>
          <div class="form-group"><br>
            <div class="col-sm-offset-2 col-sm-10">
              <button type="submit" class="btn btn-default">Enviar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<!-- Javascript -->
<link rel="stylesheet" href="js/bootstrap.min.js">
<script defer src="./js/index.js"></script>

<!-- Boostrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
  integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
  integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

</html>