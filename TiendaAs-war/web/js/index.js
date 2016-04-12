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
    window.location.href = "/LayautPresentation/FrontController";
//    $("#formPersonalInformation").submit();
}
function sendPurchase(){
    var dni=$("#dni").val();
    var name=$("#name").val();
    var address=$("#address").val();
    var phone=$("#email").val();
    var email=$("#phone").val();
    $.get("../FrontController", {controller: "ControllerPurchase",dni:dni,name:name,address:address,phone:phone,email:email}, function (data) {
        console.log("todo bien");
        $("#modalPersonalInformation").openModal();
    });
}
//request.getParameter("dni"), request.getParameter("name"), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone")