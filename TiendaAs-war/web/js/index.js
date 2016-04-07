var carrito = 0;
var listCarrito = {};

$(document).ready(function () {
    $(".button-collapse").sideNav();
    $('.modal-trigger').leanModal();
    searchProduct();
});
function searchProduct() {
    $("#buscadorProducto").on('keyup', function () {
        var value = $(this).val();
        var lista = $("#listProduct").find("li");
        for (var i = 0; i < lista.length; i++) {
            var li = lista[i];
            var idPrdoducto = $(li).attr("id");
            if (idPrdoducto.indexOf(value) == -1) {
                $(li).hide();
            } else {
                $(li).show()
            }
        }
        console.log(value);
    }).keyup()
}

function addProduct(id) {
    if ($("#" + id).is(':checked')) {
        carrito++;
        sendProduct(id);
        $("#selectingProduct").removeClass("disabled");
    } else if (carrito != 0) {
        carrito--;
        removeProduct(id);
    }
    if (carrito == 0) {
        $("#selectingProduct").addClass("disabled");
    }
    $("#valueCarrito").text(carrito);
}
function sendProduct(id) {
    $.get("FrontController", {id: id, controller: "ControllerAddProducto"}, function (data) {
        console.log(data);
    });
}
function removeProduct(id) {
    $.get("FrontController", {id: id, controller: "ControllerRemoveProduct"}, function (data) {
        console.log(data);
    });
}
function deleteRowPrdoduct(id) {
    $("#" + id).remove();
    removeProduct(id);
}
function showList() {
    if (carrito != 0) {
        window.location.href = "/LayautPresentation/FrontController?controller=ControllerSelectedProduct";
    }
}
function sendPersonalInformation()
{
    $('#modalPersonalInformation').closeModal();
    $("#formPersonalInformation").submit();
}