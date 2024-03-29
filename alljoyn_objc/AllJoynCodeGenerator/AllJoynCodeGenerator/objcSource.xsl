<!--
////////////////////////////////////////////////////////////////////////////////
// Copyright AllSeen Alliance. All rights reserved.
//
//    Permission to use, copy, modify, and/or distribute this software for any
//    purpose with or without fee is hereby granted, provided that the above
//    copyright notice and this permission notice appear in all copies.
//
//    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
////////////////////////////////////////////////////////////////////////////////
-->
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

<xsl:param name="fileName"/>
<xsl:param name="baseFileName"/>

<xsl:variable name="vLower" select="'abcdefghijklmnopqrstuvwxyz'"/>
<xsl:variable name="vUpper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

<xsl:template match="/">
<xsl:text>////////////////////////////////////////////////////////////////////////////////
// Copyright AllSeen Alliance. All rights reserved.
//
//    Permission to use, copy, modify, and/or distribute this software for any
//    purpose with or without fee is hereby granted, provided that the above
//    copyright notice and this permission notice appear in all copies.
//
//    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//  ALLJOYN MODELING TOOL - GENERATED CODE
//
////////////////////////////////////////////////////////////////////////////////
//
//  DO NOT EDIT
//
//  Add a category or subclass in separate .h/.m files to extend these classes
//
////////////////////////////////////////////////////////////////////////////////
//
//  </xsl:text><xsl:value-of select="$fileName"/><xsl:text>
//
////////////////////////////////////////////////////////////////////////////////

#import &lt;alljoyn/BusAttachment.h&gt;
#import &lt;alljoyn/BusObject.h&gt;
#import "AJNBusObjectImpl.h"
#import "AJNInterfaceDescription.h"
#import "AJNMessageArgument.h"
#import "AJNSignalHandlerImpl.h"

#import "</xsl:text><xsl:value-of select="$baseFileName"/><xsl:text>.h"

using namespace ajn;


@interface AJNMessageArgument(Private)

/**
 * Helper to return the C++ API object that is encapsulated by this objective-c class
 */
@property (nonatomic, readonly) MsgArg *msgArg;

@end

</xsl:text>

<xsl:apply-templates select=".//node" mode="cpp"/>
<xsl:apply-templates select=".//node" mode="objc"/>
<xsl:apply-templates select=".//interface" mode="signal-handler"/>

</xsl:template>

<!--
Define empty templates for the text under description so that it doesn't get caught by the
default template 
-->
<xsl:template match="description[text()]" mode="cpp-method-definition"/>
<xsl:template match="description[text()]" mode="cpp-member-definition"/>
<xsl:template match="description[text()]" mode="cpp-signal-member"/>
<xsl:template match="description[text()]" mode="cpp-signal-definition"/>
<xsl:template match="description[text()]" mode="cpp-signal-handler-impl-declaration"/>
<xsl:template match="description[text()]" mode="cpp-signal-handler-impl-definition"/>
<xsl:template match="description[text()]"/>


