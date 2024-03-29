﻿Type.registerNamespace("Telerik.Web.UI");
$telerik.findTimeView=$find;
$telerik.toTimeView=function(a){return a;
};
Telerik.Web.UI.RadTimeView=function(a){Telerik.Web.UI.RadTimeView.initializeBase(this,[a]);
this._itemsCount=null;
this._timeOverStyleCss=null;
this._ownerDatePickerID=null;
this._itemStyles=null;
this._culture=null;
this._timeFormat=null;
this._useClientTimeOffset=false;
this._columns=3;
this._showFooter=true;
this._showHeader=true;
this._startTime=new Date(1990,1,0,0,0,0,0);
this._endTime=new Date(1990,1,0,23,59,59,0);
this._interval=new Date(1990,1,0,1,0,0,0);
this._customTimes=[];
this._onCellMouseOutDelegate=null;
this._onCellMouseOverDelegate=null;
this._onCellMouseOverDelegate=null;
this._dataSource=null;
this._renderDirection=="Horizontal";
this._enableAriaSupport=false;
};
Telerik.Web.UI.RadTimeView.prototype={initialize:function(){Telerik.Web.UI.RadTimeView.callBaseMethod(this,"initialize");
this.DivElement=$get(this.get_id());
if($telerik.isIE7||$telerik.isIE8){if(this.get_showFooter()&&this.DivElement.innerHTML.indexOf("rcFooter")==-1){this.set_showFooter(false);
}}else{if(this.get_showFooter()&&this.DivElement.innerHTML.indexOf('"rcFooter"')==-1){this.set_showFooter(false);
}}this._timeMatrix=this._setTimeMatrix();
this._tempStyle=null;
if(this.get_enableAriaSupport()){this._initializeAriaSupport();
}this._attachEventHandlers();
},dispose:function(){if(this._onCellMouseOutDelegate){window.$removeHandler(this.DivElement,"mouseout",this._onCellMouseOutDelegate);
this._onCellMouseOutDelegate=null;
}if(this._onCellMouseOverDelegate){window.$removeHandler(this.DivElement,"mouseover",this._onCellMouseOverDelegate);
this._onCellMouseOverDelegate=null;
}if(this._onCellClickDelegate){window.$removeHandler(this.DivElement,"click",this._onCellClickDelegate);
this._onCellClickDelegate=null;
}Telerik.Web.UI.RadTimeView.callBaseMethod(this,"dispose");
},set_customTimes:function(b){for(var a=0;
a<b.length;
a++){Array.add(this._customTimes,this._deserializerTime(b[a]));
}},get_customTimes:function(a){return this._customTimes;
},getTime:function(){var a=$find(this.get__OwnerDatePickerID());
return a.get_selectedDate();
},setTime:function(e,f,g,d){var c=$find(this.get__OwnerDatePickerID());
var b;
if(Object.getType(c).getName()=="Telerik.Web.UI.RadDateTimePicker"&&!c.get_calendar()){b=d;
}else{b=c.get_selectedDate();
}if(!b){b=new Date();
}b.setHours(e);
b.setMinutes(f);
b.setSeconds(g);
if(c.get_autoPostBackControl()!=Telerik.Web.UI.Calendar.AutoPostBackControl.Both&&c.get_autoPostBackControl()!=Telerik.Web.UI.Calendar.AutoPostBackControl.TimeView){var a=function(i,h){h.set_cancel(true);
};
c._dateInput.add_valueChanged(a);
c.set_selectedDate(b);
c._dateInput.remove_valueChanged(a);
}else{c.set_selectedDate(b);
}},get_dataSource:function(){return this._dataSource;
},set_dataSource:function(a){if(this._dataSource!==a){this._dataSource=a;
this.raisePropertyChanged("dataSource");
}},get_itemStyles:function(){return this._itemStyles;
},set_itemStyles:function(a){if(this._itemStyles!==a){this._itemStyles=a;
this.raisePropertyChanged("itemStyles");
}},get__renderDirection:function(){return this._renderDirection;
},set__renderDirection:function(a){this._renderDirection=a;
this.raisePropertyChanged("renderDirection");
},get_columns:function(){return this._columns;
},set_columns:function(a){if(this._columns!==a){this._columns=a;
this.raisePropertyChanged("columns");
}},get_showFooter:function(){return this._showFooter;
},set_showFooter:function(a){if(this._showFooter!==a){this._showFooter=a;
this.raisePropertyChanged("showFooter");
}},get_showHeader:function(){return this._showHeader;
},set_showHeader:function(a){if(this._showHeader!==a){this._showHeader=a;
this.raisePropertyChanged("showHeader");
}},get_startTime:function(){return this._startTime;
},set_startTime:function(b){var a=this._deserializerTime(b);
if(this._startTime!==a){this._startTime=a;
this.raisePropertyChanged("startTime");
}},get_endTime:function(){return this._endTime;
},set_endTime:function(b){var a=this._deserializerTime(b);
if(this._endTime!==a){this._endTime=a;
this.raisePropertyChanged("endTime");
}},get_interval:function(){return this._interval;
},set_interval:function(b){var a=this._deserializerTime(b);
if(this._interval!==a){this._interval=a;
this.raisePropertyChanged("interval");
}},get_culture:function(){return this._culture;
},get_timeFormat:function(){return this._timeFormat;
},get_enableAriaSupport:function(){return this._enableAriaSupport;
},_initializeAriaSupport:function(){var l=this._findTableElement(this.DivElement);
if(l){l.setAttribute("role","grid");
l.setAttribute("aria-atomic","true");
l.setAttribute("aria-labelledby",this.DivElement.id);
this.DivElement.setAttribute("role","presentation");
var k=l.rows;
var e;
for(e=0;
e<k.length;
e++){var h=k[e];
h.setAttribute("role","row");
var b=h.cells;
for(var f=0;
f<b.length;
f++){var a=b[f];
a.setAttribute("role","gridcell");
}}var d=l.getElementsByTagName("th");
var g=d.length;
for(e=0;
e<g;
e++){var c=d[e];
if(c.scope==="col"){c.setAttribute("role","columnheader");
}}}},_clearHovers:function(){var b=this.get_element().getElementsByTagName("td");
for(var a=0;
a<b.length;
a++){if(b[a].className&&b[a].className.indexOf("rcHover")!=-1){b[a].className=b[a].className.replace("rcHover","");
}}},_selectTimeCell:function(a,d){var f=null;
var e=null;
for(var b=0;
b<this._timeMatrix.length;
b++){for(var c=0;
c<this._timeMatrix[b].length;
c++){if(!this._timeMatrix[b][c]){continue;
}if(this._timeMatrix[b][c].getHours()==a&&this._timeMatrix[b][c].getMinutes()==d){f=b;
e=c;
}}}this._clearSelection();
this._selectTableCell(f,e);
},_selectTableCell:function(d,c){var b=this._findTableElement(this.DivElement);
if(d!=null&&c!=null&&b){var a=b.rows[d].cells[c];
a.className+=" rcSelected";
a.id=this.get_id()+"_selectedCell";
if(this.get_enableAriaSupport()){a.setAttribute("aria-selected","true");
}}},_clearSelection:function(){var a=$get(this.get_id()+"_selectedCell");
if(a){a.className=a.className.replace("rcSelected","");
a.removeAttribute("id");
if(this.get_enableAriaSupport()){a.removeAttribute("aria-selected");
}}},_attachEventHandlers:function(){this._onCellMouseOutDelegate=Function.createDelegate(this,this._onCellMouseOutHandler);
this._onCellMouseOverDelegate=Function.createDelegate(this,this._onCellMouseOverHandler);
this._onCellClickDelegate=Function.createDelegate(this,this._onCellClickHandler);
window.$addHandler(this.DivElement,"mouseout",this._onCellMouseOutDelegate);
window.$addHandler(this.DivElement,"mouseover",this._onCellMouseOverDelegate);
window.$addHandler(this.DivElement,"click",this._onCellClickDelegate);
},_onCellMouseOutHandler:function(a){if(this._tempStyle==null){return;
}var b=Telerik.Web.UI.Calendar.Utils.FindTarget(a,this.get_id());
if(b==null){return;
}if(b.className.indexOf("rcHeader")==-1&&b.className.indexOf("rcFooter")==-1){b.style.cssText=this._tempStyle[0];
b.className=this._tempStyle[1];
}},_onCellMouseOverHandler:function(a){var c=Telerik.Web.UI.Calendar.Utils.FindTarget(a,this.get_id());
if(c==null){return;
}if(c.className.indexOf("rcHeader")==-1&&c.className.indexOf("rcFooter")==-1){var b=new Array(2);
b[0]=c.style.cssText;
b[1]=c.className;
this._tempStyle=b;
c.style.cssText=this.get_itemStyles()["TimeOverStyle"][0];
c.className=this.get_itemStyles()["TimeOverStyle"][1];
}},_onCellClickHandler:function(d){var m=Telerik.Web.UI.Calendar.Utils.FindTarget(d,this.get_id());
if(m!=null){var b=m.cellIndex;
if(navigator.userAgent.match(/Safari/)){var n=m.parentNode;
var h;
for(h=0;
h<n.cells.length;
h++){if(n.cells[h]==m){b=h;
}}}var j=this._findTime(m.parentNode.rowIndex,b);
if(j!=null){this._onCellMouseOutHandler(d);
var k=this.getTime();
if(k!=null){j.setDate(k.getDate());
j.setMonth(k.getMonth());
j.setYear(k.getFullYear());
}var l=new Telerik.Web.UI.TimeViewSelectingEventArgs(j,k);
var a=this.raise_clientTimeSelecting(l);
if(!a){this.setTime(j.getHours(),j.getMinutes(),j.getSeconds(),j);
j=this.getTime();
if((k-j)!=0){this._clearSelection();
this._selectTableCell(m.parentNode.rowIndex,b);
var f=new Telerik.Web.UI.TimeViewSelectedEventArgs(j,k);
this.raise_clientTimeSelected(f);
}}}}var c=(d.srcElement)?d.srcElement:d.target;
if(c.tagName&&c.tagName.toLowerCase()=="a"){var g=c.getAttribute("href",2);
if(g=="#"||(location.href+"#"==g)){if(d.preventDefault){d.preventDefault();
}return false;
}}},_findTableElement:function(a){var b=a.getElementsByTagName("table");
if(b.length>0){return b[0];
}return null;
},_findTime:function(b,a){var c=this._timeMatrix[b][a];
if(c!=null){return new Date(c);
}return null;
},_setTimeMatrix:function(){var e=0;
var y=new Array(this.get__ItemsCount());
var s=new Date(this.get_startTime().getFullYear(),this.get_startTime().getMonth(),this.get_startTime().getDate(),this.get_startTime().getHours(),this.get_startTime().getMinutes(),this.get_startTime().getSeconds(),this.get_startTime().getMilliseconds());
var v;
var h;
if(this.get_dataSource()==null){if(this._customTimes.length==0){while(s<this.get_endTime()){var d=s.getHours();
var o=s.getMinutes();
var q=s.getSeconds();
var l=s.getMilliseconds();
v=new Date(s.getFullYear(),s.getMonth(),s.getDate(),s.getHours(),s.getMinutes(),s.getSeconds(),s.getMilliseconds());
y[e]=v;
e++;
s.setHours(d+this.get_interval().getHours());
s.setMinutes(o+this.get_interval().getMinutes());
s.setSeconds(q+this.get_interval().getSeconds());
s.setMilliseconds(l+this.get_interval().getMilliseconds());
}}else{for(e=0;
e<this._customTimes.length;
e++){var A=this._customTimes[e];
v=new Date(A.getFullYear(),A.getMonth(),A.getDate(),A.getHours(),A.getMinutes(),A.getSeconds(),A.getMilliseconds());
y[e]=v;
}}}var w=this._findTableElement(this.DivElement);
var x=w.rows.length;
var z=new Array(x);
for(e=0;
e<x;
e++){z[e]=new Array(this.get_columns());
for(h=0;
h<this.get_columns();
h++){z[e][h]=null;
}}var p=0;
var k=0;
if(this.get_showHeader()){p=1;
}var r=false;
if(this.get_dataSource()!=null){r=true;
}var a=(r)?this.get_dataSource():y;
if(this._renderDirection=="Horizontal"){for(e=0;
e<a.length;
e++){if(!z[p]){break;
}z[p][k]=(r)?new Date(parseInt(a[e].replace("/Date(","").replace(")/",""),10)):a[e];
if(r&&this._useClientTimeOffset){var c=z[p][k];
c.setMinutes(c.getMinutes()+c.getTimezoneOffset());
}k++;
if(k==this.get_columns()){k=0;
p++;
}}}else{var u=0;
var b=0;
var g=this.get_showHeader()?1:0;
var f=this.get_showFooter()?1:0;
for(h=0;
h<this.get_columns();
h++){for(e=p;
e<x-f;
e++){if(w.rows[e].cells[h]&&w.rows[e].cells[h].innerHTML.length>0){z[e][h]=(r)?new Date(parseInt(a[u+e-g-b].replace("/Date(","").replace(")/",""),10)):a[u+e-g-b];
}else{b++;
}}u=u+e-g;
}}return z;
},_deserializerTime:function(b){if(typeof(b)=="string"){b=b.split(/-/);
}var a=new Date(1990,1,b[0],b[1],b[2],b[3],b[4]);
return a;
},get__ItemsCount:function(){return this._itemsCount;
},set__ItemsCount:function(a){if(this._itemsCount!==a){this._itemsCount=a;
}},get__TimeOverStyleCss:function(){return this._timeOverStyleCss;
},set__TimeOverStyleCss:function(a){if(this._timeOverStyleCss!==a){this._timeOverStyleCss=a;
}},get__OwnerDatePickerID:function(){return this._ownerDatePickerID;
},set__OwnerDatePickerID:function(a){if(this._ownerDatePickerID!==a){this._ownerDatePickerID=a;
}},add_clientTimeSelecting:function(a){this.get_events().addHandler("clientTimeSelecting",a);
},add_clientTimeSelected:function(a){this.get_events().addHandler("clientTimeSelected",a);
},remove_clientTimeSelecting:function(a){this.get_events().removeHandler("clientTimeSelecting",a);
},remove_clientTimeSelected:function(a){this.get_events().removeHandler("clientTimeSelected",a);
},raise_clientTimeSelecting:function(a){this.raiseEvent("clientTimeSelecting",a);
return a.get_cancel();
},raise_clientTimeSelected:function(a){this.raiseEvent("clientTimeSelected",a);
}};
Telerik.Web.UI.RadTimeView.registerClass("Telerik.Web.UI.RadTimeView",Telerik.Web.UI.RadWebControl);
