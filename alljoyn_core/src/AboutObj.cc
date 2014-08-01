/**
 * @file
 * This implments the About class
 */
/******************************************************************************
 * Copyright (c) 2014, AllSeen Alliance. All rights reserved.
 *
 *    Permission to use, copy, modify, and/or distribute this software for any
 *    purpose with or without fee is hereby granted, provided that the above
 *    copyright notice and this permission notice appear in all copies.
 *
 *    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 ******************************************************************************/

#include <alljoyn/AboutObj.h>
#include <alljoyn/AllJoynStd.h>
#include <alljoyn/MsgArg.h>

#include <qcc/Debug.h>

#define QCC_MODULE "ALLJOYN_ABOUT"

namespace ajn {

AboutObj::AboutObj(ajn::BusAttachment& bus) :
    BusObject(org::alljoyn::About::ObjectPath),
    m_busAttachment(&bus)
{

}

QStatus AboutObj::Init(ajn::AboutObjectDescription& objectDescription, ajn::AboutData& aboutData)
{
    QCC_DbgTrace(("AboutService::%s", __FUNCTION__));
    assert(m_busAttachment);
    m_objectDescription = &objectDescription;
    m_aboutData = &aboutData;

    QStatus status;

    const InterfaceDescription* p_InterfaceDescription = NULL;

    p_InterfaceDescription = m_busAttachment->GetInterface(org::alljoyn::About::InterfaceName);

    if (!p_InterfaceDescription) {
        return ER_BUS_CANNOT_ADD_INTERFACE;
    }

    status = AddInterface(*p_InterfaceDescription);
    QCC_DbgPrintf(("Add About interface %s\n", QCC_StatusText(status)));

    if (status == ER_OK) {
        status = AddMethodHandler(p_InterfaceDescription->GetMember("GetAboutData"),
                                  static_cast<MessageReceiver::MethodHandler>(&AboutObj::GetAboutData));
        if (status != ER_OK) {
            return status;
        }
        status = AddMethodHandler(p_InterfaceDescription->GetMember("GetObjectDescription"),
                                  static_cast<MessageReceiver::MethodHandler>(&AboutObj::GetObjectDescription));
        if (status != ER_OK) {
            return status;
        }
    }

    status = m_busAttachment->RegisterBusObject(*this);
    QCC_DbgHLPrintf(("AboutObj::Init %s", QCC_StatusText(status)));

    return (status == ER_BUS_IFACE_ALREADY_EXISTS) ? ER_OK : status;
}
QStatus AboutObj::UpdateObjectDescription(ajn::AboutObjectDescription& objectDescription)
{
    // TODO
    return ER_FAIL;
}


QStatus AboutObj::UpdateAboutData(ajn::AboutData& aboutData)
{
    // TODO
    return ER_FAIL;
}

QStatus AboutObj::Announce(SessionPort sessionPort)
{
    const InterfaceDescription* p_InterfaceDescription = m_busAttachment->GetInterface(org::alljoyn::About::InterfaceName);

    if (!p_InterfaceDescription) {
        return ER_BUS_CANNOT_ADD_INTERFACE;
    }

    const ajn::InterfaceDescription::Member* announceSignalMember = p_InterfaceDescription->GetMember("Announce");
    assert(announceSignalMember);

    QCC_DbgTrace(("AboutService::%s", __FUNCTION__));
    QStatus status = ER_OK;
    if (announceSignalMember == NULL) {
        return ER_FAIL;
    }
    MsgArg announceArgs[4];
    status = announceArgs[0].Set("q", AboutObj::VERSION);
    if (status != ER_OK) {
        return status;
    }
    status = announceArgs[1].Set("q", sessionPort);
    if (status != ER_OK) {
        return status;
    }
//    std::vector<MsgArg> announceObjectsArg(m_AnnounceObjectsMap.size());
//    int objIndex = 0;
//    for (std::map<qcc::String, std::vector<qcc::String> >::const_iterator it = m_AnnounceObjectsMap.begin();
//         it != m_AnnounceObjectsMap.end(); ++it) {
//
//        qcc::String objectPath = it->first;
//        std::vector<const char*> interfacesVector(it->second.size());
//        std::vector<qcc::String>::const_iterator interfaceIt;
//        int interfaceIndex = 0;
//
//        for (interfaceIt = it->second.begin(); interfaceIt != it->second.end(); ++interfaceIt) {
//            interfacesVector[interfaceIndex++] = interfaceIt->c_str();
//        }
//
//        CHECK_RETURN(announceObjectsArg[objIndex].Set("(oas)", objectPath.c_str(), interfacesVector.size(), interfacesVector.data()))
//        objIndex++;
//    }
//    status = announceArgs[2].Set("a(oas)", objIndex, announceObjectsArg.data());
//    if (status != ER_OK) {
//        return status;
//    }
//    CHECK_RETURN(m_PropertyStore->ReadAll(NULL, PropertyStore::ANNOUNCE, announceArgs[3]))
    m_objectDescription->GetMsgArg(&announceArgs[2]);
    m_aboutData->GetMsgArgAnnounce(&announceArgs[3]);
    Message msg(*m_busAttachment);
    uint8_t flags = ALLJOYN_FLAG_SESSIONLESS;
//#if !defined(NDEBUG)
//    for (int i = 0; i < 4; i++) {
//        QCC_DbgPrintf(("announceArgs[%d]=%s", i, announceArgs[i].ToString().c_str()));
//    }
//#endif
    status = Signal(NULL, 0, *announceSignalMember, announceArgs, 4, (unsigned char) 0, flags);

    QCC_DbgPrintf(("Sent AnnounceSignal from %s  = %s", m_busAttachment->GetUniqueName().c_str(), QCC_StatusText(status)));
    return status;
}

void AboutObj::GetAboutData(const ajn::InterfaceDescription::Member* member, ajn::Message& msg) {
    QCC_DbgTrace(("AboutService::%s", __FUNCTION__));
    QStatus status = ER_OK;
    const ajn::MsgArg* args = NULL;
    size_t numArgs = 0;
    msg->GetArgs(numArgs, args);
    if (numArgs == 1) {
        ajn::MsgArg retargs[1];
        //status = m_PropertyStore->ReadAll(args[0].v_string.str, PropertyStore::READ, retargs[0]);
        QCC_DbgPrintf(("GetAboutData for GetMsgArg for lang=%s", args[0].v_string.str));
        status = m_aboutData->GetMsgArg(retargs, args[0].v_string.str);
        //QCC_DbgPrintf(("m_pPropertyStore->ReadAll(%s,PropertyStore::READ)  =%s", args[0].v_string.str, QCC_StatusText(status)));
        if (status != ER_OK) {
            if (status == ER_LANGUAGE_NOT_SUPPORTED) {
                MethodReply(msg, "org.alljoyn.Error.LanguageNotSupported", "The language specified is not supported");
                return;
            }
            MethodReply(msg, status);
            return;
        } else {
            MethodReply(msg, retargs, 1);
        }
    } else {
        MethodReply(msg, ER_INVALID_DATA);
    }
}

void AboutObj::GetObjectDescription(const ajn::InterfaceDescription::Member* member, ajn::Message& msg) {
    QCC_DbgTrace(("About::%s", __FUNCTION__));
    const ajn::MsgArg* args = 0;
    size_t numArgs = 0;
    msg->GetArgs(numArgs, args);
    if (numArgs == 0) {
        ajn::MsgArg retargs[1];
//        std::vector<MsgArg> objectArg(m_AnnounceObjectsMap.size());
//        int objIndex = 0;
//        for (std::map<qcc::String, std::vector<qcc::String> >::const_iterator it = m_AnnounceObjectsMap.begin();
//             it != m_AnnounceObjectsMap.end(); ++it) {
//            const qcc::String& key = it->first;
//            std::vector<const char*> interfacesVec(it->second.size());
//            std::vector<qcc::String>::const_iterator interfaceIt;
//            int interfaceIndex = 0;
//
//            for (interfaceIt = it->second.begin(); interfaceIt != it->second.end(); ++interfaceIt) {
//                interfacesVec[interfaceIndex] = interfaceIt->c_str();
//            }
//
//            objectArg[objIndex].Set("(oas)", key.c_str(), interfacesVec.size(), interfacesVec.data());
//            objIndex++;
//        }
//        retargs[0].Set("a(oas)", objectArg.size(), objectArg.data());
        m_objectDescription->GetMsgArg(retargs);
        MethodReply(msg, retargs, 1);
    } else {
        MethodReply(msg, ER_INVALID_DATA);
    }
}

QStatus AboutObj::Get(const char*ifcName, const char*propName, MsgArg& val) {
    QCC_DbgTrace(("About::%s", __FUNCTION__));
    QStatus status = ER_BUS_NO_SUCH_PROPERTY;
    if (0 == strcmp(ifcName, org::alljoyn::About::InterfaceName)) {
        if (0 == strcmp("Version", propName)) {
            status = val.Set("q", AboutObj::VERSION);
        }
    }
    return status;
}

} //endnamespace
