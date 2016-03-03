function get(str) {
    var catalog = {
        "cs_CZ": {
            "Go to date": "Přejít na datum",
            "Cancel": "Zrušit",
            "Choose date": "Zvolte datum",
            "Year": "Rok",
            "Month": "Měsíc",
            "Day": "Den",
            "January": "Leden",
            "February": "Únor",
            "March": "Březen",
            "April": "Duben",
            "May": "Květen",
            "June": "Červen",
            "July": "Červenec",
            "August": "Srpen",
            "September": "Září",
            "October": "Říjen",
            "November": "Listopad",
            "December": "Prosinec"
        }
    };
    var lng = Qt.locale().name;
    if(typeof catalog[lng] == "undefined") {
        return str;
    }
    if(typeof catalog[lng][str] == "undefined") {
        return str;
    }
    return catalog[lng][str];
}
