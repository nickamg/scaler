var scaleName;
var tonicName;

// SCALE OBJECT

function Scale(name, degrees, tonic) {
    this.name = name;
    this.degrees = degrees;
    this.notes = getNotes(tonic, degrees);

    function getNotes(tonic, degrees) {
        var noteNames = [["c", "b#"], ["c#", "db"], ["d", "c##"], ["d#", "eb"], ["e", "fb", "d##"], ["f", "e#"], ["f#", "gb", "e##"], ["g", "f##"], ["g#", "ab"], ["a", "g##"], ["a#", "bb"], ["b", "cb", "a##"]];
        var naturalNotes = ["c", "d", "e", "f", "g", "a", "b"];
        var findTonic = (function() {
            for(var i = 0; i < noteNames.length; i++) {
                for(var j = 0; j < noteNames[i].length; j++) {
                    if(tonic == noteNames[i][j]) {
                        return [i, j];
                    }
                }
            }
            return null;
        });
        var findNaturalTonic = (function() {
            for(var i = 0; i < naturalNotes.length; i++) {
                if(tonic.charAt(0) == naturalNotes[i]) {
                    return i;
                }
            }
            return null;
        });
        var nextNaturalNote = (function(interval) {
            var newPosition = naturalTonicPosition;
            //alert(interval + " es el intervalo de la nota natural")
            for(var i = 0; i < interval; i++) {
                if(newPosition == naturalNotes.length - 1) {
                    newPosition = 0;
                } else {
                    newPosition++;
                }
            }
            return newPosition;
        });
        var nextNotePosition = (function(interval) {
            var newPosition = tonicPosition[0];
            //alert(interval + " es el intervalo de la siguiente nota");
            for(var i = 0; i < interval - 1; i++) {
                if(newPosition == noteNames.length - 1) {
                    newPosition = 0;
                } else {
                    newPosition++;
                }
            }
            return newPosition;
        });
        var getNote = (function(interval) {
            var notePosition = nextNotePosition(degrees[interval].degree_position);
            //alert(degrees[interval].degree_position + " es el intervalo dictado por el grado");
            for(var i = 0; i < noteNames[notePosition].length; i++) {
                //alert(naturalNotes[nextNaturalNote(interval)] + " es la siguiente nota natural");
                if(noteNames[notePosition][i].charAt(0) == naturalNotes[nextNaturalNote(interval)]) {
                    //alert("Entra en el if");
                    return noteNames[notePosition][i];
                }
            }
        });
        var tonicPosition = findTonic();
        var naturalTonicPosition = findNaturalTonic();
        var resultNotes = [];

        for(var i = 0; i < degrees.length; i++) {
            resultNotes.push(getNote(i));
        }
        return resultNotes;
    }
}

// FUNCTIONS

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