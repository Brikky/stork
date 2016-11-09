/*
Get warehouse inventory by zip code
*/


$jq(document).ready(function ($) {
////////////////////////////////////////////////
    var pParent,
        pID,//Products with detail button don't have SKU numbers. Either change backend to add this to the button or look up by ID.
        msgNoStock = '<span class="errorMsg">Sorry! This item is currently unavailable in your area</span>',
        invZipValue = ""; //This is the zip code the user input

    $('#invZipDialog').dialog({ autoOpen: false });
    $('.inv-zip').on('click', function () {

        pParent = $(this).parents('.product-block');
        pID = $('input[name="productCompare"]', pParent).val();
        $('#invZipDialog').dialog({
            position: { my: "center", at: "top", of: this }
        });
        $("#invZipDialog").dialog("open");
    });

    $('#invZipSubmit').on('click', function () {
        var pattern = /^[0-9]{5}$/;
        if (pattern.test($('#invZipInput').val())) {
            $('#invZipDialog .errorMsg').addClass('hide');
            $("#invZipDialog").dialog('close');
            invZipValue = $('#invZipInput').val();
            $.ajax({
                url: '/Articles/EstimateTransit.aspx',
                cache: false,
                type: 'POST',
                data: { zip: invZipValue },
                dataType: 'json',
                timeout: 15000,
                success: function (data) { InventoryS(data); },
                error: function (jqXHR, stat, err) { InventoryE(null, stat, err, null); }
            });
        }
        else {
            $('#invZipDialog .errorMsg').removeClass('hide');
            $('#invZipInput').val('');
            invZipValue = '';
        }
    });

    //Click button on enter key
    $('#invZipInput').bind('keydown', function (e) {

        if (e.keyCode == 13) {
            $jq('#invZipSubmit').trigger('click');

        }
    });
    ////////////////////////////////////////////////
});



this.InventoryS = function (data) {
    if (data.error) {
        this.InventoryE(null, null, null, data);
        return;
    }
    //reload page to reflect inventory experience updates
    location.reload(true);
}

this.InventoryE = function (jqXHR, stat, err, data) {
    if (data.error) {
        alert(data.error);
    }
}