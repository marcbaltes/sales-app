﻿Type.registerNamespace("Telerik.Web.UI");
(function(){var a=$telerik.$;
var b=Telerik.Web.UI;
var d="Mobile";
var c=Telerik.Web.Browser;
b.DialogDefinition=function(){this.Width="600px";
this.Height="400px";
this.Title="";
this.Behaviors=36;
this.Modal=true;
this.VisibleStatusbar=false;
this.VisibleTitlebar=true;
this.ClientCallbackFunction="";
};
b.DialogDefinition.registerClass("Telerik.Web.UI.DialogDefinition",null);
b.DialogDefinitionsDictionary=function(h){for(var g in h){var i=h[g];
var e=new b.DialogDefinition();
for(var f in i){e[f]=i[f];
}this[g]=e;
}};
b.DialogDefinitionsDictionary.registerClass("Telerik.Web.UI.DialogDefinitionsDictionary",null);
b.DialogOpenEventArgs=function(f,e){b.DialogOpenEventArgs.initializeBase(this);
this._dialogName=f;
if(e){this._parameters=e;
}else{this._parameters={};
}};
b.DialogOpenEventArgs.prototype={get_dialogName:function(){return this._dialogName;
},set_parameters:function(e){this._parameters=e;
},get_parameters:function(){return this._parameters;
}};
b.DialogOpenEventArgs.registerClass("Telerik.Web.UI.DialogOpenEventArgs",Sys.EventArgs);
b.RadDialogOpener=function(e){b.RadDialogOpener.initializeBase(this,[e]);
this._dialogDefinitions={};
this._handlerChecked=false;
this._dialogParametersProviderTypeName="";
this._dialogUniqueID="";
this._dialogContainers={};
this._hasOpenedDialog=false;
};
b.RadDialogOpener.prototype={initialize:function(){b.RadDialogOpener.callBaseMethod(this,"initialize");
this._dialogDefinitions=new b.DialogDefinitionsDictionary(this.get_dialogDefinitions());
},get_dialogDefinitions:function(){return this._dialogDefinitions;
},openUrl:function(q,e,r,k,h,g,p,l,f,n,o,j){j="EXTERNAL_URL"+(j||"default");
var i=this._getDialogContainer(j);
i.set_width(r+"px");
i.set_height(k+"px");
i.set_behaviors(f||b.WindowBehaviors.Default);
i.set_modal(l==true);
i.set_visibleStatusbar(n==true);
i.set_visibleTitlebar(o==true);
i.set_title(p?p:"");
i.set_keepInScreenBounds(true);
var m=new b.DialogOpenEventArgs(q,e);
this.raiseEvent("open",m);
this._hasOpenedDialog=true;
i.ClientParameters=e;
i.set_clientCallBackFunction(h);
i.setUrl(q);
i.show();
i.center();
window.setTimeout(function(){i.setActive(true);
},100);
},open:function(i,f,e){if(!this._handlerChecked){this._checkDialogHandler(this.get_handlerUrl());
}i=this._getExistingPrefixedDialogName(i);
var h=this._getDialogDefinition(i);
var k=new b.DialogOpenEventArgs(i,f);
this.raiseEvent("open",k);
this._hasOpenedDialog=true;
f=k.get_parameters();
if(!e){e=h.ClientCallbackFunction;
}var g;
if(this.get_useClassicDialogs()){g=$create(b.ClassicDialog,{dialogOpener:this});
g.ClientParameters=f;
this._applyParameters(i,g);
if(e){g.set_clientCallBackFunction(e);
}window.__getCurrentRadEditorRadWindowReference=function(){return g;
};
var l=this._openBrowserWindow(g,h,i);
l.radWindow=g;
return l;
}else{g=this._getDialogContainer(i);
var j=h.Height||0;
if(!g.get_popupElement()){g.set_height(j);
g.set_width(h.Width||0);
g.set_behaviors(h.Behaviors);
g.set_modal(h.Modal);
g.set_visibleStatusbar(h.VisibleStatusbar);
g.set_visibleTitlebar(h.VisibleTitlebar);
g.set_keepInScreenBounds(true);
}if(h.ReloadOnShow!=null){g.set_reloadOnShow(h.ReloadOnShow);
}g.ClientParameters=f;
this._applyParameters(i,g);
if(i!="SpellCheckDialog"){this._sizeCenterCellDelegate=Function.createDelegate(this,this._sizeCenterCellWindowLoadHandler);
this._autoSizeDialogDelegate=Function.createDelegate(this,this._autoSizeDialogWindowLoadHandler);
g.add_pageLoad(this._sizeCenterCellDelegate);
g.add_pageLoad(this._autoSizeDialogDelegate);
}if(e){g.set_clientCallBackFunction(e);
}this._showDialogContainer(g);
if(!g.get_popupElement()){g.set_height(j);
}window.setTimeout(function(){if(g.isVisible()){g.center();
g.setActive(true);
}},c.iemobile?700:100);
}},openLight:function(h,f,e){var i=195;
var l=350;
if(f){if(f.height){i=f.height;
}if(f.width){l=f.width;
}}var j=new b.DialogOpenEventArgs(h,f);
this.raiseEvent("open",j);
this._hasOpenedDialog=true;
f=j.get_parameters();
var g=this._getDialogContainer(h);
g.set_height(i);
g.set_width(l);
g.set_behaviors(Telerik.Web.UI.WindowBehaviors.Move+Telerik.Web.UI.WindowBehaviors.Close);
g.set_modal(true);
g.set_visibleStatusbar(false);
g.set_visibleTitlebar(true);
if(e){g.set_clientCallBackFunction(e);
}g.ClientParameters=f;
Telerik.Web.UI.LightDialogsControllerClass.initializeLightDialog(g);
this._showDialogContainer(g);
g.set_height(i);
g.center();
if(f.stripPopupHeight===true){var k=g.get_popupElement();
if(k){k.style.height="";
}}window.setTimeout(function(){g.setActive(true);
},100);
},_openBrowserWindow:function(e,f,g){var h="width="+parseInt(f.Width,10)+",height="+parseInt(f.Height,10);
h+=",resizable=0,scrollbars=0,status=0,toolbar=0,menubar=0,directories=0";
return e.open(h,g);
},_hasVisibleDialog:function(){var e=this._dialogContainers;
for(var f in e){if(e[f].isVisible()){return true;
}}return false;
},get_hasOpenedDialog:function(){return this._hasOpenedDialog;
},_showDialogContainer:function(e){var f=this.get_renderMode()===b.RenderMode.Mobile;
var g=function(){e.show();
if(f){e.set_modal(false);
e.maximize();
}};
if(c.iemobile){setTimeout(g,600);
}else{g();
}},_sizeCenterCellWindowLoadHandler:function(e){if(this._sizeCenterCellDelegate){e.remove_pageLoad(this._sizeCenterCellDelegate);
delete this._sizeCenterCellDelegate;
}if(typeof(Telerik)=="undefined"){return;
}var f=function(k){k.remove_show(f);
var i=k.get_contentFrame(),h=i.contentWindow.document||i.contentDocument,g=k.get_contentElement()||k.ui.contentCell||k.ui.content,j=new RegExp("height\\s*:\\s*"+h.body.offsetHeight+"px(\\s*;)?","gmi");
g.style.height=h.body.offsetHeight+"px";
g.style.cssText=g.style.cssText.replace(j,"height: "+h.body.offsetHeight+"px !important;");
};
if(e&&e.isVisible&&e.isVisible()){f(e);
}else{if(e&&e.isVisible&&!e.isVisible()){e.add_show(f);
}}},_autoSizeDialogWindowLoadHandler:function(f){if(this._autoSizeDialogCellDelegate){f.remove_pageLoad(this._autoSizeDialogDelegate);
delete this._autoSizeDialogCellDelegate;
}if(typeof(Telerik)=="undefined"){return;
}var e=function(g){if($telerik.quirksMode){return;
}g.remove_show(e);
g.set_width(20);
g.set_height(20);
g.autoSize();
g.center();
};
if(f&&f.isVisible&&f.isVisible()){e(f);
}else{if(f&&f.isVisible&&!f.isVisible()){f.add_show(e);
}}},_applyParameters:function(i,f){var k=this._getDialogParameters(i);
if(!k){return;
}var n="&dp="+encodeURIComponent(k);
var e=this._getBaseDialogUrl(i);
var o=e.length+n.length;
var l=this._dialogParametersProviderTypeName=="";
var m=l&&o<=this.get_dialogUrlLengthLimit();
if(m){var h=f.get_navigateUrl();
var p=e+n;
if(h!=p){if(this.get_useClassicDialogs()||f.isCreated()){f.setUrl(p);
}else{f.set_navigateUrl(p);
}}else{var g=f.get_contentFrame();
if(g&&g.contentWindow&&g.contentWindow.$find){var j=g.contentWindow.initDialog;
if(j){g.contentWindow.setTimeout(function(){j();
},1);
}}}}else{f.setUrl(e);
f.DialogParameters=k;
}},_closeContainerDelegate:function(e){if(!this._hasVisibleDialog()){this._hasOpenedDialog=false;
}this.raiseEvent("close",e);
},_getDialogContainer:function(e){if(typeof(this._dialogContainers[e])=="undefined"){var f=$find(this.get_id()+e);
if(null!=f){f.dispose();
}this._dialogContainers[e]=this.get_container().clone(this.get_id()+e);
var g=this;
this._dialogContainers[e].get_dialogOpener=function(){return g;
};
this._dialogContainers[e].add_close(Function.createDelegate(this,this._closeContainerDelegate));
}return this._dialogContainers[e];
},_getBaseDialogUrl:function(e){var f=this.get_handlerUrl().indexOf("?")<0?"?":"&";
var g=this.get_handlerUrl()+f+"DialogName="+e;
if(this.get_enableTelerikManagers()){g+="&UseRSM=true";
}g+="&renderMode="+this._renderMode;
g+="&Skin="+this.get_skin()+"&Title="+encodeURIComponent(this._getDialogDefinition(e)["Title"])+"&doid="+this._dialogUniqueID+"&dpptn="+encodeURIComponent(this._dialogParametersProviderTypeName)+this.get_additionalQueryString();
return g;
},_getDialogDefinition:function(f){var e=this.get_dialogDefinitions()[f];
if(e){return e;
}else{throw Error.argumentNull("dialogName",String.format("Dialog Parameters for the {0} dialog do not exist",f));
}},_getDialogParameters:function(e){return this._getDialogDefinition(e)["SerializedParameters"];
},_getExistingPrefixedDialogName:function(f){var g=this._prefixDialogName(f);
var e=this.get_dialogDefinitions();
if(e[g]){return g;
}else{return f;
}},_prefixDialogName:function(e){var f=(this._renderMode==b.RenderMode.Mobile);
var g=f?d:"";
if(e.indexOf(g)===0){return e;
}else{return g+e;
}},_checkDialogHandler:function(h){var g=h.indexOf("?")<0?"?":"&";
var f=h+g+"checkHandler=true";
var i=new Sys.Net.WebRequest();
i.set_url(f);
i.add_completed(Function.createDelegate(this,this._checkRequestCompleted));
var e=new Sys.Net.XMLHttpExecutor();
i.set_executor(e);
e.executeRequest();
},_checkRequestCompleted:function(f,e){if(f.get_responseAvailable()){var g=f.get_responseData();
if(g&&g.indexOf("HandlerCheckOK")>0){this._handlerChecked=true;
return;
}}window.alert("Web.config registration missing!\n The Telerik dialogs require a HttpHandler registration in the web.config file. Please, use the control's Smart Tag to add the handler automatically, or see the help for more information: Controls > RadEditor > Dialogs > Introduction");
}};
a.registerControlProperties(b.RadDialogOpener,{additionalQueryString:"",enableTelerikManagers:false,handlerUrl:"",container:null,dialogUrlLengthLimit:2000,useClassicDialogs:false,skin:""});
a.registerControlEvents(b.RadDialogOpener,["open","close"]);
b.RadDialogOpener.registerClass("Telerik.Web.UI.RadDialogOpener",b.RadWebControl);
b.ClassicDialog=function(f,e){b.ClassicDialog.initializeBase(this);
this.BrowserWindow=window;
this._dialogOpener=null;
this._clientCallBackFunction=null;
this._window=null;
this._url="";
this._events={close:[],beforeClose:[],show:[]};
};
b.ClassicDialog.prototype={close:function(e){this.raiseEvent("beforeClose");
this.raiseEvent("close");
if(null!=e&&!(e instanceof Sys.UI.DomEvent)){var f=this.get_clientCallBackFunction();
if(typeof(f)=="string"){f=eval(f);
}if(f){f(this,e);
}}var g=this.get_contentFrame();
window.setTimeout(function(){g.close();
g.parent.focus();
},100);
},open:function(f,e){this._window=window.open(this.get_navigateUrl(),e,f);
this._window.focus();
if(!this._window.contentWindow){this._window.contentWindow=this._window;
}this.raiseEvent("show");
return this._window;
},get_dialogOpener:function(){return this._dialogOpener;
},set_dialogOpener:function(e){this._dialogOpener=e;
},get_clientCallBackFunction:function(){return this._clientCallBackFunction;
},set_clientCallBackFunction:function(e){this._clientCallBackFunction=e;
},setUrl:function(e){this._url=e;
},get_navigateUrl:function(){return this._url;
},get_contentFrame:function(){return this._window;
},set_title:function(f){if(this._window&&this._window.document){var e=this._window.document;
e.title=f;
}},dispose:function(){this._window=null;
this._clientCallBackFunction=null;
this._dialogOpener=null;
this._events=null;
b.ClassicDialog.callBaseMethod(this,"dispose");
},add_close:function(e){Array.add(this._events.close,e);
},remove_close:function(e){Array.remove(this._events.close,e);
},add_show:function(e){Array.add(this._events.show,e);
},remove_show:function(e){Array.remove(this._events.show,e);
},add_beforeClose:function(e){Array.add(this._events.beforeClose,e);
},remove_beforeClose:function(e){Array.remove(this._events.beforeClose,e);
},raiseEvent:function(f,e){var g=this._events[f];
this._raiseEvent(g,e);
},_raiseEvent:function(f,e){if(!f||(f.length===0)){return;
}f=Array.clone(f);
if(!f._handler){f._handler=function(m,h){for(var j=0,k=f.length;
j<k;
j++){f[j](m,h);
}};
}var g=f._handler;
if(g){if(!e){e=Sys.EventArgs.Empty;
}g(this,e);
}}};
b.ClassicDialog.registerClass("Telerik.Web.UI.ClassicDialog",Sys.Component);
})();
Type.registerNamespace("Telerik.Web.UI");
if(typeof(Telerik.Web.UI.EditorCommandEventArgs)=="undefined"){Telerik.Web.UI.EditorCommandEventArgs=function(a,b,c){Telerik.Web.UI.EditorCommandEventArgs.initializeBase(this);
this._name=this._commandName=a;
this._tool=b;
this._value=c;
this.value=c;
this._callbackFunction=null;
};
Telerik.Web.UI.EditorCommandEventArgs.prototype={get_name:function(){return this._name;
},get_commandName:function(){return this._commandName;
},get_tool:function(){return this._tool;
},get_value:function(){return this._value;
},set_value:function(a){this.value=a;
this._value=a;
},set_callbackFunction:function(a){this._callbackFunction=a;
}};
Telerik.Web.UI.EditorCommandEventArgs.registerClass("Telerik.Web.UI.EditorCommandEventArgs",Sys.CancelEventArgs);
}