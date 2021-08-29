/**
 * Copyright (c) 2014, 2018, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 */
"use strict";
define(["ojs/ojcore","jquery","knockout","jqueryui-amd/widget","ojs/ojkoshared"],function(a,g,c){function b(){this.Init()}function d(b,a){var c={};c.value=a.value;return c}function e(b,a,c){a={};var d=c.optionMetadata;if(d&&"shouldWrite"===d.writeback){var e=c.option;a[e]=c.value;d.readOnly&&(b.nAa[e]=!0)}return a}function f(b,a,c){"pieCenter"===b&&a.template&&(a._renderer=r(c,a.template));return{pieCenter:a}}function h(b,a){return function(d){var e,f;e=d.parentElement;f=b.createChildContext(d.data,
null,function(b){b.$optionContext=d});c.renderTemplate(a,f,null,e);return null}}function k(b,a,c){return"optionTemplate"===b&&null!==a?{optionRenderer:h(c,String(a))}:null}function l(b,a){this.Init(b,a)}function m(b,a){var c={};return function(d){var e,f;e=d.parentElement;f=b.createChildContext(d.data,null,function(b){b.$key=d.key;b.$metadata=d.metadata;b.$headerContext=d});t(d,a,e,f,c);return null}}function n(b,a){var c={};return function(d){var e,f;e=d.parentElement;f=b.createChildContext(d.data,
null,function(b){b.$keys=d.keys;b.$metadata=d.metadata;b.$cellContext=d;b.$cell=d.cell});t(d,a,e,f,c);return null}}function t(b,a,d,e,f){b="function"===typeof a?a(b):a;f=s(b,f);c.virtualElements.setDomNodeChildren(d,f);c.applyBindingsToDescendants(e,d);for(e=0;e<d.childNodes.length;e++)if(1==d.childNodes[e].nodeType){g(d.childNodes[e])._ojDetectCleanData({cleanParent:!0});break}}function s(b,a){var d=a[b];null==d&&(d=c.utils.parseHtmlFragment(document.getElementById(b).innerHTML),a[b]=d);return d.map(function(b){return b.cloneNode(!0)})}
function p(b,a,c){if("areaLayers"===b){for(b=0;b<a.length;b++){var d=a[b].areaDataLayer;if(d){var e=d.template;null!=e&&(d._templateRenderer=u(c,e))}}return{areaLayers:a}}if("pointDataLayers"===b){for(b=0;b<a.length;b++)e=a[b].template,null!=e&&(a[b]._templateRenderer=u(c,e));return{pointDataLayers:a}}return null}function q(b,a,c){"nodeContent"===b&&a.template&&(a._renderer=r(c,a.template));return{nodeContent:a}}function r(b,a){return function(d){var e=b.createChildContext(d.context);c.renderTemplate(a,
e,{afterRender:function(b){g(b)._ojDetectCleanData()}},d.parentElement);return null}}function u(b,a){return function(d){var e=b.createChildContext(d.data);c.renderTemplate(a,e,{afterRender:function(b){g(b)._ojDetectCleanData()}},d.parentElement);return null}}function w(b,a,c){"tooltip"===b&&a.template&&(a._renderer=r(c,a.template));return{tooltip:a}}function v(b,a,c){"center"===b&&a.template&&(a._renderer=r(c,a.template));return{center:a}}function x(b,a,d){var e={};(function(a,d){e=function(e){var f=
null,h=null;"header"==d?(f=b.createChildContext(null,null,function(b){b.$columnIndex=e.columnIndex;b.$headerContext=e.headerContext;b.$data=e.data}),h=e.headerContext.parentElement):"cell"==d&&(f=b.createChildContext(e.row,null,function(b){b.$columnIndex=e.columnIndex;b.$cellContext=e.cellContext}),h=e.cellContext.parentElement);"footer"==d&&(f=b.createChildContext(null,null,function(b){b.$columnIndex=e.columnIndex;b.$footerContext=e.footerContext}),h=e.footerContext.parentElement);c.renderTemplate(a,
f,{afterRender:function(b){g(b)._ojDetectCleanData()}},h,"replaceNode")}})(d,a);return e}function y(b,a){return function(d){var e=b.createChildContext(d.row,null,function(b){b.$rowContext=d.rowContext});c.renderTemplate(a,e,{afterRender:function(b){g(b)._ojDetectCleanData()}},d.rowContext.parentElement,"replaceNode")}}function z(b,c,d,e,f){b=G(b,c,d,e);d=b.I0a;if(null==d)return f;var h={};C(d,function(b,a){h[b]=a});f=a.tc.Md({},f);f[c]=A(e,h,b.L0a);return f}function A(b,c,d){function e(){var d={};
Object.keys(c).forEach(function(e){var f=a.xa.GI(c[e]).bind(null,b);Object.defineProperty(d,e,{get:f,enumerable:!0})});Object.defineProperty(d,a.xa.Qfa,{value:c});return d}e.toString=function(){return d};return e}function B(b,a,c){var d=a.getBindingsString;if(d)return d.call(a,b,c);switch(b.nodeType){case 1:return b.getAttribute("data-bind");case 8:return(b=b.nodeValue.match(/^\s*ko(?:\s+([\s\S]+))?\s*$/))?b[1]:null}return null}function G(b,a,d,e){var f=null;b=B(b,d,e);b=c.jsonExpressionRewriting.parseObjectLiteral(b);
var h=null;C(b,function(b,c){return b===a?(h=c,!0):!1});null!=h&&0===h.indexOf("{")&&(f=c.jsonExpressionRewriting.parseObjectLiteral(h));return{I0a:f,L0a:h}}function C(b,a){for(var c=0;c<b.length;c++){var d=b[c],e=d.key,d=d.value;if(null!=e&&null!=d&&a(e.trim(),d.trim()))break}}function H(b,a,c){"rootNodeContent"===b&&a.template&&(a._renderer=r(c,a.template));return{rootNodeContent:a}}function M(b,a){return function(d){var e,f;e=d.parentElement;f=b.createChildContext(d.data,null,function(b){b.$itemContext=
d});c.renderTemplate(a,f,{afterRender:function(b){g(b)._ojDetectCleanData()}},e,"replaceNode");return null}}function F(b,a,c){return"item"==b?(b=a.template,null!=b&&(a.renderer=M(c,b)),{item:a}):null}a.f.ua(b,a.f,"ComponentBinding.GlobalChangeQueue");b.prototype.Init=function(){b.N.Init.call(this);this.iV=[];this.vL=[]};b.prototype.X5a=function(b){-1===this.iV.indexOf(b)&&(this.iV.push(b),this.qR||(this.qR=setTimeout(a.f.Sva(this,this.Tja),1)))};b.prototype.ZV=function(){this.qR&&clearTimeout(this.qR);
this.Tja()};b.prototype.Tja=function(){var b;this.qR=null;var a=this.iV;this.iV=[];for(b=0;b<a.length;b++){var c=a[b];this.vL.push({Yba:c,Qx:c.n2a()})}for(;0<this.vL.length;)b=this.vL.shift(),b.Yba.w0a(b.Qx)};a.xa=function(b,a){this.Init(b,a)};o_("ComponentBinding",a.xa,a);a.f.ua(a.xa,a.f,"oj.ComponentBinding");a.xa.create=function(b,d){if(null==b)throw"Binding name is required!";var e=new a.xa(b,d),f=c.bindingHandlers,h,k=Array.isArray(b)?b:[b];for(h=0;h<k.length;h++){var g=k[h];a.xa.dga.push(g);
f[g]=e}return e};o_("ComponentBinding.create",a.xa.create,a);a.xa.xh=function(){return a.xa.gn};o_("ComponentBinding.getDefaultInstance",a.xa.xh,a);a.xa.prototype.Bh=function(b){var a=b["for"],a=null==a?"@global":a,c=this.NT[a]||[];c.push(b);this.NT[a]=c};a.f.j("ComponentBinding.prototype.setupManagedAttributes",{Bh:a.xa.prototype.Bh});a.xa.ZV=function(){a.xa.y1.ZV()};o_("ComponentBinding.deliverChanges",a.xa.ZV,a);a.xa.prototype.Init=function(b,c){a.xa.N.Init.call(this);"string"===typeof c&&(c={componentName:c});
this.f1=c||{};Array.isArray(b);this.init=this._init.bind(this);this.update=this.Fx.bind(this);this.NT={}};a.xa.prototype._init=function(b,a,d,e,f){c.applyBindingsToDescendants(f,b);return{controlsDescendantBindings:!0}};a.xa.prototype.Fx=function(b,d,e,f,h){function k(b){t.forEach(function(b){b.dispose()});t=[];b&&s&&(s("destroy"),s=null);n&&(n.bv(),n=null);p.off(a.xa.ifa)}function m(c,d,f){if(null!=c){var k=p[c];if("function"!==typeof k)a.D.error("Component %s is not found",c);else{k=k.bind(p);n=
new l(function(b){var c=a.xa.Zga(b);k("option",b);b=Object.keys(c);for(var d=0;d<b.length;d++){var e=b[d];k("option",e,c[e])}},a.xa.y1);var g=Object.keys(f).filter(function(b){return!(null==b||b===d)});s=this.CSa(b,{aa:k,IM:n,Jva:c,jO:g,j1a:t,Sy:function(){return f},PF:e,BB:h,U1a:function(){s=null},nAa:{}})}}}var t=[],r=0,s,n,p=g(b);c.ignoreDependencies(function(){c.computed(function(){var b=c.utils.unwrapObservable(d());"object"!==typeof b&&a.D.error("ojComponent binding should evaluate to an object");
var e=this.f1.componentName,f,h=!1;if(null==e&null!=b){for(var g=[a.xa.bEa,"role"],l=0;!h&&l<g.length;l++)f=g[l],f in b&&(h=!0,e=b[f]);h||a.D.error("component attribute is required for the ojComponent binding");e=c.utils.unwrapObservable(e)}0==r?r=1:c.ignoreDependencies(k,this,[!0]);c.ignoreDependencies(m,this,[e,f,b])},this,{disposeWhenNodeIsRemoved:b})},this);c.utils.domNodeDisposal.addDisposeCallback(b,k.bind(this,!1))};a.xa.prototype.CSa=function(b,d){function e(){var c=this.fWa,f=a.xa.k_a(d.Sy()[c]);
if(0===k){var g=n[c];if(null!=g){if(l[c]=g,g=g.Ro,null!=g)for(c=g(c,f,b,t,d.Sy,d.PF,d.BB)||{},f=Object.keys(c),g=0;g<f.length;g++){var m=f[g];q[m]=a.xa.qw(c[m])}}else q[c]=a.xa.qw(f)}else if(!h)if(null!=n[c]){if(g=n[c].update,null!=g)for(c=g(c,f,b,t,d.Sy,d.PF,d.BB)||{},f=Object.keys(c),g=0;g<f.length;g++)m=f[g],d.IM.p9(m,a.xa.qw(c[m]))}else d.nAa[c]||d.IM.p9(c,a.xa.qw(f))}function f(c){c.target&&c.target==b&&(d.U1a(),(c=s.f1.beforeDestroy)&&c(b,t,d.Sy,d.PF,d.BB),a.xa.Uja(!1,l,b,t,d.Sy,d.PF,d.BB),
h=!0,d.IM.bv(),b.removeEventListener("_ojDestroy",f))}var h=!1,k=0,l={},m=g(b),t=d.aa,r=d.Jva,s=this;b.addEventListener("_ojDestroy",f);var n=a.xa.isa(this.NT,d.jO,r),p=a.xa.xh();this!==p&&(r=p.NOa(d.jO,r),a.tc.Md(r,n),n=r);for(var q={},r=0;r<d.jO.length;r++)d.j1a.push(c.computed(e,{fWa:d.jO[r]}));k=1;a.xa.KWa(m,d);var u=a.xa.Zga(q);t(q);Object.keys(u).forEach(function(b){t("option",b,u[b])});(m=this.f1.afterCreate)&&m(b,t,d.Sy,d.PF,d.BB);a.xa.Uja(!0,l,b,t,d.Sy,d.PF,d.BB);q=null;return t};a.xa.GI=
function(b){return new Function("$context","with($context){with($data||{}){return "+b+";}}")};a.xa.prototype.NOa=function(b,c){return a.xa.isa(this.NT,b,c)};a.xa.isa=function(b,a,c){function d(a,c){var e=b[a];if(null!=e)for(var h=e.length-1;0<=h;h--){var k=e[h];null!=k.attributes&&f.push(k);if(c&&(k=k.use,null!=k))for(var k=Array.isArray(k)?k:[k],g=0;g<k.length;g++)d(k[g],!0)}}var e={},f=[];d(c,!0);c=g.oj[c];if(null!=c)for(c=Object.getPrototypeOf(c.prototype);null!=c&&"oj"===c.namespace;)d(c.widgetName,
!0),c=Object.getPrototypeOf(c);d("@global",!1);if(0<f.length)for(c=0;c<a.length;c++)for(var h=a[c],k=0;k<f.length;k++){var l=f[k];if(0<=l.attributes.indexOf(h)){e[h]={Ro:l.init,update:l.update,NF:l.afterCreate,K0a:l.beforeDestroy};break}}return e};a.xa.ifa=".oj_ko";a.xa.KWa=function(b,c){for(var f={"^slider$":[{event:"slidechange",getter:d}],"^oj*":[{event:"ojoptionchange",getter:e.bind(void 0,c)}]},h={},k=Object.keys(f),g=0;g<k.length;g++){var l=k[g];if(c.Jva.match(l)){f=f[l];for(k=0;k<f.length;k++)g=
f[k],b.on(g.event+a.xa.ifa,{u3a:g.getter},function(d,e){if(d.target===b[0])for(var f=d.data.u3a(d,e),k=c.Sy(),g=Object.keys(f),l=0;l<g.length;l++){var m=g[l];c.IM.k7a(m);try{if(0<=c.jO.indexOf(m)){var t=k[a.xa.Qfa];a.xa.j0a(m,k[m],f[m],null==t?null:t[m],c.BB,h)}}finally{c.IM.x6a(m)}}});break}}};a.xa.j0a=function(b,d,e,f,h,k){null!=d&&c.isObservable(d)?c.isWriteableObservable(d)&&d(a.xa.qw(e)):(b in k||(d=null,f=a.C0.txa(f),null!=f&&(d=a.xa.GI(f)),k[b]=d),(b=k[b])&&b(h)(a.xa.qw(e)))};a.xa.k_a=function(b){b=
c.utils.unwrapObservable(b);(Array.isArray(b)||a.tc.isPlainObject(b))&&b.ojConvertToJS&&(b=c.toJS(b));return b};a.xa.qw=function(b){Array.isArray(b)&&(b=b.slice());return b};a.xa.Zga=function(b){for(var a={},c=Object.keys(b),d=0;d<c.length;d++){var e=c[d];0<=e.indexOf(".")&&(a[e]=b[e],delete b[e])}return a};a.xa.Uja=function(b,a,c,d,e,f,h){for(var k=Object.keys(a),g=0;g<k.length;g++){var l=k[g],m=a[l];(m=b?m.NF:m.K0a)&&m(l,c,d,e,f,h)}};a.xa.y1=new b;a.xa.qHa=function(){return a.tw()&&c?c.version:
""};a.xa.FTa=function(b){return 0<=a.xa.dga.indexOf(b)};a.xa.dga=[];a.xa.bEa="component";a.xa.Qfa="_ojOptions";(function(){var b=c.removeNode;c.removeNode=function(c){var d=a.Components;d&&a.Q.TAa(c);try{b(c)}finally{d&&a.Q.TAa(null)}}})();a.xa.gn=a.xa.create(["ojComponent","jqueryUI"]);g.widget("oj._ojDetectCleanData",{options:{cleanParent:!1},_destroy:function(){var b,a;b=c.utils.domNodeDisposal;a=b.cleanExternalData;b.cleanExternalData=function(){};try{this.options.cleanParent&&null!=this.element[0].parentNode?
c.cleanNode(this.element[0].parentNode):c.cleanNode(this.element[0])}finally{b.cleanExternalData=a}}});a.xa.xh().Bh({attributes:["pieCenter"],init:function(b,a,c,d,e,h,k){return f(b,a,k)},update:function(b,a,c,d,e,h,k){return f(b,a,k)},"for":"ojChart"});a.xa.xh().Bh({attributes:["optionTemplate"],init:function(b,a,c,d,e,f,h){b=k(b,a,h);if(null!==b)return b},update:function(b,a,c,d,e,f,h){return k(b,a,h)},"for":"ComboboxOptionRenderer"});a.xa.xh().Bh({"for":"ojCombobox",use:"ComboboxOptionRenderer"});
a.xa.xh().Bh({"for":"ojSelect",use:"ComboboxOptionRenderer"});a.xa.xh().Bh({"for":"ojInputSearch",use:"ComboboxOptionRenderer"});a.f.ua(l,a.f,"ComponentBinding.ComponentChangeTracker");l.prototype.Init=function(b,a){l.N.Init.call(this);this.O_a=b;this.vL=a;this.z1={};this.xF={}};l.prototype.p9=function(b,a){this.PTa(b)||this.kka||(this.z1[b]=a,this.vL.X5a(this))};l.prototype.bv=function(){this.kka=!0};l.prototype.x6a=function(b){var c=this.xF[b]||0;c--;0>c?a.D.error("ComponentChangeTracker suspendCount underflow"):
0==c?delete this.xF[b]:this.xF[b]=c};l.prototype.k7a=function(b){this.xF[b]=(this.xF[b]||0)+1};l.prototype.w0a=function(b){this.kka||this.O_a(b)};l.prototype.n2a=function(){var b=this.z1;this.z1={};return b};l.prototype.PTa=function(b){return 1<=(this.xF[b]||0)};c.bindingHandlers.ojContextMenu={update:function(b,d){function e(b,a,c){r=c;var d=h();if(r)m.one("touchend.ojContextMenu",function(){d.F0(!0);setTimeout(function(){d.F0(!1)},50)});"touchstart"===p&&"contextmenu"===b.type||"contextmenu"===
p&&"touchstart"===b.type?(p=null,clearTimeout(n)):!b.isDefaultPrevented()&&(a={launcher:m,initialFocus:"menu",position:{mouse:{my:"start top",at:"start bottom",of:b},touch:{my:"start\x3e40 center",at:"start bottom",of:b,collision:"flipfit"},keyboard:{my:"start top",at:"start bottom",of:"launcher"}}[a]},d.EQ=!0,d.open(b,a),d.EQ=!1,d.widget().is(":visible")&&(b.preventDefault(),document.addEventListener("keyup",k),"touchstart"===b.type||"contextmenu"===b.type))&&(p=b.type,n=setTimeout(function(){p=
null},300))}function f(b,a){return a?g(document.getElementById(a)):g(b).first()}function h(){var b=a.Components.qd(f(w,v)[0],"ojMenu"),b=b&&b("instance");if(!b)throw Error('ojContextMenu binding bound to "'+(v?v:w)+'", which does not reference a valid JET Menu.');u||(b.widget().on("ojclose.ojContextMenu",function(){document.removeEventListener("keyup",k)}),u=!0);return b}function k(b){121==b.which&&b.shiftKey&&f(w,v).is(":visible")&&b.preventDefault()}function l(b){if(r)return b.preventDefault(),
b.stopPropagation(),r=!1}var m=g(b),t,r=!1,s=!1,n,p=null;m.off(".ojContextMenu").removeClass("oj-menu-context-menu-launcher")[0].removeEventListener("click",l,!0);clearTimeout(t);var q=m.data("_ojLastContextMenu");q&&f(q.F6a,q.id).off(".ojContextMenu");var u=!1,w=c.utils.unwrapObservable(d()),v=g.isPlainObject(w)?b.getAttribute("contextmenu"):null;m.data("_ojLastContextMenu",{F6a:w,id:v});b.addEventListener("click",l,!0);m.on("touchstart.ojContextMenu mousedown.ojContextMenu keydown.ojContextMenu ",
function(b){if("mousedown"!==b.type||!h().F0())return r=!1,"touchstart"===b.type&&(s=!0,t=setTimeout(e.bind(void 0,b,"touch",!0),750)),!0}).on("touchend.ojContextMenu touchcancel.ojContextMenu",function(){s=!1;clearTimeout(t);return!0}).on("keydown.ojContextMenu contextmenu.ojContextMenu",function(b){("contextmenu"===b.type||121==b.which&&b.shiftKey)&&e(b,s?"touch":"keydown"===b.type?"keyboard":"mouse",!1);return!0}).addClass(a.Q.qe()?"oj-menu-context-menu-launcher":"")}};a.xa.xh().Bh({attributes:["header",
"cell"],init:function(b,a,c,d,e,f,h){if("header"===b)return b=a.row,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),b=a.column,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),b=a.rowEnd,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),b=a.columnEnd,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),{header:a};if("cell"===b)return b=a.template,null!=b&&(a.renderer=n(h,b)),{cell:a}},update:function(b,a,c,d,e,f,h){return"header"===b?(b=a.row,null!=b&&(c=b.template,null!=c&&(b.renderer=
m(h,c))),b=a.column,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),b=a.rowEnd,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),b=a.columnEnd,null!=b&&(c=b.template,null!=c&&(b.renderer=m(h,c))),{header:a}):"cell"===b?(b=a.template,null!=b&&(a.renderer=n(h,b)),{cell:a}):null},"for":"ojDataGrid"});a.xa.xh().Bh({attributes:["template"],init:function(b,a,c,d,e,f,h){return"template"===b?{_templateFunction:u(h,a)}:null},update:function(b,a,c,d,e,f,h){return"template"===b?{_templateFunction:u(h,
a)}:null},"for":"ojDiagram"});(function(){a.C0={};a.C0.txa=function(a){var c=["true","false","null","undefined"];if(null==a||0<=c.indexOf(a))return null;a=a.trim();c=a.match(b);return null===c?null:"function(v){"+(c[1]?"Object("+c[1]+")"+c[2]:a)+"\x3dv;}"};var b=/^(?:[$_a-z][$\w]*|(.+)(\.\s*[$_a-z][$\w]*|\[.+\]))$/i})();(function(){function b(a){var d=document.createElement("div"),e;a._templateNode&&a._templateNode.content?e=a._templateNode.content:a._templateNode&&(e=a._templateNode);c.utils.arrayForEach(c.virtualElements.childNodes(e),
function(b){b&&d.insertBefore(b.cloneNode(!0),null)});return d}function a(b,c){return{status:"added",value:b,index:c}}function d(b,a){var c;if(b){c=[];for(var e=0;e<b.length;e++)c.push(a(b[e],e,b))}return c}function e(k){var g=this.element=k.element;this.Ma=8===g.nodeType&&h.test(f?g.text:g.nodeValue)?this.element.parentNode:this.element;this.$context=k.$context;this.data=k.data;this.as=k.as;this.templateNode=b(k.element);this.Px=[];this.Sx=[];this.WW=[];this.sba=!1;this.WG=[];c.virtualElements.emptyNode(this.element);
k=c.unwrap(this.data);this.Xza(d(k,a));c.isObservable(this.data)&&(this.data.indexOf||(this.data=this.data.extend({trackArrayChanges:!0})),this.Ava=this.data.subscribe(this.Xza,this,"arrayChange"))}var f=document&&"\x3c!--test--\x3e"===document.createComment("test").text,h=f?/^\x3c!--\s*ko(?:\s+([\s\S]+))?\s*--\x3e$/:/^\s*ko(?:\s+([\s\S]+))?\s*$/,k=document&&"function"===typeof document.createDocumentFragment;e.S7a="_ko_ffe_pending_delete_index";e.prototype.bv=function(){this.Ava&&this.Ava.dispose();
this.vwa()};e.prototype.Xza=function(b){for(var a={added:[],deleted:[]},c=0,d=b.length;c<d;c++){if(a.added.length&&"added"==b[c].status){var e=a.added[a.added.length-1];if((e.haa?e.index+e.values.length-1:e.index)+1==b[c].index){e.haa||(e={haa:!0,status:"added",index:e.index,values:[e.value]},a.added.splice(a.added.length-1,1,e));e.values.push(b[c].value);continue}}a[b[c].status].push(b[c])}0<a.deleted.length&&(this.Px.push.apply(this.Px,a.deleted),this.Px.push({status:"clearDeletedIndexes"}));this.Px.push.apply(this.Px,
a.added);0<this.Px.length&&!this.sba&&(this.sba=!0,this.L5a())};e.prototype.L5a=function(){var b=this,a=9007199254740991;c.utils.arrayForEach(this.Px,function(c){"number"===typeof c.index&&(a=Math.min(a,c.index));b[c.status](c)});this.vwa();this.sba=!1;this.C7a(a);this.Px=[]};e.prototype.added=function(b){var a=b.index;b=b.haa?b.values:[b.value];for(var d=this.N2a(a),e=[],f=0,h=b.length;f<h;++f){var k;if((k=this.sxa(b[f]))&&k.YN.length)k=k.YN.pop();else{k=this.templateNode.cloneNode(!0);var g={data:b[f],
index:a+f,observableIndex:c.observable()},l=this.$context.extend({$root:void 0,$parent:void 0,$parents:void 0,$current:g});this.as&&(l[this.as]=g);c.applyBindingsToDescendants(l,k);k=c.virtualElements.childNodes(k)}e.push.apply(e,Array.prototype.slice.call(k));this.Sx.splice(a+f,0,{first:k[0],last:k[k.length-1]})}this.x4a(e,d)};e.prototype.oxa=function(b){var a=[],c=this.Sx[b].first;b=this.Sx[b].last;for(a.push(c);c&&c!==b;)c=c.nextSibling,a.push(c);return a};e.prototype.N2a=function(b){return 1>
b||b-1>=this.Sx.length?null:this.Sx[b-1].last};e.prototype.x4a=function(b,a){var d,e,f,h=this.element;if(void 0===b.nodeType&&void 0===b.length)throw Error("Expected a single node or a node array");if(void 0!==b.nodeType)c.virtualElements.insertAfter(h,b,a);else if(1===b.length)c.virtualElements.insertAfter(h,b[0],a);else if(k){d=document.createDocumentFragment();f=0;for(e=b.length;f!==e;++f)d.appendChild(b[f]);c.virtualElements.insertAfter(h,d,a)}else for(f=b.length-1;0<=f;--f){d=b[f];if(!d)break;
c.virtualElements.insertAfter(h,d,a)}};e.prototype.Y6a=function(b){return b&&("object"===typeof b||"function"===typeof b)};e.prototype.sxa=function(b){b=b&&b._ko_ffe_pending_delete_index;return void 0===b?null:this.WG[b]};e.prototype.W2a=function(b){var a=this.sxa(b);if(a)return a;a={data:b,YN:[]};b._ko_ffe_pending_delete_index=this.WG.length;this.WG.push(a);return a};e.prototype.deleted=function(b){this.Y6a(b.value)?this.W2a(b.value).YN.push(this.oxa(b.index)):this.xAa(this.oxa(b.index));this.WW.push(b.index)};
e.prototype.xAa=function(b){if(b.length)for(var a=b[0].parentNode,d=b.length-1;0<=d;--d)c.cleanNode(b[d]),a.removeChild(b[d])};e.prototype.vwa=function(){for(var b=0,a=this.WG.length;b!=a;++b){for(var c=this.WG[b];c.YN.length;)this.xAa(c.YN.pop());c.data&&void 0!==c.data._ko_ffe_pending_delete_index&&delete c.data._ko_ffe_pending_delete_index}this.WG=[]};e.prototype.clearDeletedIndexes=function(){for(var b=this.WW.length-1;0<=b;--b)this.Sx.splice(this.WW[b],1);this.WW=[]};e.prototype.B2a=function(b){for(var a;b;){if(a=
c.contextFor(b))return a;b=b.nextSibling}};e.prototype.C7a=function(b){for(var a=b,c=this.Sx.length;a<c;++a)(b=this.B2a(this.Sx[a].first))&&b.$current&&b.$current.observableIndex(a)};c.bindingHandlers._ojBindForEach_={init:function(b,a,d,f,h){var k;(a=a())&&"object"===typeof a&&a.constructor===Object?(a.element=a.element||b,a.$context=h,k=new e(a)):k=new e({element:b,data:c.unwrap(h.$rawData)===a?h.$rawData:a,$context:h});c.utils.domNodeDisposal.addDisposeCallback(b,function(){k.bv()});return{controlsDescendantBindings:!0}}};
c.virtualElements.allowedBindings._ojBindForEach_=!0})();a.Rga=function(b,d,e){function f(b,a){var c=b.$current||b.$data;return function(d){a(d,c,b)}}function h(b){function a(e){d&&d(e,c,b)}var c=b.$current||b.$data,d;a.Dba=function(b){d=b};return a}function k(a,c,d){var e=n[c];e||(e=h(a),n[c]=e,b.addEventListener(c,e));(null==d||d instanceof Function)&&e.Dba(d)}function g(e,f,h){function k(b){if(!u[e]){var g=!1,l;c.ignoreDependencies(function(){var e=b.detail.value,k=h(d);c.isObservable(k)?c.isWriteableObservable(k)?
(k(a.xa.qw(e)),g=!0):l="the observable is not writeable":(k=a.C0.txa(f),null!=k?(a.xa.GI(k)(d)(a.xa.qw(e)),g=!0):l="the expression is not a valid update target")});g||l&&a.D.info("The expression '%s' for property '%s' was not updated because %s.",f,e,l)}}b.addEventListener(e+w,k);return k}function m(b){var a=u[b]||0;a++;u[b]=a}function t(b){var c=u[b];c?(c--,u[b]=0===c?null:c):a.D.error("Property count undefrlow")}function r(b,a){var c=b.split("."),d=a;c.shift();for(var e=0;e<c.length;e++){d=d.properties;
if(!d)break;d=d[c[e]]}return d}this.Lba=function(e,h,l){if(r(h,l)){e=a.fc.KB(e);var n=p[h];n&&(n.dispose(),p[h]=null);if(n=q[h])b.removeEventListener(h+w,n),q[h]=null;l.B2&&k(d,a.fc.mq(h),null);var n=l.readOnly,u=e.expr;if(u){var v=a.xa.GI(u);if(!n){var G=!0;c.ignoreDependencies(function(){p[h]=c.computed(function(){var e=v(d),e=c.utils.unwrapObservable(e);if(l.B2)k(d,a.fc.mq(h),e);else if(Array.isArray(e)&&(e=e.slice()),l.cE&&e&&e instanceof Function&&(e=f(d,e)),!G&&s)s.p9(h,e);else{m(h);try{b.setProperty(h,
e)}finally{t(h)}}})});G=!1}l.writeback&&!e.Z1a&&(q[h]=g(h,u,v))}}};this.rBa=function(){for(var a=Object.keys(p),c=0;c<a.length;c++){var d=p[a[c]];d&&d.dispose()}p={};a=Object.keys(q);for(c=0;c<a.length;c++)d=a[c],b.removeEventListener(d+w,q[d]);q={};a=Object.keys(n);for(c=0;c<a.length;c++)d=a[c],b.removeEventListener(d,n[d]);n={};s&&s.bv()};var s=function(){return e?null:new l(function(a){for(var c=Object.keys(a),d=0;d<c.length;d++)m(c[d]);try{b.setProperties(a)}finally{for(a=0;a<c.length;a++)t(c[a])}},
a.xa.y1)}(),n={},p={},q={},u={},w="Changed"};a.Uq={};o_("ResponsiveKnockoutUtils",a.Uq,a);a.Uq.VF=function(b){if(null==b)throw Error("oj.ResponsiveKnockoutUtils.createMediaQueryObservable: aborting, queryString is null");b=window.matchMedia(b);var a=c.observable(b.matches);b.addListener(function(b){a(b.matches)});-1!=navigator.userAgent.indexOf("WebKit")&&-1==navigator.userAgent.indexOf("Chrome")&&g(window).resize(function(){0===g("body").has(".oj-webkit-bug-123293").length&&g("body").append('\x3cdiv aria-hidden\x3d"true" class\x3d"oj-helper-hidden-accessible oj-webkit-bug-123293"\x3e');
g(".oj-webkit-bug-123293").text((new Date).getMilliseconds().toString())});return a};o_("ResponsiveKnockoutUtils.createMediaQueryObservable",a.Uq.VF,a);a.Uq.w1a=function(){var b=a.Ic.LB(a.Ic.bz.XXL_UP),d=a.Ic.LB(a.Ic.bz.XL_UP),e=a.Ic.LB(a.Ic.bz.LG_UP),f=a.Ic.LB(a.Ic.bz.MD_UP),h=a.Ic.LB(a.Ic.bz.SM_UP),k=null==b?null:a.Uq.VF(b),g=null==d?null:a.Uq.VF(d),l=null==e?null:a.Uq.VF(e),m=null==f?null:a.Uq.VF(f),t=null==h?null:a.Uq.VF(h);return c.computed(function(){if(k&&k())return a.Ic.mp.XXL;if(g&&g())return a.Ic.mp.XL;
if(l&&l())return a.Ic.mp.LG;if(m&&m())return a.Ic.mp.MD;if(t&&t())return a.Ic.mp.SM;throw Error(" NO MATCH in oj.ResponsiveKnockoutUtils.createScreenRangeObservable");})};o_("ResponsiveKnockoutUtils.createScreenRangeObservable",a.Uq.w1a,a);a.xa.xh().Bh({attributes:["areaLayers","pointDataLayers"],init:function(b,a,c,d,e,f,h){return p(b,a,h)},update:function(b,a,c,d,e,f,h){return p(b,a,h)},"for":"ojThematicMap"});a.WO={};o_("KnockoutTemplateUtils",a.WO,a);a.WO.sq=function(b,a){function d(e){var f=
e._parentElement||e.parentElement,h=c.contextFor(e.componentElement).createChildContext(e.data,null,function(b){b.$context=e});c.renderTemplate(b,h,{afterRender:function(b){g(b)._ojDetectCleanData()}},f,a?"replaceNode":"replaceChildren");return null}return function(a){if(a.componentElement.classList&&a.componentElement.classList.contains("oj-dvtbase")){var c=document.createElement("div");c.style.display="none";c.EJ=a._dvtcontext;a.componentElement.appendChild(c);Object.defineProperty(a,"_parentElement",
{value:c,enumerable:!1});Object.defineProperty(a,"_templateCleanup",{value:function(){g(c).remove()},enumerable:!1});Object.defineProperty(a,"_templateName",{value:b,enumerable:!1});d(a);return(a=c.children[0])?("http://www.w3.org/2000/svg"===a.namespaceURI&&(c.removeChild(a),g(c).remove()),{insert:a}):{preventDefault:!0}}return d(a)}};o_("KnockoutTemplateUtils.getRenderer",a.WO.sq,a);a.xa.xh().Bh({attributes:["nodeContent"],init:function(b,a,c,d,e,f,h){return q(b,a,h)},update:function(b,a,c,d,e,
f,h){return q(b,a,h)},"for":"ojTreemap"});(function(){function b(a,c,f,h){if(f=e(a.getAttribute(f),h))return d(a,c,"ko "+c+":"+f)}function d(b,a,c){c=document.createComment(c);var e=document.createComment("/ko"),f=[c],h=b.parentNode;h.insertBefore(c,b);if("if"===a)for(;0<b.childNodes.length;)a=b.childNodes[0],h.insertBefore(a,b),f.push(a);else if("_ojBindForEach_"===a){for(;0<b.childNodes.length;)if(a=b.childNodes[0],h.insertBefore(a,b),f.push(a),1===a.nodeType&&"template"===a.nodeName.toLowerCase()){if(c._templateNode)throw Error("Multiple templates found: oj-bind-for-each requires a single template element as its direct child");
Object.defineProperty(c,"_templateNode",{value:a,enumerable:!1})}if(!c._templateNode)throw Error("Template not found: oj-bind-for-each requires a single template element as its direct child");}f.push(e);h.replaceChild(e,b);return f}function e(b,c){if(null!=b){var d=a.fc.KB(b).expr;null==d&&(d=c?"'"+b+"'":b);return d}return null}function f(b,c,d,e,h){var k=a.fc.KB(d).expr;return null==k?function(){return"object"===h?a.fc.J9(b,c,d,h):d}:a.xa.GI(k).bind(null,e)}function h(b){return function(){for(var a=
{},c=Object.keys(b),d=0;d<c.length;d++){var e=c[d];a[e]=b[e]()}return a}}function k(b){if(1!==b.nodeType)return{};if(!b[g]){for(var c=a.Y?!!a.Y.QB(b.nodeName):!1,d={},e=[],f=[],h=[],l=b.attributes,m=0;m<l.length;m++){var t=l[m],r;if(r=(r=t.name)&&":"===r.charAt(0)?r.slice(1):null)"style"===r?d.fQ=r:"style."===r.substring(0,6)?f.push(r):e.push(r);c||"on-"!==t.name.substring(0,3)||h.push(t)}if(f.length){if(d.fQ)throw Error("Cannot have both style and style.* data bound attributes on "+b.tagName+" with id "+
b.id);d.fQ=f}e.length&&(d.kea=e);h.length&&(d.Yea=h);Object.defineProperty(b,g,{value:d})}return b[g]}a.HI.DM({preprocessNode:function(c,f){var h;if(1===c.nodeType){var k=c.nodeName.toLowerCase();if("oj-bind-text"===k)h=b(c,"text","value",!0);else if("oj-bind-if"===k)h=b(c,"if","test",!1);else if("oj-bind-for-each"===k){k=c.getAttribute("data");h=a.fc.KB(k).expr;if(!h)try{var g=JSON.parse(k);if(Array.isArray(g))h=k;else throw Error("got value "+k);}catch(l){throw Error("The value on the oj-bind-for-each data attribute should be either a JSON array or an expression : "+
l);}g=e(c.getAttribute("as"),!0);h?(g="ko _ojBindForEach_:{data:"+h+(g?",as:"+g+"}":"}"),h=d(c,"_ojBindForEach_",g)):h=void 0}}return h?h:f},nodeHasBindings:function(b,a){var c=k(b);return a||null!=c.kea||null!=c.fQ||null!=c.Yea},getBindingAccessors:function(b,d,e){if(1===b.nodeType){e=e||{};var g=k(b),l=g.fQ;if(l){if(e.style)throw Error("Cannot have both style data-bind and JET style binding on "+b.tagName+" with id "+b.id);if("style"===l)e[l]=f(b,l,b.getAttribute(":"+l),d,"object");else{for(var m=
{},t=0;t<l.length;t++){var r=l[t],s=a.fc.AB(r.substring(6));m[s]=f(b,r,b.getAttribute(":"+r),d,"string")}e.style=h(m)}}if(l=g.kea){if(e.attr)throw Error("Cannot have both attr data-bind and JET attribute binding on "+b.tagName+" with id "+b.id);m={};for(t=0;t<l.length;t++)r=l[t],m[r]=f(b,r,b.getAttribute(":"+r),d,"string");e.attr=h(m)}if(g=g.Yea){for(var n=new a.Rga(b,d,!0),t=0;t<g.length;t++)d=g[t],r=a.fc.AB(d.nodeName),n.Lba(d.value,r,{B2:!0});c.utils.domNodeDisposal.addDisposeCallback(b,function(){n&&
(n.rBa(),n=null)})}}return e}});var g="_ojbindingsobj"})();a.xa.xh().Bh({attributes:["tooltip"],init:function(b,a,c,d,e,f,h){return w(b,a,h)},update:function(b,a,c,d,e,f,h){return w(b,a,h)},"for":"tooltipOptionRenderer"});(function(){for(var b="ojChart ojDiagram ojNBox ojPictoChart ojSunburst ojTagCloud ojThematicMap ojTreemap ojDialGauge ojLedGauge ojRatingGauge ojSparkChart ojStatusMeterGauge ojGantt".split(" "),c=0;c<b.length;c++)a.xa.xh().Bh({"for":b[c],use:"tooltipOptionRenderer"})})();a.qaa=
{};o_("koStringTemplateEngine",a.qaa,a);a.qaa.eaa=function(){if(!c.templates){var b={},a={},d=new c.nativeTemplateEngine,e=function(c){this.CF=c;this.text=function(a){if(!a)return b[this.CF];b[this.CF]=a};this.data=function(b,c){a[this.CF]||(a[this.CF]={});if(1===arguments.length)return a[this.CF][b];a[this.CF][b]=c}};d.makeTemplateSource=function(b,a){if("string"==typeof b){a=a||document;var d=a.getElementById(b);return d?new c.templateSources.domElement(d):new e(b)}if(b&&1==b.nodeType||8==b.nodeType)return new c.templateSources.anonymousTemplate(b)};
c.templates=b;c.setTemplateEngine(d)}};o_("koStringTemplateEngine.install",a.qaa.eaa,a);(function(){c.bindingHandlers._ojCustomElement={after:["attr"],init:function(b,a,d,e,f){c.applyBindingsToDescendants(f,b);return{controlsDescendantBindings:!0}},update:function(d,e,f,h,k){function g(){t&&(t.rBa(),t=null);r&&(d.removeEventListener(b,r),r=null)}function l(c){var e=a.Y.sj(s);t=new a.Rga(d,k,c);var f={B2:!0};s.CK=!0;c=d.attributes;for(var h=0;h<c.length;h++){var g=c[h],m=a.fc.AB(g.nodeName);t.Lba(g.value,
m,a.fc.mq(m)&&!e[m]?f:e[m.split(".")[0]])}s.CK=!1;r=function(b){b=b.detail;var c=a.fc.AB(b.attribute);t.Lba(b.value,c,a.fc.mq(c)&&!e[c]?f:e[c.split(".")[0]])};d.addEventListener(b,r)}var m=0,t,r,s=a.Y.Xa(d),n=s.Z2a();c.ignoreDependencies(function(){c.computed(function(){function b(a,c){return function(b,a){b===m&&c(a)}.bind(void 0,a)}var f=e().KM;c.computedContext.isInitial()||g();m++;n.then(b(m,function(){l(f);a.Az.Xa().nHa(d)}),b(m,function(b){a.D.error("Custom element binding setup failed. Reason: %o",
b)}))},null,{disposeWhenNodeIsRemoved:d})});c.utils.domNodeDisposal.addDisposeCallback(d,g)}};var b="attribute-changed"})();a.xa.xh().Bh({attributes:["center"],init:function(b,a,c,d,e,f,h){return v(b,a,h)},update:function(b,a,c,d,e,f,h){return v(b,a,h)},"for":"ojStatusMeterGauge"});a.xa.xh().Bh({attributes:["columns","columnsDefault","rowTemplate"],init:function(b,a,c,d,e,f,h){if("columns"==b||"columnsDefault"==b){for(c=0;c<a.length;c++){var k=a[c];d=k.template;e=k.footerTemplate;f=k.headerTemplate;
null!=d&&(k.renderer=x(h,"cell",d));null!=e&&(k.footerRenderer=x(h,"footer",e));null!=f&&(k.headerRenderer=x(h,"header",f))}return"columns"==b?{columns:a}:{columnsDefault:a}}if("rowTemplate"==b)return{rowRenderer:y(h,a)}},update:function(b,a,c,d,e,f,h){if("columns"==b||"columnsDefault"==b){var k;for(c=0;c<a.length;c++){var g=a[c];e=g.template;f=g.footerTemplate;k=g.headerTemplate;null!=e&&(g.renderer=x(h,"cell",e));null!=f&&(g.footerRenderer=x(h,"footer",f));null!=k&&(g.headerRenderer=x(h,"header",
k))}"columns"==b?d({columns:a}):d({columnsDefault:a})}else if("rowTemplate"==b)return{rowRenderer:y(h,a)};return null},"for":"ojTable"});a.HI.DM({getBindingAccessors:function(b,c,d,e){if(null==d)return null;var f;a:{f=Object.keys(d);for(var h=-0;h<f.length;h++){var k=f[h];if(a.xa.FTa(k)){f=k;break a}}f=null}null!=f&&(d=z(b,f,e,c,d));return d}});a.HI.DM({nodeHasBindings:function(b,c){return a.Y?c||1===b.nodeType&&a.Y.QB(b.nodeName):c},getBindingAccessors:function(b,c,d){if(1===b.nodeType&&a.Y){var e=
a.Y.QB(b.nodeName);e&&(d=d||{},d._ojCustomElement=function(){return{KM:e.KM}})}return d}});a.xa.xh().Bh({attributes:["rootNodeContent"],init:function(b,a,c,d,e,f,h){return H(b,a,h)},update:function(b,a,c,d,e,f,h){return H(b,a,h)},"for":"ojSunburst"});a.Az=function(){function b(c){var d=c._ojBndMdtr;d||(d=new a,Object.defineProperty(c,"_ojBndMdtr",{value:d}));return d}function a(){this.rq=function(){b||(b=new Promise(function(b){c=b}));return b};this.resolve=function(a){c?(c(a),c=null):b||(b=Promise.resolve(a))};
var b,c}this.whenReady=function(a){return b(a).rq()};this.addDisposeCallback=function(b,a){c.utils.domNodeDisposal.addDisposeCallback(b,a)};this.nHa=function(a){b(a).resolve(!0)}};a.Az.Xa=function(){return a.Az.jTa};a.Az.jTa=new a.Az;a.xa.xh().Bh({attributes:["item"],init:function(b,a,c,d,e,f,h){b=F(b,a,h);if(null!=b)return b},update:function(b,a,c,d,e,f,h){return F(b,a,h)},"for":"ojListViewRenderer"});a.xa.xh().Bh({"for":"ojListView",use:"ojListViewRenderer"});a.xa.xh().Bh({"for":"ojNavigationList",
use:"ojListViewRenderer"});return a.Az.Xa()});