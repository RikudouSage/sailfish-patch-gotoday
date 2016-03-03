import QtQuick 2.0
import Sailfish.Silica 1.0
import "ChooseDateTranslations.js" as Translation

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

    function monthDays(month, year) {
        var months = [31,year%4 == 0?29:28,31,30,31,30,31,31,30,31,30,31];
        return months[month-1];
    }

    Column {
        spacing: Theme.paddingLarge
        width: root.width
        anchors.fill: parent

        DialogHeader {
            id: dialogheader
            acceptText: Translation.get("Go to date")
            cancelText: Translation.get("Cancel")
        }

        PageHeader {
            title: Translation.get("Choose date")
        }

        ComboBox {
            property var value: input_date.getFullYear()
            id: yearbox
            label: Translation.get("Year")
            menu: ContextMenu {
                Repeater {
                    model: ListModel {
                        id: lmodel_year
                        Component.onCompleted: {
                            var j = 0;
                            for(var i = 2000; i <= 2100; i++) {
                                lmodel_year.append({m_text: i});
                                if(i == input_date.getFullYear()) {
                                    yearbox.currentIndex = j;
                                }

                                j++
                            }
                        }
                    }
                    MenuItem {
                        text: m_text
                    }
                }
            }
            onCurrentItemChanged: {
                yearbox.value = lmodel_year.get(yearbox.currentIndex).m_text;
                daybox.requestDateReload();
            }
        }

        ComboBox {
            property var value: input_date.getMonth() + 1
            id: monthbox
            label: Translation.get("Month")
            menu: ContextMenu {
                Repeater {
                    model: ListModel {
                        id: lmodel_month
                        Component.onCompleted: {
                            var j = 0;
                            var name = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                            for(var i = 1; i <= 12; i++) {
                                lmodel_month.append({m_text: Translation.get(name[j]), m_val: i});
                                if(i == input_date.getMonth()+1) {
                                    monthbox.currentIndex = j;
                                }

                                j++
                            }
                        }
                    }
                    MenuItem {
                        text: m_text
                    }
                }
            }
            onCurrentItemChanged: {
                monthbox.value = lmodel_month.get(monthbox.currentIndex).m_val;
                daybox.requestDateReload();
            }
        }

        ComboBox {
            property var value: input_date.getDate()
            signal requestDateReload()
            id: daybox
            label: Translation.get("Day")
            menu: ContextMenu {
                Repeater {
                    model: ListModel {
                        id: lmodel_day
                        Component.onCompleted: {
                            var j = 0;
                            var days = monthDays(monthbox.value, yearbox.value);
                            for(var i = 1; i <= days; i++) {
                                lmodel_day.append({m_text: i});
                                if(i == input_date.getDate()) {
                                    daybox.currentIndex = j;
                                }

                                j++
                            }
                        }
                    }
                    MenuItem {
                        text: m_text
                    }
                }
            }
            onCurrentItemChanged: {
                daybox.value = lmodel_day.get(daybox.currentIndex).m_text;
            }
            onRequestDateReload: {
                var sel = daybox.currentIndex;
                lmodel_day.clear();
                var j = 0;
                var days = monthDays(monthbox.value, yearbox.value);
                for(var i = 1; i <= days; i++) {
                    lmodel_day.append({m_text: i});
                    j++
                }
            }
        }

        TextField {
            id: day
            width: parent.width
            placeholderText: Translation.get("Day")
            label: Translation.get("Day")
            text: getDate().day
            inputMethodHints: Qt.ImhDigitsOnly
            visible: false
        }

        TextField {
            id: month
            width: parent.width
            placeholderText: Translation.get("Month")
            label: Translation.get("Month")
            text: getDate().month
            inputMethodHints: Qt.ImhDigitsOnly
            visible: false
        }

        TextField {
            id: year
            width: parent.width
            placeholderText: Translation.get("Year")
            label: Translation.get("Year")
            text: getDate().year
            inputMethodHints: Qt.ImhDigitsOnly
            visible: false
        }
    }
    onDone: {
        if(result == DialogResult.Accepted) {
            year_r = yearbox.value;
            month_r = monthbox.value-1;
            day_r = daybox.value;
        }
    }
}
