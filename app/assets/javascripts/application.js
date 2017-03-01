// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

    $(".attendee_row").hide();

    $("#members_in_party_members_in_party").change(function(){
      var members_in_party = this.value;
    if(members_in_party==1)
      $("table:nth-child(5)").show();
      $("table:nth-child(6), table:nth-child(7), table:nth-child(8), table:nth-child(9), table:nth-child(10)").hide();
    
    if(members_in_party==2)
      $("table:nth-child(5), table:nth-child(6)").show();
      $("table:nth-child(7), table:nth-child(8), table:nth-child(9), table:nth-child(10)").hide();
   
    if(members_in_party==3)
      $("table:nth-child(5), table:nth-child(6), table:nth-child(7)").show();
      $("table:nth-child(8), table:nth-child(9), table:nth-child(10)").hide();

    if(members_in_party==4)
      $("table:nth-child(5), table:nth-child(6), table:nth-child(7), table:nth-child(8)").show();
      $("table:nth-child(9), table:nth-child(10)").hide();

    if(members_in_party==5)
      $("table:nth-child(5), table:nth-child(6), table:nth-child(7), table:nth-child(8), table:nth-child(9)").show();
      $("table:nth-child(10)").hide();

    if(members_in_party==6)
      $("table:nth-child(5), table:nth-child(6), table:nth-child(7), table:nth-child(8), table:nth-child(9), table:nth-child(10)").show();

    });


});



