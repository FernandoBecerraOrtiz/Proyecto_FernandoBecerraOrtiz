import $ from "jquery";
import 'flowbite';

$(function() {
    $(document).on('click', '#stop, #play', function() {
        let video = document.getElementById('video');
        $("#video").toggleClass("stopped")

        if ($(video).hasClass('stopped')) {
            video.pause();
        } else {
            video.play();
        }

        $('#stop, #play').toggle();
    })
})
