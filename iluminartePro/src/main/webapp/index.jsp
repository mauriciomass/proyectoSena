<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IluMinarte- Inicio</title>

    <!-- Styles -->
     
     <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
     
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="css/stylescar.css"> 
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
   <!--   <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">-->

<body>

	
  <header id="header">    
    <nav class="menu">

   
      <a href="index.jsp"><img class="logo" src="img/iluminarte.png" alt="logo"></a>
         <div class="nav">
         <li><a href="indexA.html">  Sobre nosotros </a> </li>  
         <li><a href="indexA.html">  Contactanos</a> </li>  
         <li><a href="indexA.html">  Tienda </a> </li>       
         
        </div>

         <div class="list-container">
             <ul class="lists">
                 <li><a href="UsuarioController?accion=abrirLogin" class="fas fa-user-tie"></a></li>     
              <li><a href="index.jsp" class="fas fa-cart-arrow-down"></a></li>           
              </ul>
         </div>
     </nav>

  



     <section class="carousel">
     
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">                  
          <img src="assets/img/img2.jpg" class="d-block w-100" alt="Galeria">                
        </div>
        <div class="carousel-item">
          <img src="assets/img/img3.jpg" class="d-block w-100" alt="Galeria">
        </div>
        <div class="carousel-item">
          <img src="assets/img/img4.jpg" class="d-block w-100" alt="Galeria">
        </div>
        <div class="carousel-item">
          <img src="assets/img/img5.jpg" class="d-block w-100" alt="Galeria">
        </div>
        <div class="carousel-item">
          <img src="assets/img/img6.jpg" class="d-block w-100" alt="Galeria">
        </div>
        <div class="carousel-item">
          <img src="assets/img/img7.jpg" class="d-block w-100" alt="Galeria">
        </div>
        <div class="carousel-item">
          <img src="assets/img/img8.jpg" class="d-block w-100" alt="Galeria">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </section>


  <hear2>
    
            <nav class="nav">
              
              <div class="user">       
               Tienda       
            </div>
          
           
                <li><a href="indexA.html">  <i class="fas fa-home"></i> Residencial </a> </li>  
                <li><a href="indexA.html">  <i class="fas fa-building"></i> Comercial </a> </li>  
                <li><a href="indexA.html">  <i class="fas fa-city"></i> Industrial </a> </li>  
                <li><a href="indexA.html">  <i class="fas fa-lightbulb"></i> Electricos </a> </li>  
                <li><a href="indexA.html">  <i class="fas fa-phone-volume"></i> Contactanos </a> </li>  
                 
                             
                        
               
            
        </nav>
    
    </header> 
     
    <!-- About Us -->
    <section class="about-us">
        <div class="info">
            <h3>Acerca de nosotros</h3>
            <p>Somos una empresa que desea expandir sus productos a nivel nacional creando el mayor impacto por medio de ideas creativas,que permiten iluminar tus espacios con estilo.</p>
            <hr>
        </div>
       
    </section>

    <!-- Gallery -->
    <section class="gallery-section">
       
             

        <!-- Modal -->
         <div class="modal">
             <span id="closeModal"><i class="fas fa-times"></i></span>
             <img id="imgModal">
             <p id="caption"></p>
         </div>

    </section>
   

 <!-- Footer -->
 
 <footer class="site-footer">
  <div class="footer-top-area">
  <div class="container">
     <div class="row">
      <div class="col-lg-3 col-sm-6 col-12"><div id="metro_about-2" class="widget widget_metro_about"> 	
        <ul> 
        <span class="rtin-content"></span>
        <b><br>        
        <b>Oficinas:</b><br>
            <b>Carrera 26A N. 39 - 71 <br>
            <b>Bogotá - Colombia<br>
              <p style="margin-top:10px;margin-bottom:0px;margin-left:-40px"><i class="flaticon-phone-call-2" style="padding-right:15px"></i><a class="rtin-content" href="tel:(601)7946664">(+601) 794 66 64</a></p>
              <p style="margin-top:10px;margin-bottom:0px;margin-left:-40px"><i class="flaticon-phone-call-2" style="padding-right:15px"></i><a class="rtin-content" href="tel:(601)7946664">(+57) 319 695 61 25</a></p>
              <p style="margin-top:10px;margin-bottom:0px;margin-left:-25px"><i class="flaticon-envelope"></i><a class="rtin-content" href="mailto:contactanos@lumenconcept.com">contactanos@iluminarte.com</a></p>
         
      </ul>

        </div>
      </div>

      

<div>

  <ul class="nav_menu-2">

    <p><h3>Información:</h3></p>
    <li><a href="https://lumenconcept.com/nosotros/">Nosotros</a></li>
    <li><a href="https://lumenconcept.com/nosotros/">Servicios</a></li>
    <li><a href="https://lumenconcept.com/nosotros/">Proyectos de Iluminación</a></li>
    <li><a href="https://lumenconcept.com/nosotros/">Cotizaciones</a></li>
    <li><a href="https://lumenconcept.com/nosotros/">Contáctanos</a></li>

  </ul>

</div>
</div>
</div>
</div>


<div class="footer-sep"></div>
      <div class="footer-bottom-area footer-bottom-area-new-2">
    <div class="container">
      <div class="footer-bottom-inner">
        <div class="copyright-area">
          <div class="copyright-text">© Copyright Iluminarte 2021.<a target="_blank" href="#"></a></div>
        </div>
        <div class="copyright-area">							
                          <ul class="footer-social">
                                  <li><a target="_blank" href=""><i class="fab fa-facebook"></i></a></li>                                  
                                  <li><a target="_blank" href=""><i class="fab fa-instagram-square"></i></a></li>
                                  <li><a target="_blank" href=""><i class="fab fa-pinterest"></i></a></li>
                        
            </ul>
                        
        </div>
                      <ul class="payment-icons payment-icons-grayscale">
                                                                 
                                  <li><img width="60" height="36" src="https://lumenconcept.com/wp-content/uploads/2020/09/Payment-Visa.png" class="attachment-thumbnail size-thumbnail wp-post-image" alt="" loading="lazy"></li>
                                  <li><img width="60" height="36" src="https://lumenconcept.com/wp-content/uploads/2020/09/Payment-MasterCard.png" class="attachment-thumbnail size-thumbnail wp-post-image" alt="" loading="lazy"></li>
                                  <li><img width="60" height="36" src="https://lumenconcept.com/wp-content/uploads/2020/09/Payment-PSE.png" class="attachment-thumbnail size-thumbnail wp-post-image" alt="" loading="lazy"></li>
                                  <li><img width="60" height="36" src="https://lumenconcept.com/wp-content/uploads/2020/09/Payment-Baloto.png" class="attachment-thumbnail size-thumbnail wp-post-image" alt="" loading="lazy"></li>
                                  <li><img width="60" height="36" src="https://lumenconcept.com/wp-content/uploads/2020/09/Payment-Efecty.png" class="attachment-thumbnail size-thumbnail wp-post-image" alt="" loading="lazy"></li>
                                   </ul>
                  
      </div>
    </div>
  </div>
          </footer>


<!-- Scripts -->
<script src="https://kit.fontawesome.com/35db202371.js" crossorigin="anonymous"></script>
<script src="js/app.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>
</html>