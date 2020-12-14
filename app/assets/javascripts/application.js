// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require activestorage
//= require turbolinks
//= require_tree .

function ValidateBandForm() //jquery validation for the forms
{
  $('#BandForm').validate({
    rules:{
      'band[name]': { required: true},
    },
    messages: {
      'band[name]': { required: "You must enter the name of the band."},
    }
  });
}

function ValidateAlbumForm()
{
  $('#AlbumForm').validate({
    rules:{
      'album[name]': { required: true},
      'album[year]': {min:1900, max:2021}, //resonable year range for albums
    },
    messages: {
      'album[name]': { required: "You must enter the name of the album."},
      'album[year]': { min:"Enter a year above 1900", max:"Enter a year bellow 2021"},
    }
  });
}

function ValidateSongForm()
{
  $('#SongForm').validate({
    rules:{
      'song[name]': { required: true},
      'song[minutes]': {min:0},
      'song[seconds]': {min:0, max:60},//cant have more than 60 seconds in a minute
    },
    messages: {
      'song[name]': { required: "You must enter the name of the song."},
      'song[minutes]': { min:"Must be above 0"},
      'song[seconds]': {min:"Must be above 0", max:"Must be bellow 60"},
    }
  });
}


function ValidateContactForm()
{
  $('#ContactForm').validate({
    rules:{
      'contact[name]': { required: true},
      'contact[email]': {required: true, email:true}, //must be valid email
      'contact[message]':{required: true},
    },
    messages: {
      'contact[name]': { required: "You must enter your name."},
      'contact[email]': { email:"Enter a valid email.", required:"You must enter your email."},
      'contact[message]':{required: "You must enter a message"},
    }
  });
}
//accessibility options, I rushed it so it isnt very good.
function SetFontSize(val){
  $("*").each(function(i,e){e.style.fontSize = val});
}

function SetPageStyle(val){

  if(val === 'Normal'){
    $("*").each(function(i,e){e.style.background = "white"});
    $("*").each(function(i,e){e.style.color = "black"});
  }
  else{
    $("*").each(function(i,e){e.style.background = "black"});
    $("*").each(function(i,e){e.style.color = "white"});
  }
}
//Sidebar code
function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.getElementById("main_content").style.marginLeft = "250px";

}

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
  document.getElementById("main_content").style.marginLeft = "0";
}

$(document).ready(function(){ //checks which form it is in to validate.
  if (document.getElementById("BandForm")){
    ValidateBandForm();
  }
  if (document.getElementById("AlbumForm")){
    ValidateAlbumForm();
  }
  if (document.getElementById("SongForm")){
    ValidateSongForm();
  }
  if (document.getElementById("ContactForm")){
    ValidateContactForm();
  }
});
