(function($){
    $(document).ready(function() {
        $('#device-list-view').click(function() {
            $('#device-filter').removeClass('hidden');
            $('#device-list-view').addClass('active');
            $('#device-map-view').removeClass('active');

            $('#device-map').addClass('hidden');
            $('#device-list').removeClass('hidden');
        });
        $('#device-map-view').click(function() {
            $('#device-filter').addClass('hidden');
            $('#device-list-view').removeClass('active');
            $('#device-map-view').addClass('active');

            $('#device-map').removeClass('hidden');
            $('#device-list').addClass('hidden');
        });
    });
})(jQuery);