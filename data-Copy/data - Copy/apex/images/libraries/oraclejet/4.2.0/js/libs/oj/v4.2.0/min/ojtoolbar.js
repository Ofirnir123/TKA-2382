/**
 * Copyright (c) 2014, 2018, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 */
"use strict";
define(["ojs/ojcore","jquery","ojs/ojcomponentcore"],function(a,g){(function(){a.ib("oj.ojToolbar",g.oj.baseComponent,{widgetEventPrefix:"oj",options:{chroming:"half"},Gh:function(c,b){this._super(c,b);"disabled"in b&&a.D.warn("Caller attempted to set the 'disabled' option on Toolbar, but Toolbar does not support the 'disabled' option.  See API doc.")},rc:function(){this._super();this.element.attr(a.Components.ir,this.widgetName).addClass("oj-toolbar oj-component").attr("role","toolbar");this.qb()},
li:function(a,b,d){a=this.element.find(":oj-button[tabindex\x3d0]");this.mi(b,d,{launcher:a,position:{of:"keyboard"===d?a.ojButton("widget"):b}})},_setOption:function(c,b){"disabled"===c?a.D.warn("Caller attempted to set the 'disabled' option on Toolbar, but Toolbar does not support the 'disabled' option.  See API doc.  Ignoring the call."):(this._superApply(arguments),"chroming"===c&&this.c7())},refresh:function(){this._super();this.qb()},qb:function(){var a=this;this.uj="rtl"===this.Wc();this.Dl=
void 0;this.$()?(this.fla=function(){a.iRa()},this.element[0].addEventListener("focusin",this.fla,!0),this.yY=this.element.find("oj-button").add(this.element.find("oj-menu-button")).add(this.element.find("oj-buttonset-one")).add(this.element.find("oj-buttonset-many")),this.c7()):(this.Se=this.element.find(":oj-button").unbind("keydown"+this.eventNamespace).bind("keydown"+this.eventNamespace,function(b){a.Or(b,g(this))}).unbind("click"+this.eventNamespace).bind("click"+this.eventNamespace,function(){g(this).ojButton("option",
"disabled")||a.xx(g(this))}).unbind("focus"+this.eventNamespace).bind("focus"+this.eventNamespace,function(){a.TS(g(this))}),this.lca=this.element.find(":oj-buttonset").ojButtonset("refresh"),this.HBa=this.Se.not(this.lca.find(":oj-button")).ojButton("refresh"))},TS:function(a){this.$()||null!=this.Dl?this.xx(a):(this.Dl=this.Se.filter(function(){return!g(this).ojButton("option","disabled")}),this.pT(null==this.xu),this.Dl[0].focus())},iRa:function(){var a=this;this.element[0].removeEventListener("focusin",
this.fla,!0);var b=this.element.find("oj-button").add(this.element.find("oj-menu-button")),d=this.element.find("oj-buttonset-one").add(this.element.find("oj-buttonset-many"));this.yY=b.add(d);this.Se=b.add(d.find(".oj-button")).unbind("keydown"+this.eventNamespace).bind("keydown"+this.eventNamespace,function(b){var d=g(this);a.Or(b,d)}).unbind("click"+this.eventNamespace).bind("click"+this.eventNamespace,function(){var b=g(this);b.hasClass("oj-disabled")||a.xx(b)}).unbind("focusin"+this.eventNamespace).bind("focusin"+
this.eventNamespace,function(){var b=g(this);a.TS(b)});this.Dl=this.Se.filter(function(){return!g(this).hasClass("oj-disabled")});this.pT(null==this.xu);this.QJ(this.Dl[0]).focus()},QJ:function(a){return this.$()?(a=g(a),a.hasClass("oj-button-toggle")?a.children("input")[0]:a.children("button")[0]):a},pT:function(a){var b=g(this.xu);this.xu=void 0;if(this.$())for(var d=0;d<this.Se.length;d++)this.QJ(this.Se[d]).setAttribute("tabindex","-1");else this.Se.attr("tabindex","-1");a=a||!b.is(this.Dl)?this.Dl.first():
b;this.xx(a)},OT:function(a){var b=this.Dl;return a.map(function(a,c){if("radio"!=c.type||c.checked||""==c.name)return c;var f=c.name;f?(f=f.replace(/'/g,"\\'"),f=b.filter(":radio[name\x3d'"+f+"']:oj-button")):f=b.filter(c).filter(":oj-button");f=f.filter(":checked");return f.length?f[0]:c})},xx:function(a){a=this.$()?this.OT(g(this.QJ(a[0]))):this.OT(a);var b=a[0],d=this.xu;b!==d&&(g(d).attr("tabindex","-1"),a.attr("tabindex","0"),this.xu=b)},Or:function(a,b){switch(a.which){case g.ui.keyCode.UP:case g.ui.keyCode.DOWN:if("radio"!=
b.attr("type"))break;case g.ui.keyCode.LEFT:case g.ui.keyCode.RIGHT:a.preventDefault();var d=this.Dl,e=d.length;if(2>e)break;var f=d.index(b);this.QJ(d.eq((f+(a.which==g.ui.keyCode.DOWN||a.which==g.ui.keyCode.RIGHT^this.uj?1:-1)+e)%e)[0]).focus()}},_destroy:function(){this.element.removeClass("oj-toolbar oj-component").removeAttr(a.Components.ir).removeAttr("role");this.Se.attr("tabindex","0");this.c7()},c7:function(){if(this.$())for(var c=0;c<this.yY.length;c++){var b=this.yY[c];"OJ-BUTTON"==b.tagName||
"OJ-MENU-BUTTON"==b.tagName?a.Components.qd(this.QJ(b),"ojButton")&&b.refresh():"OJ-BUTTONSET-ONE"!=b.tagName&&"OJ-BUTTONSET-MANY"!=b.tagName||!a.Components.qd(b,"ojButtonset")||b.refresh()}else this.lca.ojButtonset("refresh"),this.HBa.ojButton("refresh")}})})();a.Components.Kq({ojToolbar:{chroming:a.Components.Ff(function(){return(a.ic.ad("oj-toolbar-option-defaults")||{}).chroming})}});a.J.Ua("oj-toolbar","baseComponent",{properties:{chroming:{type:"string",enumValues:["half","full","outlined"]}},
extension:{Ya:"ojToolbar"}});a.J.register("oj-toolbar",{metadata:a.J.getMetadata("oj-toolbar")})});