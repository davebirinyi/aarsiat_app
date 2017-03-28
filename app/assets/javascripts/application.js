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

    $(".hide_me").hide();
    $("#1").show();

    $("#members_in_party_members_in_party").change(function(){
      var members_in_party = this.value;
    if(members_in_party==1)
      $("#1").show();
      $("#2,#3,#4,#5,#6").hide();
    
    if(members_in_party==2)
      $("#1,#2").show();
      $("#3,#4,#5,#6").hide();
   
    if(members_in_party==3)
      $("#1,#2,#3").show();
      $("#4,#5,#6").hide();

    if(members_in_party==4)
      $("#1,#2,#3,#4").show();
      $("#5,#6").hide();

    if(members_in_party==5)
      $("#1,#2,#3,#4,#5").show();
      $("#6").hide();

    if(members_in_party==6)
      $("#1,#2,#3,#4,#5,#6").show();

    });


});



