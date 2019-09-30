$(function () {

    $(document).on("click", ".url-card:not('.active, .card-link')",function() {
        $('.url-card').not($(this)).removeClass('active').find('span').removeClass('text-danger');
        $(this).toggleClass('active').find('span').toggleClass('text-danger');
        getUrl($(this).data('url-id'));
    });

    $('.url-card').first().click();

    function getUrl(urlId) {
        $.get(`app/urls/${urlId}`);
    }
});