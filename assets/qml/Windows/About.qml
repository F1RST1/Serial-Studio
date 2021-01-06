/*
 * Copyright (c) 2020-2021 Alex Spataru <https://github.com/alex-spataru>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: root

    //
    // Custom properties
    //
    readonly property int year: new Date().getFullYear()

    //
    // Window options
    //
    flags: Qt.Dialog
    minimumWidth: 320
    maximumWidth: 320
    title: qsTr("About") + CppTranslator.dummy
    minimumHeight: column.implicitHeight + 12 * app.spacing
    maximumHeight: column.implicitHeight + 12 * app.spacing

    //
    // Theme options
    //
    palette.text: Qt.rgba(1, 1, 1, 1)
    palette.buttonText: Qt.rgba(1, 1, 1, 1)
    palette.windowText: Qt.rgba(1, 1, 1, 1)
    background: Rectangle {
        color: app.windowBackgroundColor
    }

    //
    // Window controls
    //
    ColumnLayout {
        id: column
        anchors.fill: parent
        spacing: app.spacing
        anchors.margins: 2 * app.spacing

        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Image {
                width: 96
                height: 96
                source: "qrc:/images/icon.png"
                Layout.alignment: Qt.AlignVCenter
                sourceSize: Qt.size(width, height)
            }

            ColumnLayout {
                spacing: app.spacing
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                Label {
                    font.bold: true
                    text: CppAppName
                    font.pixelSize: 28
                }

                Label {
                    opacity: 0.5
                    font.pixelSize: 16
                    text: qsTr("Version %1").arg(CppAppVersion) + CppTranslator.dummy
                }
            }
        }

        Label {
            opacity: 0.8
            Layout.fillWidth: true
            wrapMode: Label.WrapAtWordBoundaryOrAnywhere
            text: qsTr("Copyright © 2020-%1 %2, released under the MIT License.").arg(root.year).arg(CppAppOrganization) + CppTranslator.dummy
        }

        Label {
            opacity: 0.8
            font.pixelSize: 12
            Layout.fillWidth: true
            color: palette.highlightedText
            wrapMode: Label.WrapAtWordBoundaryOrAnywhere
            text: qsTr("The program is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.") + CppTranslator.dummy
        }

        Item {
            height: app.spacing
        }

        Button {
            Layout.fillWidth: true
            text: qsTr("Contact author") + CppTranslator.dummy
            onClicked: Qt.openUrlExternally("mailto:alex_spataru@outlook.com")
        }

        Button {
            Layout.fillWidth: true
            text: qsTr("Report bug") + CppTranslator.dummy
            onClicked: Qt.openUrlExternally("https://github.com/Serial-Studio/Serial-Studio/issues")
        }

        Button {
            Layout.fillWidth: true
            text: qsTr("Check for updates") + CppTranslator.dummy
            onClicked: {
                CppUpdater.setNotifyOnFinish(CppAppUpdaterUrl, true)
                CppUpdater.checkForUpdates(CppAppUpdaterUrl)
            }
        }

        Button {
            Layout.fillWidth: true
            text: qsTr("Documentation") + CppTranslator.dummy
            onClicked: Qt.openUrlExternally("https://github.com/Serial-Studio/Serial-Studio/wiki")
        }

        Item {
            height: app.spacing
        }

        Button {
            Layout.fillWidth: true
            onClicked: root.close()
            text: qsTr("Close") + CppTranslator.dummy
        }

        Item {
            height: app.spacing
        }
    }
}