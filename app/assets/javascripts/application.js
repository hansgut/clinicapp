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
//= require jquery
//= require rails-ujs
//= require materialize-sprockets
//= require materialize
//= require_tree .
$(document).ready(function(){
  $('.datepicker').pickadate({
            selectMonths: true,
            selectYears: 100,
            min: new Date(1918,1,1),
            max: Date.now(),
            format: 'dd.mm.yyyy',
            closeOnSelect: true,
            closeOnClear: true
        });
  $('.dropdown-button').dropdown();
  $(".button-collapse").sideNav();
  $('.tabs').tabs();
  $('.modal').modal();
  $('select').material_select();
  $('#send').click(function(){
    sleep(1).then(()=>{
      $('#area').val('');
    });
  });
});

function sleep (time) {
  return new Promise((resolve) => setTimeout(resolve, time));
}

function cross_click() {
  $('#area').val('');
}
