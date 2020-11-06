$(document).ready(function(){
  //CATEGORIE
//il div dialog è nasosto di default
  $('#dialog_form_cat').hide();
  $('#select_cat').val("");
//select_cat change
  $(document).on('change', '#select_cat',function(){
    if($('#select_cat').val()==="new"){
      $('#dialog_form_cat').dialog();
    }
  $('#add_cat').click(function(){
    var desc = $('#desc_new_cat').val();
    if(desc!==""){

      $.ajax({
        url:"new_category.php",
        dataType:"html",
        method: "POST",
        data: {"descrizione":desc},
        success:function(html){
          //quello che succede se la richiesta è andata a buon fine
          if(html!=="False"){
            $('#select_cat').prepend(html);
            $('#select_cat').find('option:eq(0)').prop('selected', true);
          } 
          $('#dialog_form_cat').dialog("close");
        }
      });

    }

  });
});




//DELETE COMMENT
function deleteClick1 () {
    deleteComment($(this).data('id'));
}

function deleteComment(id) {
    $.ajax('delete_comment.php', {
        type: 'POST',
        data: {
            id: id
        },
        success: function() {
            //Ajax successful: remove the comment div from your comment area
            $('#comm_' + id).remove();
            $('#elimina' + id).remove();
        },
        error: function() {
            //Ajax not successful: show an error
            alert('An error occured while deleting the comment!');
        }
    });
}
$('.eliminacomm').click(deleteClick1);


//DELETE POST
function deletePost(id,blog) {
    $.ajax('delete_post.php', {
        type: 'POST',
        data: { id: id, blog: blog },
        success: function() {
            //Ajax successful: remove the comment div from your comment area
            $('#post_' + id).remove();
            $('#elimina' + id).remove();
            window.location.href="show_blog.php?blog=" + blog;
        },
        error: function() {
            //Ajax not successful: show an error
            alert('An error occured while deleting the post!');
        }
    });
}
//DIALOG CONFIRMATION OF DELETING
$('.eliminapost').click(function(){
  $( "#dialog_post" ).dialog({
    resizable: false,
    height: "auto",
    width: 400,
    modal: true,
    buttons: {
      "Conferma": function() {
        $( this ).dialog( "close" );
        deletePost($(".eliminapost").data('id'),$(".turnback").data('id'));
      },
      "Annulla": function() {
        $( this ).dialog( "close" );
      }
    }
  });
});





//DELETE BLOG
function deleteBlog(id) {
    $.ajax('delete_blog.php', {
        type: 'POST',
        data: {
            id: id
        },
        success: function() {
            //Ajax successful: remove the comment div from your comment area
            $('#blog_' + id).remove();
            $('#elimina' + id).remove();
              window.location.href="home.php";
        },
        error: function() {
            //Ajax not successful: show an error
            alert('An error occured while deleting the blog!');
        }
    });
}
//DIALOG CONFIRMATION OF DELETING
$('.eliminablog').click(function(){
  $( "#dialog_blog" ).dialog({
    resizable: false,
    height: "auto",
    width: 400,
    modal: true,
    buttons: {
      "Conferma": function() {
        $( this ).dialog( "close" );
        deleteBlog($(".eliminablog").data('id'));
      },
      "Annulla": function() {
        $( this ).dialog( "close" );
      }
    }
  });
});



//DELETE ACCOUNT
function deleteAccount(id) {
    $.ajax('delete_account.php', {
        type: 'POST',
        data: {
            id: id
        },
        success: function() {
            //Ajax successful: remove the comment div from your comment area
            window.location.href="index.php";
        },
        error: function() {
            //Ajax not successful: show an error
            alert('An error occured while deleting the account!');
        }
    });
}
//DIALOG CONFIRMATION OF DELETING
$('.eliminaprofilo').click(function(){
  $( "#dialog_profilo" ).dialog({
    resizable: false,
    height: "auto",
    width: 400,
    modal: true,
    buttons: {
      "Conferma": function() {
        $( this ).dialog( "close" );
        deleteAccount($(".eliminaprofilo").data('id'));
      },
      "Annulla": function() {
        $( this ).dialog( "close" );
      }
    }
  });
});




//AUTOCOMPLETE SEARCHBAR
 $("#searchbar").keyup(function(){
    $("#result").empty();
    $("#result").css("display", "none");
    var string = $(this).val();
    if (string != ""){
      $.post("searchbar.php", //pagina richiamata
        {"string":string}, //data:
        function(data){ //success:
          if (data != "False"){
            $("#result").css("display", "inline-block");
            $("#result").append(data);
            $(".results").css("cursor","pointer");
            $(".results").on('click', function(){
              $("#searchbar").val(this.value);
              window.location.href= this.href;
              $("#result").empty();
            });
          }
        },
    'json');
  }; //chiusura if(string !empty)
   }); //chiusura keyup


}); //fine
