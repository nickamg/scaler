var scaleName;
var tonicName;

function Scale(name, degrees, tonic) {
    this.name = name;
    this.degrees = degrees;
    this.notes = addNotes(tonic, degrees);

    /*
    las escalas empiezan por la tónica y siguen para adelante
    Las escalas tienen que tener todas las notas (nombres no repetidos)
    Las escalas que tienen en la tónica un sostenido tienen todo sostenidos y viceversa
    Las escalas que tienen a partir 7 (no incluido) alteraciones invierten la tónica
    Los dobles sostenidos cuentan como dos sostenidos
    Cuando la tónica se invierte mostrar mensaje "tal vez quiso decir..."
    */

    function addNotes(tonic, degrees) {
        var noteNames = [["c", "b#"], ["c#", "db"], ["d", "c##"], ["d#", "eb"], ["e", "fb", "d##"], ["f", "e#"], ["f#", "gb", "e##"], ["g", "f##"], ["g#", "ab"], ["a", "g##"], ["a#", "bb"], ["b", "cb", "a##"]];
        var resultNotes = [];
        for(var i = 0; i < degrees.length; i++) {
            resultNotes.push(findNoteByDegree(noteNames, tonic, degrees[i].degree_position));
        }
        checkNotes(tonic, noteNames, resultNotes);
        return resultNotes;
    }

    function checkNotes(tonic, noteNames, resultNotes) {
        var naturalNotes = ["c", "d", "e", "f", "g", "a", "b"];
        var naturalTonic = findNaturalTonic(tonic, naturalNotes);
        for(var i = 1; i < resultNotes.length; i++) {
            if(resultNotes[i].charAt(0) != naturalNotes[nextNote(naturalNotes, naturalTonic, i)]) {
                for(var j = 0; j < noteNames[findNote(resultNotes[i], noteNames)].length; j++) {
                    if(noteNames[findNote(resultNotes[i], noteNames)][j].charAt(0) == naturalNotes[nextNote(naturalNotes, naturalTonic, i)]) {
                        resultNotes[i] = noteNames[findNote(resultNotes[i], noteNames)][j];
                    }
                }
            }
        }
    }

    function nextNote(naturalNotes, naturalTonic, interval) {
        if(naturalTonic + interval > naturalNotes.length - 1) {
            return (naturalTonic + interval) - naturalNotes.length;
        } else {
            return naturalTonic + interval;
            alert("menor que");
        }
    }

    function findNaturalTonic(tonic, naturalNotes) {
        for(var i = 0; i < naturalNotes.length; i++) {
            if(tonic.charAt(0) == naturalNotes[i]) {
                return i;
            }
        }
        return null;
    }

    /*
    Encuentra sólo la primera, es decir, da problemas al poner por ejemplo e#, ya que escribirá f.
    */
    function findNoteByDegree(noteNames, tonic, interval) {
        var note = findNote(tonic, noteNames);
        for(var j = 0; j < interval - 1; j++) {
            if(note == noteNames.length - 1) {
                note = 0;
            } else {
                note++;
            }
        }
        return noteNames[note][0];
    }
    
    function findNote(note, noteNames) {
        for(var i = 0; i < noteNames.length; i++) {
            for(var j = 0; j < noteNames[i].length; j++) {
                if(note == noteNames[i][j]) {
                    return i;
                }
            }
        }
        return null;
    }
}

function setGlobals() {
    scaleName = $("#txtScale").val();
    tonicName = $("#txtTonic").val();
}

function showScale(scale) {
    $("#text").html("Scale name: " + scale.name);
    $("#text").append("<br>Degrees: ");
    for(var i = 0; i < scale.degrees.length; i++) {
        $("#text").append(scale.degrees[i].degree_name + "  ");
    }
    $("#text").append("<br>Notes: ");
    for(var i = 0; i < scale.notes.length; i++) {
        $("#text").append(scale.notes[i] + "  ");
    }
}

// AJAX

function createScale() {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = alertContents;
    xmlhttp.open("GET", "http://localhost/dashboard/aplicacion_musica/php/fetchDB.php?scale=" + scaleName, true);
    xmlhttp.send();
}

function alertContents() {
    if(this.readyState === XMLHttpRequest.DONE && this.status === 200) {
        showScale(new Scale(scaleName, JSON.parse(this.responseText), tonicName));
    }
}

// ON READY

$(document).ready(function() {
    $("#btnSubmit").click(function() {
        setGlobals();
        createScale();
    });
});