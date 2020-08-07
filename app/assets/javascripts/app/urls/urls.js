$(function () {
  $(document).on("click", ".url-card:not('.active, .card-link')", function () {
    $('.url-card').not($(this)).removeClass('active').find('a').removeClass('text-danger');
    $(this).toggleClass('active').find('a').toggleClass('text-danger');
    getUrl($(this).data('url-id'));
  });

  function getUrl(urlId) {
    $.get(APP_BASE_URL + 'app/urls/' + urlId);
  }

  $('.url-card').first().click();
});