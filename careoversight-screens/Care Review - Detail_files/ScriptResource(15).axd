﻿Type.registerNamespace("Telerik.Web.UI");
function GetRadSpell(a){return $find(a);
}$telerik.toSpell=function(a){return a;
};
$telerik.findSpell=$find;
Telerik.Web.UI.RadSpell=function(a){Telerik.Web.UI.RadSpell.initializeBase(this,[a]);
this._dictionaryLanguage=null;
this._languagesDropDown=null;
this._textSource=null;
this._controlToCheck=null;
this._controlsToCheck=null;
this._ajaxUrl=null;
this._clientTextSource=null;
};
Telerik.Web.UI.RadSpell.prototype={initialize:function(){Telerik.Web.UI.RadSpell.callBaseMethod(this,"initialize");
this._languagesDropDown=this._getChildElement("Language");
this._spellCheckButton=this._getChildElement("SpellCheck");
if(this._spellCheckButton){$addHandlers(this._spellCheckButton,{click:this.startSpellCheck},this);
if(this._spellCheckButton.tagName&&this._spellCheckButton.tagName.toLowerCase()!="input"){$addHandlers(this._spellCheckButton,{keypress:this.startSpellCheck},this);
}}this.set_spellChecked(false);
this.add_clientCheckFinished(this.checkFinishedHandler);
this.add_clientCheckStarted(this.checkStartedHandler);
this.raiseEvent("load",Sys.EventArgs.Empty);
},dispose:function(){this._controlToCheck=null;
this._controlsToCheck=null;
this._dialogOpener=null;
if(this._spellCheckButton){$clearHandlers(this._spellCheckButton);
}this.remove_clientCheckFinished(this.checkFinishedHandler);
this.remove_clientCheckStarted(this.checkStartedHandler);
Telerik.Web.UI.RadSpell.callBaseMethod(this,"dispose");
},checkFinishedHandler:function(b,a){b.set_spellChecked(true);
},checkStartedHandler:function(b,a){b.set_spellChecked(false);
},startSpellCheck:function(a){if(a){var b=a.charCode||a.keyCode;
if(a.type=="keypress"&&!(b==13||b==32)){return;
}}var c=this.get_textSource();
if(c!=null){this.spellCheck(c);
}else{alert("Cannot find a TextSource. Please, set the ControlToCheck server-side property, or use the SetTextSource() client-side method.");
}},spellCheck:function(c){var a=new Sys.CancelEventArgs();
this.raiseEvent("clientCheckStarted",a);
if(!a.get_cancel()){var b={dictionaryLanguage:this.get_selectedLanguage(),textSource:c,spell:this};
this.get_dialogOpener().open("SpellCheckDialog",b);
}},get_selectedLanguage:function(){if(this.get_dictionaryLanguage()){return this.get_dictionaryLanguage();
}if(!this._languagesDropDown){return null;
}var a=this._languagesDropDown.options[this._languagesDropDown.selectedIndex];
return a!=null?a.value:null;
},_createElementSource:function(b){var c=null;
var a=$find(b);
if(a&&Telerik.Web.UI.RadWebControl.isInstanceOfType(a)){c=$create(Telerik.Web.UI.Spell.RadControlTextSource,{element:a},null,null);
}else{c=$create(Telerik.Web.UI.Spell.HtmlElementTextSource,{element:$get(b)},null,null);
}return c;
},get_textSource:function(){if(this._textSource==null){if(null!=this.get_controlsToCheck()&&this.get_controlsToCheck().length>0){var c=[];
var a=this.get_controlsToCheck();
for(var b=0;
b<a.length;
b++){c[c.length]=this._createElementSource(a[b]);
}this.set_textSource($create(Telerik.Web.UI.Spell.MultipleHtmlElementsSource,{elements:c},null,null));
}else{if(this.get_controlToCheck()){this.set_textSource(this._createElementSource(this.get_controlToCheck()));
}else{if(this.get_clientTextSource()){this.set_textSource(eval(this.get_clientTextSource()));
}}}}return this._textSource;
},set_textSource:function(a){this._textSource=a;
},get_spellChecked:function(){return this._spellChecked;
},set_spellChecked:function(b){this._spellChecked=b;
var a=$get(this.get_id()+"SpellChecked");
if(a){a.value=b?"true":"";
}},get_dialogOpener:function(){return this._dialogOpener;
},set_dialogOpener:function(a){this._dialogOpener=a;
},get_dictionaryLanguage:function(){return this._dictionaryLanguage;
},set_dictionaryLanguage:function(a){this._dictionaryLanguage=a;
},get_controlToCheck:function(){return this._controlToCheck;
},set_controlToCheck:function(a){this.set_textSource(null);
this._controlToCheck=a;
},get_controlsToCheck:function(){return this._controlsToCheck;
},set_controlsToCheck:function(a){this.set_textSource(null);
this._controlsToCheck=a;
},get_clientTextSource:function(){return this._clientTextSource;
},set_clientTextSource:function(a){this.set_textSource(null);
this._clientTextSource=a;
},get_ajaxUrl:function(){return this._ajaxUrl;
},set_ajaxUrl:function(a){this._ajaxUrl=a;
},get_useClassicDialogs:function(){return this.get_dialogOpener().get_useClassicDialogs();
},set_useClassicDialogs:function(a){this.get_dialogOpener().set_useClassicDialogs(a);
},add_load:function(a){this.get_events().addHandler("load",a);
},remove_load:function(a){this.get_events().removeHandler("load",a);
},add_clientDialogClosing:function(a){this.get_events().addHandler("clientDialogClosing",a);
},remove_clientDialogClosing:function(a){this.get_events().removeHandler("clientDialogClosing",a);
},add_clientCheckCancelled:function(a){this.get_events().addHandler("clientCheckCancelled",a);
},remove_clientCheckCancelled:function(a){this.get_events().removeHandler("clientCheckCancelled",a);
},add_clientCheckFinished:function(a){this.get_events().addHandler("clientCheckFinished",a);
},remove_clientCheckFinished:function(a){this.get_events().removeHandler("clientCheckFinished",a);
},add_clientCheckStarted:function(a){this.get_events().addHandler("clientCheckStarted",a);
},remove_clientCheckStarted:function(a){this.get_events().removeHandler("clientCheckStarted",a);
}};
Telerik.Web.UI.RadSpell.registerClass("Telerik.Web.UI.RadSpell",Telerik.Web.UI.RadWebControl);
Type.registerNamespace("Telerik.Web.UI.Spell");
Telerik.Web.UI.Spell.HtmlTextSourceBase=function(a){Telerik.Web.UI.Spell.HtmlTextSourceBase.initializeBase(this);
this._element=a;
this._checkTextAsHtml=false;
};
Telerik.Web.UI.Spell.HtmlTextSourceBase.prototype={dispose:function(){this._element=null;
Telerik.Web.UI.Spell.HtmlTextSourceBase.callBaseMethod(this,"dispose");
},get_text:function(){return"This method must be overridden in an inherited class!";
},set_text:function(a){},get_element:function(){return this._element;
},set_element:function(a){this._element=a;
},get_checkTextAsHtml:function(){return this._checkTextAsHtml;
},set_checkTextAsHtml:function(a){this._checkTextAsHtml=a;
}};
Telerik.Web.UI.Spell.HtmlTextSourceBase.registerClass("Telerik.Web.UI.Spell.HtmlTextSourceBase",Sys.Component);
Telerik.Web.UI.Spell.RadControlTextSource=function(a){Telerik.Web.UI.Spell.RadControlTextSource.initializeBase(this,[a]);
};
Telerik.Web.UI.Spell.RadControlTextSource.prototype={initialize:function(){Telerik.Web.UI.Spell.RadControlTextSource.callBaseMethod(this,"initialize");
var a=this.get_element();
if(a==null){alert("Could not find target RadControl. Please verify that ControlToCheck/ControlsToCheck points to valid RadControl instances.");
this.set_element({});
}},get_text:function(){var b="";
var a=this.get_element();
if(a.get_html){b=a.get_html();
}else{if(a.get_text){b=a.get_text();
}else{if(a.get_value){b=a.get_value();
}else{alert("Cannot access text of RadControl.");
}}if(!this.get_checkTextAsHtml()){b=b.replace(/</g,"<rslt/&lt;").replace(/>/g,"<rsgt/>&gt;").replace(/<rslt\/&lt;/g,"<rslt/>&lt;");
}}return b;
},set_text:function(b){var a=this.get_element();
if(!a||null==b){return;
}if(a.set_html){a.set_html(b);
}else{if(!this.get_checkTextAsHtml()){b=b.replace(/<rslt\/>&lt;/gi,"<").replace(/<rsgt\/>&gt;/gi,">");
}if(a.set_text){a.set_text(b);
}else{if(a.set_value){a.set_value(b);
}else{alert("Cannot access text of RadControl.");
}}}}};
Telerik.Web.UI.Spell.RadControlTextSource.registerClass("Telerik.Web.UI.Spell.RadControlTextSource",Telerik.Web.UI.Spell.HtmlTextSourceBase);
Telerik.Web.UI.Spell.HtmlElementTextSource=function(a){Telerik.Web.UI.Spell.HtmlElementTextSource.initializeBase(this,[a]);
};
Telerik.Web.UI.Spell.HtmlElementTextSource.prototype={initialize:function(){Telerik.Web.UI.Spell.HtmlElementTextSource.callBaseMethod(this,"initialize");
var a=this.get_element();
if(a==null){alert("Could not find target HTML element. Please verify that ControlToCheck/ControlsToCheck points to valid HTML controls.");
this.set_element({value:""});
}else{if(a.nodeName=="IFRAME"&&a.contentWindow!=null){this.set_element(a.contentWindow.document.body);
}}a=null;
},get_text:function(){var b="";
if(this.get_element().value!=null){try{b=this.get_element().value;
}catch(a){alert("Error getting text from control.\n"+a.message);
}if(!this.get_checkTextAsHtml()){b=b.replace(/</g,"<rslt/&lt;").replace(/>/g,"<rsgt/>&gt;").replace(/<rslt\/&lt;/g,"<rslt/>&lt;");
}}else{if(this.get_element().innerHTML!=null){try{b=this.get_element().innerHTML;
}catch(a){alert("Error getting HTML from the control.\n"+a.message);
}}else{alert("No value or innerHTML attribute. Cannot access text.");
}}return b;
},set_text:function(a){if(this.get_element()==null){return;
}if(this.get_element().value!=null){if(!this.get_checkTextAsHtml()){a=a.replace(/<rslt\/>&lt;/gi,"<").replace(/<rsgt\/>&gt;/gi,">");
}this.get_element().value=a;
}else{if(this.get_element().innerHTML!=null){this.get_element().innerHTML=a;
}else{alert("No value or innerHTML attribute. Cannot access text.");
}}}};
Telerik.Web.UI.Spell.HtmlElementTextSource.registerClass("Telerik.Web.UI.Spell.HtmlElementTextSource",Telerik.Web.UI.Spell.HtmlTextSourceBase);
Telerik.Web.UI.Spell.MultipleHtmlElementsSource=function(a){Telerik.Web.UI.Spell.MultipleHtmlElementsSource.initializeBase(this);
this._elements=a;
};
Telerik.Web.UI.Spell.MultipleHtmlElementsSource.prototype={initialize:function(){Telerik.Web.UI.Spell.MultipleHtmlElementsSource.callBaseMethod(this,"initialize");
},dispose:function(){this._elements=null;
Telerik.Web.UI.Spell.MultipleHtmlElementsSource.callBaseMethod(this,"dispose");
},get_text:function(){var b=[];
for(var a=0;
a<this._elements.length;
a++){b[b.length]=this._elements[a].get_text();
}return b.join("<controlSeparator><br/></controlSeparator>");
},set_text:function(b){var c=b.split("<controlSeparator><br/></controlSeparator>");
for(var a=0;
a<this._elements.length;
a++){this._elements[a].set_text(c[a]);
}},get_elements:function(){return this._elements;
},set_elements:function(a){this._elements=a;
}};
Telerik.Web.UI.Spell.MultipleHtmlElementsSource.registerClass("Telerik.Web.UI.Spell.MultipleHtmlElementsSource",Sys.Component);
