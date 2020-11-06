<nav class="navbar navbar-expand-lg flex-row bg-dark navbar-dark">
<div class="collapse navbar-collapse" id="navbarSupportedContent">
  <a class="navbar-brand" href="home.php">RockYourBlog</a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   <span class="navbar-toggler-icon"></span>
 </button>
  <ul class="navbar-nav mr-auto">
    <li class="nav-item">
      <a class="nav-link" href="divider_profile.php">Profilo</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="blog.php">Crea un blog</a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="divider_premium.php"> Offerta Premium </a>
    </li>
    <?php if(isset($_SESSION['id'])):?>
    <li class="nav-item">
      <a href="logout.php"><input type="button" class="btn btn-dark" name="logout" value="logout"></input></a>
    </li>
  <?php endif;?>
  </ul>

    <form class="form-group my-2 my-lg-0 ui-widget" action="" method="POST" id="search_engine">
      <input id="searchbar" class="form-control mr-sm-2" type="text" name="searchbar" placeholder="Fai una ricerca"></input>
  <!--    <input id="search" type="button" class="btn btn-info" name="search" value="Cerca"> -->
        <span id="result"></span>
    </form>

</nav>

<!-- logged in user information -->
<?php  if (isset($_SESSION['username'])) : ?>
  <div class="container session">
  <h5 class="lead">Ciao, <?php echo $_SESSION['username']; ?>.</h5>
 </div>
<?php endif ?>
<?php if(!isset($_SESSION['username'])) : ?>
  <div class="container">
    <h5 class="font-weight-bold"> Ops, non risulti collegato! Esegui il <a href="index.php" class="headerlink">login</a> o <a href="signup.php" class="headerlink"> registrati</a>.</h5>
  </div>
<?php endif ?>
