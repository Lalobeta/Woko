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
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require popper.js/dist/umd/popper
//= require bootstrap/dist/js/bootstrap
//= require summernote/summernote-bs4.min
//= require commontator/application


$(document).on('turbolinks:load', function () {
  console.log("ready!!");
  $('[data-provider="summernote"]').each(function () {
    $(this).summernote({
      focus: true,
      height: 300
    });
  });
});


$(document).on("turbolinks:load", () => {
  if ($('.upload-hider-labels').length > 0) {
    $('.upload-hider-labels').each(function() {
      return $(this).closest('.form-group').find('.upload-hider-fields').hide();
    });
  }

  $('form').on('click', '.replace-upload', function(e) {
    var uploadFields, uploadLabels;
    e.preventDefault();
    uploadLabels = $(this).closest('.upload-hider-labels');
    uploadFields = $(this).closest('.form-group').find('.upload-hider-fields');
    uploadLabels.hide();
    return uploadFields.show();
  });
})