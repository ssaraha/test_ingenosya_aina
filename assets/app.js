/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
import './styles/app.scss';

import $ from 'jquery';

// start the Stimulus application
import './bootstrap';

$('document').ready(function(){
    $('#selected_choix').change(function(){
        if ( $(this).val() == 1 ) {
            console.log($(this).val())
            $('#div-dirigeant').css('display', 'block');
            $('#div-societe').css('display', 'none');

        }
        else if ( $(this).val() == 2 ) {
            console.log($(this).val())
            $('#div-societe').css('display', 'block');
            $('#div-dirigeant').css('display', 'none');
        }
        else {
            console.log($(this).val())
            $('#div-societe').css('display', 'none');
            $('#div-dirigeant').css('display', 'none');
        }
        
    });

    $('#societe_codepostal').change(function(){
        $.ajax({
            type: 'GET',
            url: '/ville',
            data: {id_code_postale: $(this).val()},
            success: function(response){
                let rep = response['villes'] ;
                $.each(rep, function(i, item) {
                    $('#societe_ville').html();
                    $('#societe_ville').append('<option value="' + item['name'] + '">' + item['name'] + '</option>');
                });
            }
        });
    });
});