<xsl:template match="node" mode="cpp">
////////////////////////////////////////////////////////////////////////////////
//
//  C++ Bus Object class declaration for <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl
//
////////////////////////////////////////////////////////////////////////////////
class <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl : public AJNBusObjectImpl
{
private:
    <xsl:apply-templates select="./interface/signal" mode="cpp-signal-member-declaration"/>
    
public:
    <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl(const char *path, id&lt;<xsl:apply-templates select="./interface" mode="objc-interface-list"/>&gt; aDelegate);
    <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl(BusAttachment &#38;bus, const char *path, id&lt;<xsl:apply-templates select="./interface" mode="objc-interface-list"/>&gt; aDelegate);

    virtual QStatus AddInterfacesAndHandlers(BusAttachment &#38;bus);

    <xsl:if test="count(./interface/property) > 0 ">
    // properties
    //
    virtual QStatus Get(const char* ifcName, const char* propName, MsgArg&#38; val);
    virtual QStatus Set(const char* ifcName, const char* propName, MsgArg&#38; val);        
    </xsl:if>
    
    // methods
    //
    <xsl:apply-templates select="./interface/method" mode="cpp-method-declaration"/>
    
    // signals
    //
    <xsl:apply-templates select="./interface/signal" mode="cpp-signal-declaration"/>
};
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  C++ Bus Object implementation for <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl
//
////////////////////////////////////////////////////////////////////////////////

<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl(const char *path, id&lt;<xsl:apply-templates select="./interface" mode="objc-interface-list"/>&gt; aDelegate) :
    AJNBusObjectImpl(path,aDelegate)
{
    // Intentionally empty
}

<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl(BusAttachment &#38;bus, const char *path, id&lt;<xsl:apply-templates select="./interface" mode="objc-interface-list"/>&gt; aDelegate) :
    AJNBusObjectImpl(bus,path,aDelegate)
{
    AddInterfacesAndHandlers(bus);
}

QStatus <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::AddInterfacesAndHandlers(BusAttachment &#38;bus)
{
    const InterfaceDescription* interfaceDescription = NULL;
    QStatus status;
    status = ER_OK;
    
    <xsl:apply-templates select="./interface" mode="cpp-interface-creation"/>
    return status;
}

<xsl:if test="count(./interface/property) > 0 ">
QStatus <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::Get(const char* ifcName, const char* propName, MsgArg&#38; val)
{
    QStatus status = ER_BUS_NO_SUCH_PROPERTY;
    
    @autoreleasepool {
    
    <xsl:apply-templates select="./interface" mode="cpp-property-get"/>
    
    }
    
    return status;
}
    
QStatus <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::Set(const char* ifcName, const char* propName, MsgArg&#38; val)
{
    QStatus status = ER_BUS_NO_SUCH_PROPERTY;
    
    @autoreleasepool {
    
    <xsl:apply-templates select="./interface" mode="cpp-property-set"/>
    
    }

    return status;
}
</xsl:if>

<xsl:apply-templates select="./interface" mode="cpp-member-definitions"/>
////////////////////////////////////////////////////////////////////////////////
</xsl:template>

<xsl:template match="node" mode="objc">
////////////////////////////////////////////////////////////////////////////////
//
//  Objective-C Bus Object implementation for AJN<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
//
////////////////////////////////////////////////////////////////////////////////

@interface AJN<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>()
/**
* The bus attachment this object is associated with.
*/
@property (nonatomic, weak) AJNBusAttachment *bus;

@end

@implementation AJN<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>

@dynamic handle;
@synthesize bus = _bus;

<xsl:apply-templates select="./interface/property" mode="objc-property-synthesize"/>

- (<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl*)busObject
{
    return static_cast&lt;<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl*&gt;(self.handle);
}

- (QStatus)registerInterfacesWithBus:(AJNBusAttachment *)busAttachment
{
    QStatus status;

    status = [self activateInterfacesWithBus: busAttachment];

    self.busObject->AddInterfacesAndHandlers(*((ajn::BusAttachment*)busAttachment.handle));

    return status;
}

- (QStatus)activateInterfacesWithBus:(AJNBusAttachment *)busAttachment
{
    QStatus status;

    status = ER_OK;

    AJNInterfaceDescription *interfaceDescription;

    <xsl:apply-templates select="./interface" mode="objc-interface-descriptions"/>

    self.bus = busAttachment;

    return status;
}

- (id)initWithPath:(NSString *)path
{
    self = [super initWithPath:path];
    if (self) {
    // create the internal C++ bus object
    //
        <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl *busObject = new <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl([path UTF8String],(id&lt;<xsl:apply-templates select="./interface" mode="objc-interface-list"/>&gt;)self);
        self.handle = busObject;
    }
    return self;
}

- (id)initWithBusAttachment:(AJNBusAttachment *)busAttachment onPath:(NSString *)path
{
    self = [super initWithBusAttachment:busAttachment onPath:path];
    if (self) {
        [self activateInterfacesWithBus:busAttachment];

        // create the internal C++ bus object
        //
        <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl *busObject = new <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl(*((ajn::BusAttachment*)busAttachment.handle), [path UTF8String], (id&lt;<xsl:apply-templates select="./interface" mode="objc-interface-list"/>&gt;)self);
        
        self.handle = busObject;
        
      <xsl:if test="./description">
        [self setDescription:@"<xsl:value-of select="./description"/>" inLanguage:@"<xsl:value-of select="./description/@language"/>"];
      </xsl:if>
    }
    return self;
}

- (void)dealloc
{
    <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl *busObject = [self busObject];
    delete busObject;
    self.handle = nil;
}

    <xsl:apply-templates select="./interface/method" mode="objc-method-definition"/>
    <xsl:apply-templates select="./interface/signal" mode="objc-signal-definition"/>
    
@end

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  Objective-C Proxy Bus Object implementation for <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
//
////////////////////////////////////////////////////////////////////////////////

@interface <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Proxy(Private)

@property (nonatomic, strong) AJNBusAttachment *bus;

- (ProxyBusObject*)proxyBusObject;

@end

@implementation <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>Proxy
    <xsl:apply-templates select="./interface/property" mode="objc-proxy-property"/>
    <xsl:apply-templates select="./interface/method" mode="objc-proxy-method"/>
@end

////////////////////////////////////////////////////////////////////////////////
</xsl:template>

<xsl:template match="interface" mode="signal-handler">
    <xsl:if test="count(./signal) > 0">
////////////////////////////////////////////////////////////////////////////////
//
//  C++ Signal Handler implementation for <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>
//
////////////////////////////////////////////////////////////////////////////////

class <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl : public AJNSignalHandlerImpl
{
private:
<xsl:apply-templates match="./signal" mode="cpp-signal-handler-impl-declaration"/>
    
public:
    /**
     * Constructor for the AJN signal handler implementation.
     *
     * @param aDelegate         Objective C delegate called when one of the below virtual functions is called.     
     */    
    <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl(id&lt;AJNSignalHandler&gt; aDelegate);
    
    virtual void RegisterSignalHandler(ajn::BusAttachment &#38;bus);
    
    virtual void UnregisterSignalHandler(ajn::BusAttachment &#38;bus);
    
    /**
     * Virtual destructor for derivable class.
     */
    virtual ~<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl();
};


/**
 * Constructor for the AJN signal handler implementation.
 *
 * @param aDelegate         Objective C delegate called when one of the below virtual functions is called.     
 */    
<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl(id&lt;AJNSignalHandler&gt; aDelegate) : AJNSignalHandlerImpl(aDelegate)
{
<xsl:apply-templates select="signal" mode="cpp-signal-handler-impl-init"/>
}

<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::~<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl()
{
    m_delegate = NULL;
}

void <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::RegisterSignalHandler(ajn::BusAttachment &#38;bus)
{
    QStatus status;
    status = ER_OK;
    const ajn::InterfaceDescription* interface = NULL;
    <xsl:apply-templates select="signal" mode="cpp-signal-handler-impl-register"/>
}

void <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::UnregisterSignalHandler(ajn::BusAttachment &#38;bus)
{
    QStatus status;
    status = ER_OK;
    const ajn::InterfaceDescription* interface = NULL;
    <xsl:apply-templates select="signal" mode="cpp-signal-handler-impl-unregister"/>
}

<xsl:apply-templates match="./signal" mode="cpp-signal-handler-impl-definition"/>

@implementation AJNBusAttachment(<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>)

- (void)register<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandler:(id&lt;<xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandler&gt;)signalHandler
{
    <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl *signalHandlerImpl = new <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl(signalHandler);
    signalHandler.handle = signalHandlerImpl;
    [self registerSignalHandler:signalHandler];
}

@end

////////////////////////////////////////////////////////////////////////////////
    </xsl:if>
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-handler-impl-init">
<xsl:text>&#09;</xsl:text><xsl:value-of select="@name"/>SignalMember = NULL;<xsl:text>&#10;</xsl:text>
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-handler-impl-register">
    ////////////////////////////////////////////////////////////////////////////
    // Register signal handler for signal <xsl:value-of select="@name"/>
    //
    interface = bus.GetInterface("<xsl:value-of select="../@name"/>");

    if (interface) {
        // Store the <xsl:value-of select="@name"/> signal member away so it can be quickly looked up
        <xsl:value-of select="@name"/>SignalMember = interface->GetMember("<xsl:value-of select="@name"/>");
        assert(<xsl:value-of select="@name"/>SignalMember);

        
        // Register signal handler for <xsl:value-of select="@name"/>
        status =  bus.RegisterSignalHandler(this,
            static_cast&lt;MessageReceiver::SignalHandler&gt;(&#38;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::<xsl:value-of select="@name"/>SignalHandler),
            <xsl:value-of select="@name"/>SignalMember,
            NULL);
            
        if (status != ER_OK) {
            NSLog(@"ERROR: Interface <xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::RegisterSignalHandler failed. %@", [AJNStatus descriptionForStatusCode:status] );
        }
    }
    else {
        NSLog(@"ERROR: <xsl:value-of select="../@name"/> not found.");
    }
    ////////////////////////////////////////////////////////////////////////////    
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-handler-impl-unregister">
    ////////////////////////////////////////////////////////////////////////////
    // Unregister signal handler for signal <xsl:value-of select="@name"/>
    //
    interface = bus.GetInterface("<xsl:value-of select="../@name"/>");
    
    // Store the <xsl:value-of select="@name"/> signal member away so it can be quickly looked up
    <xsl:value-of select="@name"/>SignalMember = interface->GetMember("<xsl:value-of select="@name"/>");
    assert(<xsl:value-of select="@name"/>SignalMember);
    
    // Unregister signal handler for <xsl:value-of select="@name"/>
    status =  bus.UnregisterSignalHandler(this,
        static_cast&lt;MessageReceiver::SignalHandler&gt;(&#38;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::<xsl:value-of select="@name"/>SignalHandler),
        <xsl:value-of select="@name"/>SignalMember,
        NULL);
        
    if (status != ER_OK) {
        NSLog(@"ERROR:<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::UnregisterSignalHandler failed. %@", [AJNStatus descriptionForStatusCode:status] );
    }
    ////////////////////////////////////////////////////////////////////////////    
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-handler-impl-declaration">
    const ajn::InterfaceDescription::Member* <xsl:value-of select="@name"/>SignalMember;
    void <xsl:value-of select="@name"/>SignalHandler(const ajn::InterfaceDescription::Member* member, const char* srcPath, ajn::Message&#38; msg);
</xsl:template>

<xsl:template  match="signal" mode="cpp-signal-handler-impl-definition">
void <xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandlerImpl::<xsl:value-of select="@name"/>SignalHandler(const ajn::InterfaceDescription::Member* member, const char* srcPath, ajn::Message&#38; msg)
{
    @autoreleasepool {
        <xsl:apply-templates select="arg" mode="cpp-unpack-message-arg"/>
        AJNMessage *signalMessage = [[AJNMessage alloc] initWithHandle:&#38;msg];
        NSString *objectPath = [NSString stringWithCString:msg->GetObjectPath() encoding:NSUTF8StringEncoding];
        AJNSessionId sessionId = msg->GetSessionId();        
        NSLog(@"Received <xsl:value-of select="@name"/> signal from %@ on path %@ for session id %u [%s > %s]", [signalMessage senderName], objectPath, msg->GetSessionId(), msg->GetRcvEndpointName(), msg->GetDestination() ? msg->GetDestination() : "broadcast");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            <xsl:choose>
                <xsl:when test="count(arg) > 0">
            [(id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandler&gt;)m_delegate didReceive<xsl:apply-templates select="./arg" mode="objc-messageCall"/> inSession:sessionId message:signalMessage];
                </xsl:when>
                <xsl:otherwise>
            [(id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>SignalHandler&gt;)m_delegate didReceive<xsl:value-of select="@name"/>InSession:sessionId message:signalMessage];
                </xsl:otherwise>
            </xsl:choose>
        });
        
    }
}
</xsl:template>

<xsl:template match="property" mode="objc-property-dynamic">
    <xsl:text>@dynamic </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>;&#10;</xsl:text>
</xsl:template>

<xsl:template match="property" mode="objc-property-synthesize">
    <xsl:text>@synthesize </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text> = _</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>;&#10;</xsl:text>
</xsl:template>

<xsl:template match="property" mode="objc-property">
    <xsl:if test="@access='read' or @access='readwrite'">
- (<xsl:call-template name="objcArgType"/>)<xsl:value-of select="@name"/>
{
    [self addInterfaceNamed:@"<xsl:value-of select="../@name"/>"];
    
    <xsl:choose>
        <xsl:when test="@type='y' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t' or @type='d' or @type='s' or @type='o' or @type='g'">
    MsgArg propValue;
    
    QStatus status = self.proxyBusObject->GetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", propValue);

    if (status != ER_OK) {
        NSLog(@"ERROR: Failed to get property <xsl:value-of select="@name"/> on interface <xsl:value-of select="../@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
    }

    <xsl:apply-templates select="." mode="objc-prop-accessor-return"/>
        </xsl:when>
        <xsl:otherwise>
    MsgArg *propValue = new MsgArg();
    
    QStatus status = self.proxyBusObject->GetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", *propValue);

    if (status != ER_OK) {
        NSLog(@"ERROR: Failed to get property <xsl:value-of select="@name"/> on interface <xsl:value-of select="../@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
    }
    
    return [[AJNMessageArgument alloc] initWithHandle:propValue shouldDeleteHandleOnDealloc:YES];
        </xsl:otherwise>
    </xsl:choose>
}
    </xsl:if>
    <xsl:if test="@access='write' or @access='readwrite'">
- (void)set<xsl:call-template name="capitalizeFirstLetterOfNameAttr"/>:(<xsl:call-template name="objcArgType"/>)propertyValue
{
    [self addInterfaceNamed:@"<xsl:value-of select="../@name"/>"];    
    
    <xsl:choose>
        <xsl:when test="@type='y' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t' or @type='d' or @type='s' or @type='o' or @type='g'">
    MsgArg arg;

    QStatus status = arg.Set("<xsl:value-of select="@type"/>", <xsl:if test="@type!='b'">[</xsl:if>propertyValue<xsl:if test="@type!='b'"><xsl:text> </xsl:text><xsl:call-template name="objcArgTypeConversionToCpp"/>]</xsl:if>);    
    
    if (status != ER_OK) {
        NSLog(@"ERROR: Failed to set property <xsl:value-of select="@name"/> on interface <xsl:value-of select="../@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
    }
    
    self.proxyBusObject->SetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", arg); 
        </xsl:when>
        <xsl:otherwise>
    self.proxyBusObject->SetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", (MsgArg*)(propertyValue.handle)); 
        </xsl:otherwise>
    </xsl:choose>

    
}
    </xsl:if>
</xsl:template>

<xsl:template match="property" mode="objc-proxy-property">
    <xsl:if test="@access='read' or @access='readwrite'">
- (<xsl:call-template name="objcArgType"/>)<xsl:value-of select="@name"/>
{
    [self addInterfaceNamed:@"<xsl:value-of select="../@name"/>"];
    
    <xsl:choose>
        <xsl:when test="@type='y' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t' or @type='d' or @type='s' or @type='o' or @type='g'">
    MsgArg propValue;
    
    QStatus status = self.proxyBusObject->GetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", propValue);

    if (status != ER_OK) {
        NSLog(@"ERROR: Failed to get property <xsl:value-of select="@name"/> on interface <xsl:value-of select="../@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
        <xsl:if test="@type='b'">
        return NO;
        </xsl:if>
        <xsl:if test="not(@type='b')">
        return nil;
        </xsl:if>
    }

    <xsl:apply-templates select="." mode="objc-prop-accessor-return"/>
        </xsl:when>
        <xsl:otherwise>
    MsgArg *propValue = new MsgArg();
    
    QStatus status = self.proxyBusObject->GetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", *propValue);

    if (status != ER_OK) {
        NSLog(@"ERROR: Failed to get property <xsl:value-of select="@name"/> on interface <xsl:value-of select="../@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);

        return nil;
    }
    
    return [[AJNMessageArgument alloc] initWithHandle:propValue shouldDeleteHandleOnDealloc:YES];
        </xsl:otherwise>
    </xsl:choose>
}
    </xsl:if>
    <xsl:if test="@access='write' or @access='readwrite'">
- (void)set<xsl:call-template name="capitalizeFirstLetterOfNameAttr"/>:(<xsl:call-template name="objcArgType"/>)propertyValue
{
    [self addInterfaceNamed:@"<xsl:value-of select="../@name"/>"];
    
    <xsl:choose>
        <xsl:when test="@type='y' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t' or @type='d' or @type='s' or @type='o' or @type='g'">
    MsgArg arg;

    QStatus status = arg.Set("<xsl:value-of select="@type"/>", <xsl:if test="@type!='b'">[</xsl:if>propertyValue<xsl:if test="@type!='b'"><xsl:text> </xsl:text><xsl:call-template name="objcArgTypeConversionToCpp"/>]</xsl:if>);    
    if (status != ER_OK) {
        NSLog(@"ERROR: Failed to set property <xsl:value-of select="@name"/> on interface <xsl:value-of select="../@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
    }
    
    self.proxyBusObject->SetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", arg); 
        </xsl:when>
        <xsl:otherwise>
    self.proxyBusObject->SetProperty("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", *(MsgArg*)(propertyValue.handle)); 
        </xsl:otherwise>
    </xsl:choose>
    
}
    </xsl:if>
</xsl:template>

<xsl:template match="method" mode="objc-proxy-method">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="." mode="objc-proxy-declaration"/>
{
    [self addInterfaceNamed:@"<xsl:value-of select="../@name"/>"];
    
    // prepare the input arguments
    //
    
    Message reply(*((BusAttachment*)self.bus.handle));    
    MsgArg inArgs[<xsl:value-of select="count(./arg[@direction='in'])"/>];
    <xsl:apply-templates select="./arg[@direction='in']" mode="cpp-msg-arg-for-method-call"/>

    // make the function call using the C++ proxy object
    //
    
    QStatus status = self.proxyBusObject->MethodCall("<xsl:value-of select="../@name"/>", "<xsl:value-of select="@name"/>", inArgs, <xsl:value-of select="count(./arg[@direction='in'])"/>, reply, 5000);
    if (ER_OK != status) {
        NSLog(@"ERROR: ProxyBusObject::MethodCall on <xsl:value-of select="../@name"/> failed. %@", [AJNStatus descriptionForStatusCode:status]);
        <xsl:choose>
            <xsl:when test="count(./arg[@direction='out']) = 1">
        return nil;
            </xsl:when>
            <xsl:otherwise>
        return;
            </xsl:otherwise>
        </xsl:choose>
    }

    <xsl:if test="count(./arg[@direction='out']) > 0">
    // pass the output arguments back to the caller
    //
    
        <xsl:choose>
            <xsl:when test="count(./arg[@direction='out'])=1">
                <xsl:apply-templates select="./arg[@direction='out']" mode="objc-proxy-method-single-return"/>
            </xsl:when>
            <xsl:when test="count(./arg[@direction='out'])>1">
                <xsl:apply-templates select="./arg[@direction='out']" mode="objc-proxy-method-multiple-return"/>
            </xsl:when>
        </xsl:choose>
    </xsl:if>

}
</xsl:template>

<xsl:template match="method" mode="objc-method-definition">
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates select="." mode="objc-declaration"/>
{
    //
    // GENERATED CODE - DO NOT EDIT
    //
    // Create a category or subclass in separate .h/.m files
    @throw([NSException exceptionWithName:@"NotImplementedException" reason:@"You must override this method in a subclass" userInfo:nil]);
}
</xsl:template>

<xsl:template match="signal" mode="objc-signal-definition">
    <xsl:text>- (void)send</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg) > 0">
            <xsl:apply-templates select="./arg" mode="objc-messageParam"/>
            <xsl:text> inSession:(AJNSessionId)sessionId</xsl:text>            
        </xsl:when>
        <xsl:when test="count(./arg) = 0">
            <xsl:value-of select="@name"/>        
            <xsl:text>InSession:(AJNSessionId)sessionId</xsl:text>            
        </xsl:when>
    </xsl:choose>    
    <xsl:text> toDestination:(NSString*)destinationPath&#10;</xsl:text>
{
    <xsl:choose>
        <xsl:when test="count(arg)>0">
    self.busObject->Send<xsl:value-of select="@name"/>(<xsl:apply-templates select="./arg" mode="objc-signal-args"/>, [destinationPath UTF8String], sessionId);
        </xsl:when>
        <xsl:otherwise>
    self.busObject->Send<xsl:value-of select="@name"/>([destinationPath UTF8String], sessionId);
        </xsl:otherwise>
    </xsl:choose>
}
</xsl:template>

<xsl:template match="arg" mode="objc-signal-args">
    <xsl:if test="position()>1"><xsl:text>, </xsl:text></xsl:if>
    <xsl:choose>
        <xsl:when test="@type='b'">
            <xsl:text>(</xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:text> == YES ? true : false)</xsl:text>
        </xsl:when>
        <xsl:otherwise>
                <xsl:text>[</xsl:text>
                <xsl:value-of select="@name"/>
                    <xsl:text> </xsl:text>
                <xsl:call-template name="objcArgTypeConversionToCpp"/>
                <xsl:text>]</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="property" mode="objc-prop-accessor-return">
    <xsl:choose>
        <xsl:when test="@type='y'">
    return [NSNumber numberWithUnsignedChar:propValue.v_variant.val->v_byte];
        </xsl:when>
        <xsl:when test="@type='b'">
    return propValue.v_variant.val->v_bool;
        </xsl:when>
        <xsl:when test="@type='n'">
    return [NSNumber numberWithShort:propValue.v_variant.val->v_int16];
        </xsl:when>
        <xsl:when test="@type='q'">
    return [NSNumber numberWithUnsignedShort:propValue.v_variant.val->v_uint16];
        </xsl:when>
        <xsl:when test="@type='i'">
    return [NSNumber numberWithInt:propValue.v_variant.val->v_int32];
        </xsl:when>
        <xsl:when test="@type='u'">
    return [NSNumber numberWithUnsignedInt:propValue.v_variant.val->v_uint32];
        </xsl:when>
        <xsl:when test="@type='x'">
    return [NSNumber numberWithLongLong:propValue.v_variant.val->v_int64];
        </xsl:when>
        <xsl:when test="@type='t'">
    return [NSNumber numberWithUnsignedLongLong:propValue.v_variant.val->v_uint64];
        </xsl:when>
        <xsl:when test="@type='d'">
    return [NSNumber numberWithDouble:propValue.v_variant.val->v_double];
        </xsl:when>
        <xsl:when test="@type='s'">
    return [NSString stringWithCString:propValue.v_variant.val->v_string.str encoding:NSUTF8StringEncoding];
        </xsl:when>
        <xsl:when test="@type='o'">
    return [NSString stringWithCString:propValue.v_variant.val->v_objPath.str encoding:NSUTF8StringEncoding];
        </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="objc-proxy-method-single-return">
    <xsl:choose>
        <xsl:when test="@type='y'">
    return [NSNumber numberWithUnsignedChar:reply-&gt;GetArg()-&gt;v_byte];
        </xsl:when>
        <xsl:when test="@type='b'">
    return reply-&gt;GetArg()-&gt;v_bool;
        </xsl:when>
        <xsl:when test="@type='n'">
    return [NSNumber numberWithShort:reply-&gt;GetArg()-&gt;v_int16];
        </xsl:when>
        <xsl:when test="@type='q'">
    return [NSNumber numberWithUnsignedShort:reply-&gt;GetArg()-&gt;v_uint16];
        </xsl:when>
        <xsl:when test="@type='i'">
    return [NSNumber numberWithInt:reply-&gt;GetArg()-&gt;v_int32];
        </xsl:when>
        <xsl:when test="@type='u'">
    return [NSNumber numberWithUnsignedInt:reply-&gt;GetArg()-&gt;v_uint32];
        </xsl:when>
        <xsl:when test="@type='x'">
    return [NSNumber numberWithLongLong:reply-&gt;GetArg()-&gt;v_int64];
        </xsl:when>
        <xsl:when test="@type='t'">
    return [NSNumber numberWithUnsignedLongLong:reply-&gt;GetArg()-&gt;v_uint64];
        </xsl:when>
        <xsl:when test="@type='d'">
    return [NSNumber numberWithDouble:reply-&gt;GetArg()-&gt;v_double];
        </xsl:when>
        <xsl:when test="@type='s'">
    return [NSString stringWithCString:reply-&gt;GetArg()-&gt;v_string.str encoding:NSUTF8StringEncoding];
        </xsl:when>
        <xsl:when test="@type='o'">
    return [NSString stringWithCString:reply-&gt;GetArg()-&gt;v_objPath.str encoding:NSUTF8StringEncoding];
        </xsl:when>
        <xsl:otherwise>
    return [[AJNMessageArgument alloc] initWithHandle:(AJNHandle)new MsgArg(*(reply-&gt;GetArg(0))) shouldDeleteHandleOnDealloc:YES];
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="objc-proxy-method-multiple-return">
    <xsl:choose>
        <xsl:when test="@type='y'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithUnsignedChar:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_byte];
        </xsl:when>
        <xsl:when test="@type='b'">
    *<xsl:value-of select="@name"/> = reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_bool;
        </xsl:when>
        <xsl:when test="@type='n'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithShort:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_int16];
        </xsl:when>
        <xsl:when test="@type='q'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithUnsignedShort:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_uint16];
        </xsl:when>
        <xsl:when test="@type='i'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithInt:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_int32];
        </xsl:when>
        <xsl:when test="@type='u'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithUnsignedInt:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_uint32];
        </xsl:when>
        <xsl:when test="@type='x'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithLongLong:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_int64];
        </xsl:when>
        <xsl:when test="@type='t'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithUnsignedLongLong:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_uint64];
        </xsl:when>
        <xsl:when test="@type='d'">
    *<xsl:value-of select="@name"/> = [NSNumber numberWithDouble:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_double];
        </xsl:when>
        <xsl:when test="@type='s'">
    *<xsl:value-of select="@name"/> = [NSString stringWithCString:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_string.str encoding:NSUTF8StringEncoding];
        </xsl:when>
        <xsl:when test="@type='o'">
    *<xsl:value-of select="@name"/> = [NSString stringWithCString:reply-&gt;GetArg(<xsl:value-of select="position()-1"/>)-&gt;v_objPath.str encoding:NSUTF8StringEncoding];
        </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template match="method" mode="objc-declaration">
    <xsl:text>- (</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg[@direction='out']) > 1 or count(./arg[@direction='out']) = 0">
            <xsl:text>void</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-argType"/>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg) = 0 or (count(./arg) = 1 and count(./arg[@direction='out']) = 1)">
            <xsl:call-template name="uncapitalizeFirstLetterOfNameAttr"/>
            <xsl:text>:(AJNMessage *)methodCallMessage</xsl:text>
        </xsl:when>
        <xsl:when test="count(./arg[@direction='out']) > 1">
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
            <xsl:if test="count(./arg[@direction='in']) > 1">
                <xsl:text>&#32;</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-messageParam"/>
            <xsl:text> message:(AJNMessage *)methodCallMessage</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
            <xsl:text> message:(AJNMessage *)methodCallMessage</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="method" mode="objc-proxy-declaration">
    <xsl:text>- (</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg[@direction='out']) > 1 or count(./arg[@direction='out']) = 0">
            <xsl:text>void</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-argType"/>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
    <xsl:choose>
        <xsl:when test="count(./arg) = 0 or (count(./arg) = 1 and count(./arg[@direction='out']) = 1)">
            <xsl:call-template name="uncapitalizeFirstLetterOfNameAttr"/>
            
        </xsl:when>
        <xsl:when test="count(./arg[@direction='out']) > 1">
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
            <xsl:if test="count(./arg[@direction='in']) > 1">
                <xsl:text>&#32;</xsl:text>
            </xsl:if>
            <xsl:apply-templates select="./arg[@direction='out']" mode="objc-messageParam"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="./arg[@direction='in']" mode="objc-messageParam"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="objc-messageParam">
    <xsl:if test="position() > 1">
        <xsl:text>&#32;</xsl:text>
    </xsl:if>
    <xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value" />
    <xsl:text>(</xsl:text>
        <xsl:apply-templates select="." mode="objc-argType"/>
        <xsl:if test="@direction='out'">
            <xsl:text>*</xsl:text>
        </xsl:if>
    <xsl:text>)</xsl:text>
    <xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="arg" mode="objc-argType">
    <xsl:call-template name="objcArgType"/>
</xsl:template>

<xsl:template match="interface" mode="objc-interface-descriptions">
        //
        // <xsl:value-of select="annotation[@name='org.alljoyn.lang.objc']/@value"/> interface (<xsl:value-of select="@name"/>)
        //
        // create an interface description, or if that fails, get the interface as it was already created
        //
        interfaceDescription = [busAttachment createInterfaceWithName:@"<xsl:value-of select="@name"/>"];

    <xsl:if test="./description">
        [interfaceDescription setDescriptionLanguage:@"<xsl:value-of select="./description/@language"/>"];
        [interfaceDescription setDescription:@"<xsl:value-of select="./description"/>"];
    </xsl:if>

    <xsl:if test="count(property)>0">
        // add the properties to the interface description
        //
    <xsl:apply-templates select="./property" mode="objc-interface-property-descriptions"/>
    </xsl:if>

    <xsl:if test="count(method)>0">
        // add the methods to the interface description
        //
    <xsl:apply-templates select="./method" mode="objc-interface-method-descriptions"/>
    </xsl:if>
    
    <xsl:if test="count(signal)>0">
        // add the signals to the interface description
        //
    <xsl:apply-templates select="./signal" mode="objc-interface-signal-descriptions"/>
    </xsl:if>
    

    
        [interfaceDescription activate];
</xsl:template>

<xsl:template match="property" mode="objc-interface-property-descriptions">
        status = [interfaceDescription addPropertyWithName:@"<xsl:value-of select="@name"/>" signature:@"<xsl:value-of select="@type"/>"];
        
        if (status != ER_OK &#38;&#38; status != ER_BUS_MEMBER_ALREADY_EXISTS) {
            @throw [NSException exceptionWithName:@"BusObjectInitFailed" reason:@"Unable to add property to interface:  <xsl:value-of select="@name"/>" userInfo:nil];
        }
    <xsl:if test="./description">
        [interfaceDescription setPropertyDescription:@"<xsl:value-of select="./description"/>" forPropertyWithName:@"<xsl:value-of select="@name"/>"];
    </xsl:if>
</xsl:template>

<xsl:template match="method" mode="objc-interface-method-descriptions">
        status = [interfaceDescription addMethodWithName:@"<xsl:value-of select="@name"/>" inputSignature:@"<xsl:for-each select="arg[@direction='in']"><xsl:value-of select="@type"/></xsl:for-each>" outputSignature:@"<xsl:for-each select="arg[@direction='out']"><xsl:value-of select="@type"/></xsl:for-each>" argumentNames:[NSArray arrayWithObjects:<xsl:for-each select="arg">@"<xsl:value-of select="@name"/>",</xsl:for-each> nil]];
        
        if (status != ER_OK &#38;&#38; status != ER_BUS_MEMBER_ALREADY_EXISTS) {
            @throw [NSException exceptionWithName:@"BusObjectInitFailed" reason:@"Unable to add method to interface: <xsl:value-of select="@name"/>" userInfo:nil];
        }
    <xsl:if test="./description">
        [interfaceDescription setMemberDescription:@"<xsl:value-of select="./description"/>" forMemberWithName:@"<xsl:value-of select="@name"/>" sessionlessSignal:FALSE];
    </xsl:if>
    <xsl:for-each select="./arg/description">
        [interfaceDescription setArgDescription:@"<xsl:value-of select="."/>" forArgument:@"<xsl:value-of select="../@name"/>" ofMember:@"<xsl:value-of select="../../@name"/>"];
    </xsl:for-each>
</xsl:template>

<xsl:template match="signal" mode="objc-interface-signal-descriptions">
        status = [interfaceDescription addSignalWithName:@"<xsl:value-of select="@name"/>" inputSignature:@"<xsl:for-each select="arg"><xsl:value-of select="@type"/></xsl:for-each>" argumentNames:[NSArray arrayWithObjects:<xsl:for-each select="arg">@"<xsl:value-of select="@name"/>",</xsl:for-each> nil]];
        
        if (status != ER_OK &#38;&#38; status != ER_BUS_MEMBER_ALREADY_EXISTS) {
            @throw [NSException exceptionWithName:@"BusObjectInitFailed" reason:@"Unable to add signal to interface:  <xsl:value-of select="@name"/>" userInfo:nil];
        }
    <xsl:if test="./description">
        [interfaceDescription setMemberDescription:@"<xsl:value-of select="./description"/>" forMemberWithName:@"<xsl:value-of select="@name"/>" sessionlessSignal:<xsl:if test="./description[@sessionless = 'true']">TRUE</xsl:if><xsl:if test="not(./description[@sessionless = 'true'])">FALSE</xsl:if>];

    </xsl:if>
    <xsl:for-each select="./arg/description">
        [interfaceDescription setArgDescription:@"<xsl:value-of select="."/>" forArgument:@"<xsl:value-of select="../@name"/>" ofMember:@"<xsl:value-of select="../../@name"/>"];
    </xsl:for-each>
</xsl:template>

<xsl:template match="interface" mode="cpp-property-get">
    <xsl:if test="count(./property[@access='readwrite'])>0 or count(./property[@access='read'])>0">
    <xsl:if test="position()>1">else </xsl:if>if (strcmp(ifcName, "<xsl:value-of select="@name"/>") == 0) 
    {
    <xsl:apply-templates select="property" mode="cpp-property-getter"/>
    }
    </xsl:if>
</xsl:template>

<xsl:template match="property" mode="cpp-property-getter">
    <xsl:if test="@access='readwrite' or @access='read'">
        if (strcmp(propName, "<xsl:value-of select="@name"/>") == 0)
        {
        <xsl:choose>
            <xsl:when test="@type='y' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t' or @type='d' or @type='s' or @type='o' or @type='g'">        
            status = val.Set( "<xsl:value-of select="@type"/>", <xsl:if test="@type!='b'">[</xsl:if>((id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate).<xsl:value-of select="@name"/><xsl:text> </xsl:text><xsl:if test="@type!='b'"><xsl:call-template name="objcArgTypeConversionToCpp"/>]</xsl:if> );
            </xsl:when>
            <xsl:otherwise>
            MsgArg *pPropertyValue = (MsgArg*)[((id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate).<xsl:value-of select="@name"/><xsl:text> </xsl:text><xsl:call-template name="objcArgTypeConversionToCpp"/>];
            val = *pPropertyValue;
            status = ER_OK;
            </xsl:otherwise>
        </xsl:choose>
        }
    </xsl:if>
</xsl:template>

<xsl:template match="interface" mode="cpp-property-set">
    <xsl:if test="count(./property[@access='readwrite'])>0 or count(./property[@access='write'])>0">
    <xsl:if test="position()>1">&#09;else </xsl:if>if (strcmp(ifcName, "<xsl:value-of select="@name"/>") == 0) 
    {
    <xsl:apply-templates select="property" mode="cpp-property-setter"/>
    }
    </xsl:if>
</xsl:template>

<xsl:template match="property" mode="cpp-property-setter">
    <xsl:if test="@access='readwrite' or @access='write'">
        if (strcmp(propName, "<xsl:value-of select="@name"/>") == 0)
        {
        <xsl:choose>
            <xsl:when test="@type='y' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t' or @type='d' or @type='s' or @type='o' or @type='g'">        
            <xsl:call-template name="cppPropType"/> propValue;
            status = val.Get("<xsl:value-of select="@type"/>", &#38;propValue);
            ((id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate).<xsl:value-of select="@name"/> = <xsl:call-template name="cppPropTypeConversionToObjc"/>;
            </xsl:when>
            <xsl:otherwise>
            MsgArg *pPropertyValue = (MsgArg*)[((id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate).<xsl:value-of select="@name"/><xsl:text> </xsl:text><xsl:call-template name="objcArgTypeConversionToCpp"/>];
            *pPropertyValue = val;
            status = ER_OK;
            </xsl:otherwise>
        </xsl:choose>
        }    
    </xsl:if>        
</xsl:template>

<xsl:template name="cppPropTypeConversionToObjc">
    <xsl:choose>
        <xsl:when test="@type='s' or @type='o'">[NSString stringWithCString:propValue encoding:NSUTF8StringEncoding]</xsl:when>
        <xsl:when test="@type='y'">[NSNumber numberWithUnsignedChar:propValue]</xsl:when>
        <xsl:when test="@type='d'">[NSNumber numberWithDouble:propValue]</xsl:when>
        <xsl:when test="@type='b'">propValue</xsl:when>
        <xsl:when test="@type='n'">[NSNumber numberWithShort:propValue>]</xsl:when>                
        <xsl:when test="@type='q'">[NSNumber numberWithUnsignedShort:propValue]</xsl:when>                                
        <xsl:when test="@type='i'">[NSNumber numberWithInt:propValue]</xsl:when>                                                
        <xsl:when test="@type='u'">[NSNumber numberWithUnsignedInt:propValue]</xsl:when>                                                                
        <xsl:when test="@type='x'">[NSNumber numberWithLongLong:propValue]</xsl:when>                                                                                
        <xsl:when test="@type='t'">[NSNumber numberWithUnsignedLongLong:propValue]</xsl:when>                                                                                
    </xsl:choose>
</xsl:template>

<xsl:template match="interface" mode="objc-interface-list">
    <xsl:if test="position() > 1">, </xsl:if>
    <xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value"/>
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-declaration">
    <xsl:if test="position() > 1"><xsl:text>&#09;</xsl:text></xsl:if>
    <xsl:text>QStatus Send</xsl:text><xsl:value-of select="@name"/>(<xsl:apply-templates select="./arg" mode="cpp-argument-list"/><xsl:text> const char* destination, SessionId sessionId, uint16_t timeToLive = 0, uint8_t flags = 0);&#10;</xsl:text>
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-member-declaration">
    <xsl:if test="position() > 1"><xsl:text>&#09;</xsl:text></xsl:if>
    <xsl:text>const InterfaceDescription::Member* </xsl:text><xsl:value-of select="@name"/><xsl:text>SignalMember;&#10;</xsl:text>
</xsl:template>

<xsl:template match="method" mode="cpp-method-declaration">
    <xsl:if test="position() > 1"><xsl:text>&#09;</xsl:text></xsl:if>
    <xsl:text>void </xsl:text>    
    <xsl:value-of select="@name"/>
    <xsl:text>(const InterfaceDescription::Member* member, Message&#38; msg);&#10;</xsl:text>
</xsl:template>

<xsl:template match="arg" mode="cpp-argument-list">
    <xsl:call-template name="cppArgType"/><xsl:text> </xsl:text><xsl:value-of select="@name"/><xsl:text>,</xsl:text>
</xsl:template>

<xsl:template match="interface" mode="cpp-interface-creation">
    // Add the <xsl:value-of select="@name"/> interface to this object
    //
    interfaceDescription = bus.GetInterface("<xsl:value-of select="@name"/>");
    assert(interfaceDescription);
    status = AddInterface(*interfaceDescription<xsl:if test="./annotation[@name='org.alljoyn.lang.objc.announced']/@value = 'true'">, ANNOUNCED</xsl:if>);
    if (ER_OK != status) {
        NSLog(@"ERROR: An error occurred while adding the interface <xsl:value-of select="@name"/>.%@", [AJNStatus descriptionForStatusCode:status]);
    }
    <xsl:if test="count(./method) > 0">
    // Register the method handlers for interface <xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value"/> with the object
    //
    const MethodEntry methodEntriesFor<xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value"/>[] = {

        <xsl:apply-templates select="./method" mode="cpp-method-entry"/>
    
    };
    
    status = AddMethodHandlers(methodEntriesFor<xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value"/>, sizeof(methodEntriesFor<xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value"/>) / sizeof(methodEntriesFor<xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value"/>[0]));
    if (ER_OK != status) {
        NSLog(@"ERROR: An error occurred while adding method handlers for interface <xsl:value-of select="@name"/> to the interface description. %@", [AJNStatus descriptionForStatusCode:status]);
    }
    </xsl:if>
    
    <xsl:if test="count(./signal) > 0">
    // save off signal members for later
    //
    <xsl:apply-templates match="signal" mode="cpp-signal-member"/>
    </xsl:if>
</xsl:template>

<xsl:template match="method" mode="cpp-method-entry">
        <xsl:if test="position() > 1"><xsl:text>,&#10;&#10;&#09;&#09;</xsl:text></xsl:if>
        <xsl:text>{&#10;&#09;&#09;&#09;interfaceDescription->GetMember("</xsl:text><xsl:value-of select="@name"/><xsl:text>"), static_cast&lt;MessageReceiver::MethodHandler&gt;(&#38;</xsl:text><xsl:value-of select="../../annotation[@name='org.alljoyn.lang.objc']/@value"/><xsl:text>Impl::</xsl:text><xsl:value-of select="@name"/><xsl:text>)&#10;&#09;&#09;}</xsl:text>
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-member">
    <xsl:value-of select="@name"/>SignalMember = interfaceDescription->GetMember("<xsl:value-of select="@name"/>");
    assert(<xsl:value-of select="@name"/>SignalMember);    
</xsl:template>

<xsl:template match="interface" mode="cpp-member-definitions">
    <xsl:apply-templates match="method" mode="cpp-method-definition"/>
    <xsl:apply-templates match="signal" mode="cpp-signal-definition"/>
</xsl:template>

<xsl:template match="method" mode="cpp-method-definition">
void <xsl:value-of select="../../annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::<xsl:value-of select="@name"/>(const InterfaceDescription::Member *member, Message&#38; msg)
{
    @autoreleasepool {
    
    
    <xsl:if test="count(arg[@direction='in'])>0">
    
    // get all input arguments
    //
    <xsl:apply-templates select="arg[@direction='in']" mode="cpp-unpack-message-arg"/>
    
    </xsl:if>
    
    <xsl:if test="count(arg[@direction='out']) > 0">
    // declare the output arguments
    //
    <xsl:apply-templates select="arg[@direction='out']" mode="objc-declare-out-message-arg"/>        
    </xsl:if>
    
    // call the Objective-C delegate method
    //
    <xsl:choose>
        <xsl:when test="count(arg[@direction='out'])=1">
            <xsl:text>&#10;&#09;</xsl:text>outArg0 = [(id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate <xsl:choose><xsl:when test="count(arg)=1"><xsl:call-template name="uncapitalizeFirstLetterOfNameAttr"/>:[[AJNMessage alloc] initWithHandle:&#38;msg]</xsl:when><xsl:otherwise><xsl:apply-templates select="arg[@direction='in']" mode="objc-messageCall"/> message:[[AJNMessage alloc] initWithHandle:&#38;msg]</xsl:otherwise></xsl:choose>];
            
        </xsl:when>
        <xsl:when test="count(arg[@direction='out'])>1">
            <xsl:text>&#10;&#09;</xsl:text>[(id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate <xsl:apply-templates select="arg[@direction='in']" mode="objc-messageCall"/><xsl:if test="count(arg[@direction='in']) > 0"><xsl:text> </xsl:text></xsl:if><xsl:apply-templates select="arg[@direction='out']" mode="objc-messageCall"/>  message:[[AJNMessage alloc] initWithHandle:&#38;msg]];
            
        </xsl:when>
        <xsl:when test="count(arg[@direction='out'])=0">
            <xsl:text>&#10;&#09;</xsl:text>[(id&lt;<xsl:value-of select="../annotation[@name='org.alljoyn.lang.objc']/@value"/>&gt;)delegate <xsl:choose><xsl:when test="count(arg[@direction='in']) > 0"><xsl:apply-templates select="arg[@direction='in']" mode="objc-messageCall"/>  message:[[AJNMessage alloc] initWithHandle:&#38;msg]</xsl:when><xsl:otherwise><xsl:call-template name="uncapitalizeFirstLetterOfNameAttr"/>:[[AJNMessage alloc] initWithHandle:&#38;msg]</xsl:otherwise></xsl:choose>];
        </xsl:when>
    </xsl:choose>
    
    <xsl:choose>
        <xsl:when test="count(arg[@direction='out']) > 0">
    // formulate the reply
    //
    MsgArg outArgs[<xsl:value-of select="count(arg[@direction='out'])"/>];
    <xsl:apply-templates select="arg[@direction='out']" mode="cpp-msg-arg-for-method-reply"/>
    QStatus status = MethodReply(msg, outArgs, <xsl:value-of select="count(arg[@direction='out'])"/>);
    if (ER_OK != status) {
        NSLog(@"ERROR: An error occurred when attempting to send a method reply for <xsl:value-of select="@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
    }  
        </xsl:when>
        <xsl:otherwise>
    // formulate the reply
    //
    MsgArg outArgs[0];
    QStatus status = MethodReply(msg, outArgs, 0);
    if (ER_OK != status) {
        NSLog(@"ERROR: An error occurred when attempting to send a method reply for <xsl:value-of select="@name"/>. %@", [AJNStatus descriptionForStatusCode:status]);
    }  
        </xsl:otherwise>
    </xsl:choose>
    
    }
}
</xsl:template>

<xsl:template match="arg" mode="objc-messageCall">
    <xsl:if test="position() > 1">
        <xsl:text>&#32;</xsl:text>
    </xsl:if>
    <xsl:value-of select="./annotation[@name='org.alljoyn.lang.objc']/@value" />
    <xsl:call-template name="objcMessageCallArg"/>
</xsl:template>

<xsl:template match="arg" mode="cpp-msg-arg-for-method-reply">
    <xsl:choose>
        <xsl:when test="@type='s' or @type='o' or @type='y' or @type='d' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t'">
    outArgs[<xsl:value-of select="position()-1"/>].Set("<xsl:value-of select="@type"/>", <xsl:if test="@type!='b'">[</xsl:if>outArg<xsl:value-of select="position()-1"/><xsl:text> </xsl:text><xsl:if test="@type!='b'"><xsl:call-template name="objcArgTypeConversionToCpp"/>]</xsl:if>);
        </xsl:when>
        <xsl:otherwise>
    outArgs[<xsl:value-of select="position()-1"/>] = *[outArg<xsl:value-of select="position()-1"/> msgArg];
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="cpp-msg-arg-for-method-call">
    <xsl:choose>
        <xsl:when test="@type='s' or @type='o' or @type='y' or @type='d' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t'">
    inArgs[<xsl:value-of select="position()-1"/>].Set("<xsl:value-of select="@type"/>", [<xsl:value-of select="@name"/><xsl:text> </xsl:text><xsl:call-template name="objcArgTypeConversionToCpp"/>]);
        </xsl:when>
        <xsl:otherwise>
    inArgs[<xsl:value-of select="position()-1"/>] = *[<xsl:value-of select="@name"/> msgArg];
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="cpp-unpack-message-arg">
    <xsl:choose>
        <xsl:when test="@type='y'">
    uint8_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_byte;
        </xsl:when>
        <xsl:when test="@type='b'">
    bool inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_bool;
        </xsl:when>
        <xsl:when test="@type='n'">
    int16_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_int16;
        </xsl:when>
        <xsl:when test="@type='q'">
    uint16_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_uint16;
        </xsl:when>
        <xsl:when test="@type='i'">
    int32_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_int32;
        </xsl:when>
        <xsl:when test="@type='u'">
    uint32_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_uint32;
        </xsl:when>
        <xsl:when test="@type='x'">
    int64_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_int64;
        </xsl:when>
        <xsl:when test="@type='t'">
    uint64_t inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_uint64;
        </xsl:when>
        <xsl:when test="@type='d'">
    double inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_double;
        </xsl:when>
        <xsl:when test="@type='s'">
    qcc::String inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_string.str;
        </xsl:when>
        <xsl:when test="@type='o'">
    qcc::String inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_string.str;
        </xsl:when>
        <xsl:when test="@type='a'">
    qcc::AllJoynArray inArg<xsl:value-of select="position()-1"/> = msg->GetArg(<xsl:value-of select="position()-1"/>)->v_array;
        </xsl:when>
        <xsl:otherwise>
    AJNMessageArgument* inArg<xsl:value-of select="position()-1"/> = [[AJNMessageArgument alloc] initWithHandle:(AJNHandle)new MsgArg(*(msg->GetArg(<xsl:value-of select="position()-1"/>))) shouldDeleteHandleOnDealloc:YES];        
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="arg" mode="objc-declare-out-message-arg">
    <xsl:if test="position()=1"><xsl:text>&#10;</xsl:text></xsl:if>
    <xsl:text>&#09;</xsl:text>
    <xsl:call-template name="objcArgType"/>
    <xsl:text> outArg</xsl:text>
    <xsl:value-of select="position()-1"/>
    <xsl:text>;&#10;</xsl:text>
</xsl:template>

<xsl:template match="arg" mode="objc-argument-type">
    <xsl:call-template name="objcArgType"/>
</xsl:template>

<xsl:template match="signal" mode="cpp-signal-definition">
QStatus <xsl:value-of select="../../annotation[@name='org.alljoyn.lang.objc']/@value"/>Impl::Send<xsl:value-of select="@name"/>(<xsl:apply-templates select="./arg" mode="cpp-argument-list"/><xsl:text> const char* destination, SessionId sessionId, uint16_t timeToLive, uint8_t flags)&#10;</xsl:text>{

    MsgArg args[<xsl:value-of select="count(arg)"/>];

    <xsl:apply-templates select="arg" mode="cpp-signal-msg-arg"/>

    return Signal(destination, sessionId, *<xsl:value-of select="@name"/>SignalMember, args, <xsl:value-of select="count(arg)"/>, timeToLive, flags);
}

</xsl:template>

<xsl:template match="arg" mode="cpp-signal-msg-arg">
    <xsl:choose>
        <xsl:when test="@type='s' or @type='o' or @type='y' or @type='d' or @type='b' or @type='n' or @type='q' or @type='i' or @type='u' or @type='x' or @type='t'">
            args[<xsl:value-of select="position()-1"/>].Set( "<xsl:value-of select="@type"/>", <xsl:value-of select="@name"/> );
        </xsl:when>
        <xsl:otherwise>args[<xsl:value-of select="position()-1"/>] = *<xsl:value-of select="@name"/>;</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="objcMessageCallArg">
    <xsl:choose>
        <xsl:when test="@direction='in'">
            <xsl:choose>
                <xsl:when test="@type='s' or @type='o'">[NSString stringWithCString:inArg<xsl:value-of select="position()-1"/>.c_str() encoding:NSUTF8StringEncoding]</xsl:when>
                <xsl:when test="@type='y'">[NSNumber numberWithUnsignedChar:inArg<xsl:value-of select="position()-1"/>]</xsl:when>
                <xsl:when test="@type='d'">[NSNumber numberWithDouble:inArg<xsl:value-of select="position()-1"/>]</xsl:when>
                <xsl:when test="@type='b'">(inArg<xsl:value-of select="position()-1"/> ? YES : NO)</xsl:when>
                <xsl:when test="@type='n'">[NSNumber numberWithShort:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                
                <xsl:when test="@type='q'">[NSNumber numberWithUnsignedShort:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                
                <xsl:when test="@type='i'">[NSNumber numberWithInt:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                
                <xsl:when test="@type='u'">[NSNumber numberWithUnsignedInt:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                                
                <xsl:when test="@type='x'">[NSNumber numberWithLongLong:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                                                
                <xsl:when test="@type='t'">[NSNumber numberWithUnsignedLongLong:inArg<xsl:value-of select="position()-1"/>]</xsl:when>     
                <xsl:otherwise>inArg<xsl:value-of select="position()-1"/></xsl:otherwise>                                                                           
            </xsl:choose>
        </xsl:when>
        <xsl:when test="@direction='out'">
            <xsl:text>&#38;outArg</xsl:text><xsl:value-of select="position()-1"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="@type='s' or @type='o'">[NSString stringWithCString:inArg<xsl:value-of select="position()-1"/>.c_str() encoding:NSUTF8StringEncoding]</xsl:when>
                <xsl:when test="@type='y'">[NSNumber numberWithUnsignedChar:inArg<xsl:value-of select="position()-1"/>]</xsl:when>
                <xsl:when test="@type='d'">[NSNumber numberWithDouble:inArg<xsl:value-of select="position()-1"/>]</xsl:when>
                <xsl:when test="@type='b'">(inArg<xsl:value-of select="position()-1"/> ? YES : NO)</xsl:when>
                <xsl:when test="@type='n'">[NSNumber numberWithShort:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                
                <xsl:when test="@type='q'">[NSNumber numberWithUnsignedShort:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                
                <xsl:when test="@type='i'">[NSNumber numberWithInt:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                
                <xsl:when test="@type='u'">[NSNumber numberWithUnsignedInt:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                                
                <xsl:when test="@type='x'">[NSNumber numberWithLongLong:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                                                
                <xsl:when test="@type='t'">[NSNumber numberWithUnsignedLongLong:inArg<xsl:value-of select="position()-1"/>]</xsl:when>                                                                                
                <xsl:otherwise>inArg<xsl:value-of select="position()-1"/></xsl:otherwise>                
            </xsl:choose>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="cppArgType">
    <xsl:choose>
        <xsl:when test="@type='y'">
            <xsl:text>uint8_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='b'">
            <xsl:text>bool</xsl:text>
        </xsl:when>
        <xsl:when test="@type='n'">
            <xsl:text>int16_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='q'">
            <xsl:text>uint16_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='i'">
            <xsl:text>int32_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='u'">
            <xsl:text>uint32_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='x'">
            <xsl:text>int64_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='t'">
            <xsl:text>uint64_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='d'">
            <xsl:text>double</xsl:text>
        </xsl:when>
        <xsl:when test="@type='s'">
            <xsl:text>const char *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='o'">
            <xsl:text>const char *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='a'">
            <xsl:text>qcc::AllJoynArray&#38;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>MsgArg*</xsl:text>
        </xsl:otherwise>
    </xsl:choose>    
</xsl:template>

<xsl:template name="cppPropType">
    <xsl:choose>
        <xsl:when test="@type='y'">
            <xsl:text>uint8_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='b'">
            <xsl:text>bool</xsl:text>
        </xsl:when>
        <xsl:when test="@type='n'">
            <xsl:text>int16_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='q'">
            <xsl:text>uint16_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='i'">
            <xsl:text>int32_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='u'">
            <xsl:text>uint32_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='x'">
            <xsl:text>int64_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='t'">
            <xsl:text>uint64_t</xsl:text>
        </xsl:when>
        <xsl:when test="@type='d'">
            <xsl:text>double</xsl:text>
        </xsl:when>
        <xsl:when test="@type='s'">
            <xsl:text>char *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='o'">
            <xsl:text>char *</xsl:text>
        </xsl:when>
        <xsl:when test="@type='a'">
            <xsl:text>qcc::AllJoynArray&#38;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>MsgArg*</xsl:text>
        </xsl:otherwise>
    </xsl:choose>    
</xsl:template>

<xsl:template name="objcArgType">
    <xsl:choose>
        <xsl:when test="@type='y'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='b'">
            <xsl:text>BOOL</xsl:text>
        </xsl:when>
        <xsl:when test="@type='n'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='q'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='i'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='u'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='x'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='t'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='d'">
            <xsl:text>NSNumber*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='s'">
            <xsl:text>NSString*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='o'">
            <xsl:text>NSString*</xsl:text>
        </xsl:when>
        <xsl:when test="@type='a'">
            <xsl:text>NSArray*</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>AJNMessageArgument*</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="objcArgTypeConversionToCpp">
    <xsl:choose>
        <xsl:when test="@type='y'">
            <xsl:text>unsignedCharValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='b'">
            <xsl:text>boolValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='n'">
            <xsl:text>shortValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='q'">
            <xsl:text>unsignedShortValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='i'">
            <xsl:text>intValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='u'">
            <xsl:text>unsignedIntValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='x'">
            <xsl:text>longLongValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='t'">
            <xsl:text>unsignedLongLongValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='d'">
            <xsl:text>doubleValue</xsl:text>
        </xsl:when>
        <xsl:when test="@type='s'">
            <xsl:text>UTF8String</xsl:text>
        </xsl:when>
        <xsl:when test="@type='o'">
            <xsl:text>UTF8String</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>msgArg</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="capitalizeFirstLetterOfNameAttr">  
   <xsl:variable name="value">  
        <xsl:value-of select="@name"/>  
   </xsl:variable>  
    <xsl:variable name= "ufirstChar" select="translate(substring($value,1,1),$vLower,$vUpper)"/>  
    <xsl:value-of select="concat($ufirstChar,substring($value,2))"/>
</xsl:template>

<xsl:template name="uncapitalizeFirstLetterOfNameAttr">  
   <xsl:variable name="value">  
        <xsl:value-of select="@name"/>  
   </xsl:variable>  
    <xsl:variable name= "lfirstChar" select="translate(substring($value,1,1),$vUpper,$vLower)"/>  
    <xsl:value-of select="concat($lfirstChar,substring($value,2))"/>
</xsl:template>

</xsl:stylesheet>
