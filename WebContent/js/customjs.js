$(function () {
    $("#collectpollingform").submit(function () {


        var collected = 0;
        $(':radio').each(function () {
            collected++;
        });

        console.log($(':radio:checked').length);
        
        
        if(collected % 4 != 0){
            
            collected++;
            
        }
        
        console.log(collected);

        if ($(':radio:checked').length !== ((collected) / 4)) {
            bootbox.alert("Please fill all the data.", function () {


            });
            return false;
        } else
            return true;


    });
});



$(function () {
    $('#state').on('change', function () {
        var value = this.value;

        $("#district").val("");
        $("#zipcode").val("");

        console.log(value);

        $(".districtcode").addClass('hide').removeClass('show');
        $(".districtcodeoption" + value).addClass('show').removeClass('hide');

    });

    $('#district').on('change', function () {
        var value = this.value;
        $("#zipcode").val("");


        $(".zipcode").addClass('hide').removeClass('show');
        $(".zipcodeoption" + value).addClass('show').removeClass('hide');

    });

    $('#zipcode').on('change', function () {
        var value = this.value;
    });

    $('#zipcode').on('click', function () {
        var value = this.value;
    });
});
