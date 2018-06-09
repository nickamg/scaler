var notas = ["c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b"];

function encontrarNota(nota) {
    for(var i = 0; i < notas.length; i++) {
        if(nota == notas[i]) {
            return i;
        }
    }
    return null;
}

function avanzarNotas(tonica, distancia) {
    var nota = encontrarNota(tonica);
    for(var i = 0; i < distancia - 1; i++) {
        if(nota == notas.length - 1) {
            nota = 0;
        } else {
            nota++;
        }
    }
    return notas[nota];
}

$(document).ready(function(){
    $("#btnCalcular").click(function() {
        alert(avanzarNotas($("#txtTonica").val(), parseInt($("#txtDistancia").val())));
    });
});