/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
       
import bb.cascades 1.3

Page {
    Container {
        topPadding: ui.du(5)
        leftPadding: topPadding
        rightPadding: topPadding
        TextField {
            id: textField
            hintText: "Text to send"
        }
        Button {
            text: "Send email"
            onClicked: {
                invoke.query.setMimeType("text/plain")
                var date = new Date()
                var subject = date.toDateString() + " " + date.toTimeString()
                var body = textField.text
                var uri = "mailto:test@gmail.com?subject=" + subject + "&body=" + body
                invoke.query.setUri(uri)
                invoke.query.setInvokeTargetId("sys.pim.uib.email.hybridcomposer")
                invoke.query.updateQuery()
            }
            attachedObjects: [
                Invocation {
                    id: invoke
                    onArmed: {
                        trigger("bb.action.SENDEMAIL")
                    }
                }
            ]
        }
    }
}
