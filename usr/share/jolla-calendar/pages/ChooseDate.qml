import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: root

    property int year_r;
    property int month_r;
    property int day_r;
    property var input_date;

    function getDate() {
        var date = input_date;
        return {
            day: date.getDate(),
            month: date.getMonth()+1,
            year: date.getFullYear()
        }
    }

    Column {
        spacing: Theme.paddingLarge
        width: root.width
        anchors.fill: parent

        DialogHeader {
            id: dialogheader
            acceptText: "Go to date"
            cancelText: "Cancel"
        }

        PageHeader {
            title: "Choose date"
        }

        TextField {
            id: day
            width: parent.width
            placeholderText: "Day"
            label: "Day"
            text: getDate().day
            inputMethodHints: Qt.ImhDigitsOnly
        }

        TextField {
            id: month
            width: parent.width
            placeholderText: "Month"
            label: "Month"
            text: getDate().month
            inputMethodHints: Qt.ImhDigitsOnly
        }

        TextField {
            id: year
            width: parent.width
            placeholderText: "Year"
            label: "Year"
            text: getDate().year
            inputMethodHints: Qt.ImhDigitsOnly
        }
    }
    onDone: {
        if(result == DialogResult.Accepted) {
            year_r = year.text;
            month_r = month.text-1;
            day_r = day.text;
        }
    }
}
