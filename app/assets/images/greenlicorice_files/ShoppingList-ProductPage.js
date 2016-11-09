//myList


//<!--- Shopping List Handlers---> 

$jq(document).ready(function () {
    $jq('a.signIn').each(function () {
        var href = $jq(this).attr('href');
        var currentURL = window.location.pathname;
        $jq(this).attr('href', href + '?target=' + currentURL);
    });


    $jq(".guest-list-link").on("click", function () {
        var productID = $jq("#bb-productID").val();
        $jq.ajax({
            type: "POST",
            url: "/ShoppingListXHRMethods.aspx/AddToDefaultList",
            data: "{productId:'" + productID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $jq("#lists-redirect-action a").show();
                $jq("#lists-add-action").hide();
            }
        });
    });
    $jq(".list").on("click", function () {
        $jq("#pbDialog-listsErr").dialog("option", "modal", true).dialog("close");
        var contextElement = $jq(this);
        var productID = $jq("#bb-productID").val();
        $jq.ajax({
            type: "POST",
            url: "/ShoppingListXHRMethods.aspx/AddItemToList",
            data: "{productId:'" + productID + "'" + ",shoppingListId:" + $jq(this).data('list-id') + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: onSuccess,
            error: onError
        });
    });
});
function createList() {    
    var listName = $jq("#list-create-new").val();
    var productID = $jq("#bb-productID").val();
    if ($jq.trim(listName) == "") {

        $jq("#pbDialog-listsErr").dialog("option", "modal", true).dialog("open");
        $jq('#pbDialog-listsErr').css("min-height", '24px');
        $jq('#pbDialog-listsErr').css("text-align", 'center');
        $jq('#pbDialog-listsErr').css("color", 'red');
        $jq('#pbDialog-listsErr').text('Please enter a list name');
        $jq('#pbDialog-listsErr').css("font-size", '130%');
    }
    else {
        $jq("#pbDialog-listsErr").dialog("option", "modal", true).dialog("close");
        if (listName.indexOf('\'') > -1 || listName.indexOf('\\') > -1 || listName.indexOf('<') > -1 || listName.indexOf('>') > -1) {
            listName = listName.replace(/'/g, '%27').replace(/\\/g, '%29').replace(/</g, '').replace(/>/g, '');

        }
        $jq.ajax({
            type: "POST",
            url: "/ShoppingListXHRMethods.aspx/CreateListAndAddItem",
             data: "{listName:'" + listName + "' , productId: '" + productID + "'}",           
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: onSuccess,
            error: onError
        });
    }
}

function onSuccess(response) {
    $jq("#pbDialog-listsPop").dialog("close");
    $jq("#pbDialog-addList .list-name").html(response.d.Name + " (" + response.d.ItemCount + ")");
    $jq("#pbDialog-addList .list-name").attr("href", "/MyAccount/MyFavorites.aspx?ld=" +

response.d.ShoppingListId);
    $jq("#pbDialog-addList").dialog("option", "position", {
        my: "center", at: "center", of
    : "#lists-add-action"
    }).dialog("option", "modal", true).dialog("open");
    $jq("#lists-redirect-action a").show();
    $jq("#lists-add-action").hide();
    $jq("#list-create-new").val('');
}
function onError(xhr) {
    var responseText;
    responseText = xhr.statusText;
    $jq("#pbDialog-listsPop").dialog("close");
    $jq("#pbDialog-listsErr").dialog("option", "modal", true).dialog("open");
    $jq('#pbDialog-listsErr').css("min-height", "0px");
    $jq('#pbDialog-listsErr').css("text-align", 'center');
    $jq('#pbDialog-listsErr').css("color", 'red');
    $jq("#pbDialog-listsErr").text(responseText);
    $jq('#pbDialog-listsErr').css("font-size", '130%');
    $jq("#list-create-new").val('');
}
//	<!--- /Shopping List Handlers ---> 