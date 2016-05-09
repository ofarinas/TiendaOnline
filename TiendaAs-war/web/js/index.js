var carrito = 0;
var listCarrito = {};
var pdf = "";
$(document).ready(function () {
    var carrito = $("#valueCarrito").val();
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
        $("#total").text(data);
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

function createPdf()
{
    $('#modalPersonalInformation').closeModal();
    var doc = new jsPDF();
    doc.setFontSize(40);
    doc.fromHTML(pdf);
    doc.save();
    window.location.href = "/LayautPresentation/FrontController";
}

function sendPurchase(pdfValue) {
    var dni = $("#dni").val();
    var name = $("#name").val();
    var address = $("#address").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    if (dni == "" || name == "" || address == "" || phone == "" || email == "") {
        var $toastContent = $('<span>There is field empty</span>');
        Materialize.toast($toastContent, 3000, 'rounded', function () {
            $("#modalPersonalInformation").closeModal();
        });

    } else {
        $.get("../FrontController", {controller: "ControllerPurchase", pdf: pdfValue, dni: dni, name: name, address: address, phone: phone, email: email}, function (data) {
            pdf = data
            console.log("todo bien");
            $("#modalPersonalInformation").openModal();
        });
    }
}
//request.getParameter("dni"), request.getParameter("name"), request.getParameter("address"), request.getParameter("email"), request.getParameter("phone")