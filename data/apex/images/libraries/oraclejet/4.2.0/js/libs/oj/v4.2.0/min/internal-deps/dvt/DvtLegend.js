/**
 * Copyright (c) 2014, 2016, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 */
"use strict";
define(['./DvtToolkit'], function(dvt) {
  // Internal use only.  All APIs and functionality are subject to change at any time.

var ga;function ka(a,F){0==a.indexOf("dvt.")&&(a=a.substring(4));var D=a.split("."),E=eval("dvt");D[0]in E||!E.execScript||E.execScript("var "+D[0]);for(var v;D.length&&(v=D.shift());)D.length||void 0===F?E=E[v]?E[v]:E[v]={}:E[v]=F}Math.floor(2147483648*Math.random()).toString(36);
(function(a){function F(a,f,e,g,u,t){this.Init(a,f,e,g,u,t)}function D(a,f){this.Init(a,f)}function E(a){this.Init(a.a,a.Ef,a);this.Ke=a}function v(){this.Init({skyros:v.If,alta:v.Rg,next:v.Rq})}function x(a){this.Ke=a;this.Vf=this.Ke.A()}a.Rf=function(){};a.f.v(a.Rf,a.$b);a.Rf.newInstance=function(c,f,e){var g=new a.Rf;g.Init(c,f,e);return g};a.Rf.Uo=function(a){return(new v).Uo(a)};a.Rf.prototype.Init=function(c,f,e){a.Rf.C.Init.call(this,c,f,e);this.setId("legend1000"+Math.floor(1E9*Math.random()));
this.Ff=new v;this.u=new E(this);this.u.Lf(this);this.Dv=[];this.xx=[];this.Sb=null;this.Xpa=[]};a.Rf.prototype.ne=function(a){this.Bf.XH();a?(this.J=this.Ff.mo(a),this.dGa(this.J.sections)):this.J||(this.J=this.eA())};a.Rf.prototype.jy=function(c,p,e){this.ne(c);this.A().isLayout=!0;c=f.ia(this,new a.U(0,0,p,e));this.A().isLayout=!1;return new a.eg(c.b,c.i)};a.Rf.prototype.ia=function(c,p,e){this.Vb.XH();this.ne(c);isNaN(p)||isNaN(e)||(this.Oa=p,this.cb=e);this.A().isLayout=!1;c=this.Uc();for(p=
0;p<c;p++)this.ec(p).Ec();this.Ih();this.Dv=[];this.xx=[];this.Sb=null;this.Xpa=[];a.m.eb()||this.u.$r(new D(this.u,this));this.ps();this.hka=f.ia(this,new a.U(0,0,this.Oa,this.cb));(c=this.A().highlightedCategories)&&0<c.length&&this.Zd(c);this.ml();return this.hka};a.Rf.prototype.Zd=function(c){this.A().highlightedCategories=c&&0<c.length?c.slice():null;a.sd.Zd(c,this.Dv,!0)};a.Rf.prototype.Ef=function(a,f){var e=a.type;if("categoryHighlight"==e&&"dim"==this.A().hoverBehavior){var g=this.Dv;this!=
f&&this.Zd(a.categories);for(var u=0;u<g.length;u++)if(g[u].getId()==a.categories){this.PGa.scrollIntoView(g[u].Xd()[0]);break}}this!=f&&"adfShowPopup"!=e&&"adfHidePopup"!=e||this.dispatchEvent(a)};a.Rf.prototype.eja=function(c){if(c.Xd()[0]instanceof a.ra)this.xx.push(c);else{var f=this.A().hideAndShowBehavior;(null!=c.bf()||null!=c.ph()||c.bk()||"none"!=f&&"off"!=f)&&this.xx.push(c);this.Dv.push(c)}};a.Rf.prototype.fja=function(a){this.Sb=a.clone()};a.Rf.prototype.xTa=function(a){this.Xpa.push(a)};
a.Rf.prototype.Bi=function(){return new x(this)};a.Rf.prototype.aE=function(){return null!=this.u?this.u.Fe():null};a.Rf.prototype.cda=function(a,f){if(null!=this.u){for(var e=this.xx,g=0;g<e.length;g++)if(e[g].getId()==a.getId()){this.u.Yr(e[g]);f&&e[g].rh();break}if(e=this.aE())g=e.Xd()[0],g.Od("label",e.te()),this.a.bJ(g)}};a.Rf.prototype.V=function(c){var f=new a.U(0,0,this.Oa,this.cb);return c&&c!==this?this.Cg(f,c):f};a.Rf.prototype.Z3=function(a){return a&&a!==this?this.Cg(this.hka,a):this.hka};
a.Rf.prototype.vk=function(){return a.I.Ja(a.I.pa,"LEGEND")};a.Rf.prototype.dGa=function(c){if(c&&!(0>=c.length))for(var p=this.A().hiddenCategories,e=0;e<c.length;e++){var g=c[e];g.sections&&(p=this.dGa(g.sections));if((g=g.items)&&!(0>=g.length))for(var u=0;u<g.length;u++){var t=g[u],v=f.Bba(t);"hidden"==t.categoryVisibility&&0>a.Y.ac(p,v)&&p.push(v);t.categoryVisibility=null}}};a.Rf.prototype.ps=function(){if(this.ZS()){var c=this.A(),f=c.hideAndShowBehavior;if("off"!=f&&"none"!=f||"dim"==c.hoverBehavior)this.a.zg("application"),
this.a.bS(a.I.Ja(a.I.pa,"COLON_SEP_LIST",[a.I.Ja(a.I.pa,"DATA_VISUALIZATION"),a.cc.Vv(this.vk())]))}};a.Rf.prototype.KI=function(){return 0<this.xx.length};a.Rf.q4=function(c){var f=c.Bf.Te("itemsCount");if(null!=f)return f;for(var f=0,e=c.A().sections,g=0;g<e.length;g++)f+=a.Rf.cJa(e[g]);c.Bf.Pf("itemsCount",f);return f};a.Rf.cJa=function(c){var f=0;c.items&&(f+=c.items.length);if(c.u7a){c=c.u7a;for(var e=0;e<c.length;e++)f+=a.Rf.cJa(c[e])}return f};a.f.v(x,a.Lc);x.prototype.Ql=function(a){return(a=
this.Ke.Ob().Ya(a))&&a instanceof F&&(a=a.getData(),a=this.kDa(a,this.Vf))?"section"+a:null};x.prototype.kDa=function(a,f){if(f.sections&&0<f.sections.length){for(var e=0;e<f.sections.length;e++){if(f.sections[e]==a)return"["+e+"]";var g=this.kDa(a,f.sections[e]);if(g)return"["+e+"]"+g}return null}if(f.items&&0<f.items.length){for(e=0;e<f.items.length;e++)if(f.items[e]==a)return":item["+e+"]";return null}};x.prototype.cIa=function(a,f){if(f.sections&&0<f.sections.length){for(var e=0;e<f.sections.length;e++){var g=
this.cIa(a,f.sections[e]);if(g)return"["+e+"]"+g}return null}if(f.items&&0<f.items.length){for(e=0;e<f.items.length;e++)if(f.items[e].text==a.name)return":item["+e+"]";return null}};x.prototype.Asa=function(a,f){var e=f.indexOf("["),g=f.indexOf("]");if(0<=e&&0<=g){var e=f.substring(e+1,g),u=f.indexOf(":");f=f.substring(g+1);g=f.indexOf("]");return 0<=f.indexOf("[")&&0<=g?this.Asa(a.sections[e],f):0==u?a.items[e]:a.sections[e]}};x.prototype.Sh=function(c){if(c==a.Lc.Bw)return this.fA(this.Ke);c=this.Asa(this.Vf,
c);for(var f=this.Ke.Dv,e=0;e<f.length;e++){var g=f[e].getData();if(c==g)return f[e].Xd()[0].ja()}return null};x.prototype.ny=function(){return this.Vf.title};x.prototype.getItem=function(a){for(var f,e=a.shift(),g=this.Vf;void 0!=e;)0<a.length?g=g.sections[e]:f=g.items[e],e=a.shift();return f?{text:f.text?f.text:null}:null};x.prototype.Z3a=function(a){for(var f,e=a.shift(),g=this.Vf;void 0!=e;)0<a.length?g=g.sections[e]:f=g.sections[e],e=a.shift();return{title:f.title?f.title:null,items:f.items?
this.NCa(f.items):null,sections:f.sections?this.RCa(f.sections):null}};x.prototype.NCa=function(a){for(var f=[],e=0;e<a.length;e++)f.push({text:a[e].text});return f};x.prototype.RCa=function(a){for(var f=[],e=0;e<a.length;e++)f.push({title:a[e].title?a[e].title:null,items:a[e].items?this.NCa(a[e].items):null,sections:a[e].sections?this.RCa(a[e].sections):null});return f};a.f.v(v,a.ka);v.Rq={skin:a.j.Rq,titleStyle:new a.j("color: #737373;"),_sectionTitleStyle:new a.j("color: #737373;"),layout:{titleGapWidth:17,
titleGapHeight:9,symbolGapWidth:7,symbolGapHeight:4,rowGap:4,columnGap:10,sectionGapHeight:16,sectionGapWidth:24}};v.Rg={skin:a.j.Rg,textStyle:new a.j(a.ka.pj),titleStyle:new a.j(a.ka.zJ+"color: #333333;"),_sectionTitleStyle:new a.j(a.ka.zJ+"color: #333333;")};v.If={skin:a.j.Gm,orientation:"vertical",position:null,backgroundColor:null,borderColor:null,textStyle:new a.j(a.ka.hs+"font-size: 11px; color: #333333;"),titleStyle:new a.j(a.ka.hs+"font-size: 12px; color: #003d5b;"),titleHalign:"start",hiddenCategories:[],
hideAndShowBehavior:"off",hoverBehavior:"none",hoverBehaviorDelay:200,scrolling:"asNeeded",halign:"start",valign:"top",drilling:"off",_color:"#a6acb1",_markerShape:"square",_lineWidth:3,layout:{outerGapWidth:3,outerGapHeight:3,titleGapWidth:8,titleGapHeight:3,symbolGapWidth:5,symbolGapHeight:4,rowGap:0,columnGap:8,sectionGapHeight:6,sectionGapWidth:15},isLayout:!1};v.Bh=function(c,f){var e=Math.min(a.ga.xq(c.a,c.A().textStyle)/14,1);return Math.ceil(f*e)};v.prototype.cL=function(){return{sections:{items:{_dataContext:!0}}}};
a.f.v(E,a.u);E.prototype.rj=function(a){E.C.rj.call(this,a);var f=this.Ya(a.target);if(f){var e=this.wva(f),f=this.Lta(f,a);(e||f)&&a.stopPropagation()}};E.prototype.rt=function(c){E.C.rt.call(this,c);if(c=this.Ya(c.target)){var f=c instanceof a.qg?c.vK:null;f&&f.isCollapsible&&f.button&&f.button.fI();this.KJ(c)}};E.prototype.Tn=function(c){E.C.Tn.call(this,c);(c=this.Ya(c.target))&&(c=c instanceof a.qg?c.vK:null)&&c.isCollapsible&&c.button&&c.button.Ir()};E.prototype.dv=function(a){var f=this.Ya(a.target);
if(f){var e=a.X6,g=this.wva(f);a=this.Lta(f,a);(g||a)&&e&&e.preventDefault()}};E.prototype.wva=function(c){var p=this.Ke.A().hideAndShowBehavior;if("none"==p||"off"==p)return!1;var e=c.rd?c.rd():null;if(!e||0>=e.length)return!1;for(var g=c.rd()[0],p=this.Ke.A().hiddenCategories||[],p=p.slice(),u=c.Xd(),t=0;t<u.length;t++){var v=u[t];v instanceof a.W?v.Zr(c.Zb()):v instanceof a.Rect&&c.txa()}c=e[0];f.pca(g,this.Ke)?(p.splice(a.Y.ac(p,g),1),c=a.la.mKa(c,p)):(p.push(g),c=a.la.lKa(c,p));this.Ke.A().hiddenCategories=
p;this.kt(c,this.Ke);return!0};E.prototype.Lta=function(c,f){if(c&&c.ph&&c.ph())return this.kt(a.la.xy("action",c.ph(),c.getId()),this.Ke),!0;if(c instanceof F&&c.bk()){var e=c.getId();this.kt(a.la.X5(e,e,null),this.Ke);return!0}return(e=c instanceof a.qg?c.vK:null)&&e.isCollapsible?(this.JLa(f,e.id),!0):!1};E.prototype.Ij=function(c,f,e){c=this.Ke.A();"none"==c.hoverBehavior||f.Xd&&f.Xd()[0]instanceof a.ra||(f=f.rd?f.rd():[],c.highlightedCategories=e?f.slice():null,e=a.la.OI(c.highlightedCategories,
e),c=a.$a.zq(c.hoverBehaviorDelay),this.pF.Ef(e,this.Ke.Dv,c,!0))};E.prototype.hva=function(a,f){var e=f.getId();this.JLa(a,e)};E.prototype.JLa=function(c,f){for(var e=this.Ke.A(),g=0;g<f.length;g++)e=e.sections[f[g]];e.expanded="off"==e.expanded?"on":"off";c.type==a.MouseEvent.He&&(e=this.Ya(this.Vd(c)),e.Kd&&this.Yr(e.Kd(c)));g=(e=this.Ke.aE())?e.Ae():!1;this.Ke.ia();e&&this.Ke.cda(e,g);this.ed();e=this.Ke.Z3();this.kt(new a.tn(e.b,e.i,e.x,e.y),this.Ke)};E.prototype.Oy=function(){return this.Ke.A()._isScrollingLegend?
a.u.UC:a.u.ns};E.prototype.$x=function(){return this.Ke};E.prototype.mE=function(){return!0};E.prototype.pw=function(){var a=this.vc.eo;return a instanceof F&&null!=a.getData()._dataContext?"series":null};E.prototype.VE=function(){var a=this.vc.eo;return a instanceof F?[a.getData()._dataContext]:[]};E.prototype.qw=function(a){a=this.Ke.pf(this.a.nf(a.pageX,a.pageY));var f=this.Ke.A().dnd.drop,e=this.Ke.Sb;return 0<Object.keys(f.legend).length&&e.hf(a.x,a.y)?"legend":null};E.prototype.LS=function(){return{}};
E.prototype.PC=function(a){if("legend"==this.qw(a)){a=this.Ke.A()._dropColor;var f=this.Ke.Vb.Te("background");f&&(f.bb(a),f.sc("oj-active-drop"))}};E.prototype.Ly=function(){var c=this.Ke.Vb.Te("background");if(c){var f=this.Ke.A().backgroundColor;f?c.bb(f):c.Yb();a.l.WI(c.ja(),"oj-invalid-drop");a.l.WI(c.ja(),"oj-active-drop")}};E.prototype.QC=function(a){"legend"==this.qw(a)&&(a=this.Ke.Vb.Te("background"))&&a.sc("oj-invalid-drop")};a.f.v(D,a.ya);D.prototype.Init=function(a,f){D.C.Init.call(this,
a);this.Ke=f};D.prototype.Qk=function(c){var f=c.keyCode,e=this.Fc.Fe(),g=e&&e.Xd()[0]instanceof a.ra,u=null;null==e&&f==a.KeyboardEvent.rg?(f=this.Ke.xx,0<f.length&&(a.u.Ud(c),u=this.lI(f))):e&&(f==a.KeyboardEvent.rg?(a.u.Ud(c),u=e):f==a.KeyboardEvent.Mn||f==a.KeyboardEvent.Kj?(f==a.KeyboardEvent.Mn&&this.Fc.Lta(e,c),g?this.Fc.hva(c,e.Xd()[0]):this.Fc.wva(e),a.u.Ud(c)):!g||f!=a.KeyboardEvent.Ne&&f!=a.KeyboardEvent.Be?u=D.C.Qk.call(this,c):(this.Fc.hva(c,e.Xd()[0]),a.u.Ud(c)));u&&this.Ke.PGa.scrollIntoView(u.Xd()[0]);
return u};a.f.v(F,a.f);F.prototype.Init=function(a,p,e,g,u,t){this.Ke=a;this.tg=p;this.xl=e;this.lc=(this.fO=f.Bba(this.xl))?this.fO:e.title;this.$q=e.action;this.sv=t;this.t_a=e._spb;this.Js=g;this.qO=u;this.Sc=!1;if(this.$q||this.sv)for(a=0;a<this.tg.length;a++)this.tg[a].setCursor("pointer")};F.Xb=function(a,f,e,g,u,t){if(!a||!e)return null;e=new F(f,a,e,g,u,t);f.eja(e);for(g=0;g<a.length;g++)f.Ob().Xb(a[g],e);return e};F.prototype.getData=function(){return this.xl};F.prototype.Zb=function(){return this.xl.color};
F.prototype.getId=function(){return this.lc};F.prototype.Xd=function(){return this.tg};F.prototype.rd=function(){return null!=this.fO?[this.fO]:null};F.prototype.ph=function(){return this.$q};F.prototype.bk=function(){return this.sv};F.prototype.pk=function(){return this.t_a};F.prototype.te=function(){var c=[],p=this.Ke.A(),e=this.Ke.A().hideAndShowBehavior,g=f.pca(this.fO,this.Ke),u=this.getData();if(this.tg[0]instanceof a.ra)return c.push(a.I.Ja(a.I.pa,"off"==u.expanded?"STATE_COLLAPSED":"STATE_EXPANDED")),
a.R.lm(u.title,c);"off"!=e&&"none"!=e&&c.push(a.I.Ja(a.I.pa,g?"STATE_HIDDEN":"STATE_VISIBLE"));this.bk()&&c.push(a.I.Yc(p,"stateDrillable",a.I.pa,"STATE_DRILLABLE"));return null!=u.shortDesc?a.R.lm(u.shortDesc,c):0<c.length?a.R.lm(u.text,c):null};F.prototype.txa=function(){!a.m.Vj()&&this.tg[0]&&this.tg[0].Od("label",this.te())};F.prototype.Kd=function(c){return c.type==a.MouseEvent.He?this:a.ya.Kd(this,c,this.Ke.xx,!0)};F.prototype.md=function(c){return this.tg[0]?this.tg[0].V(c):new a.U(0,0,0,0)};
F.prototype.$j=function(){return this.tg[0]?this.tg[0].ja():null};F.prototype.rh=function(){this.Sc=!0;this.tg[0]&&(this.tg[0]instanceof a.ra?this.tg[0].fI():this.tg[0].uc(a.m.l4()))};F.prototype.mf=function(){this.Sc=!1;this.tg[0]&&(this.tg[0]instanceof a.ra?this.tg[0].Ir():this.tg[0].Ha(null))};F.prototype.Ae=function(){return this.Sc};F.prototype.Ku=function(){return this.Js};F.prototype.bf=function(){return this.qO};F.prototype.pi=function(){return this.xl.color};F.prototype.hn=function(){return!0};
F.prototype.Dl=function(){return[this.getId()]};F.prototype.Rp=function(){return this.Xd()};var f={};a.f.v(f,a.f);f.bia=2;f.xAa=.6;f.eAa=10;f.zk=12;f.qZ=2;f.ia=function(c,p){var e=c.A(),g=c.a,u=a.m.ea(g);c.fja(p);e.isLayout||f.Cn(c,p);var t=new a.Id(g,p.b,p.i),x=new a.ca(g);t.ha.B(x);c.B(t);c.PGa=t;var y=v.Bh(c,e.layout.outerGapWidth),n=v.Bh(c,e.layout.outerGapHeight);p.x+=y;p.y+=n;p.b-=2*y;p.i-=2*n;if(0>=p.b||0>=p.i)return new a.eg(0,0);g=f.jZa(c,x,new a.U(p.x,p.y,p.b,p.i));if(0==g.b||0==g.i)return new a.eg(0,
0);t.Lca();g.i>p.i?(g.i=p.i,e._isScrollingLegend=!0):e._isScrollingLegend=!1;var z=t=0,w=null!=e.hAlign?e.hAlign:e.halign;"center"==w?t=p.x-g.x+(p.b-g.b)/2:"end"==w&&(t=u?p.x-g.x:p.x-g.x+p.b-g.b);u=null!=e.vAlign?e.vAlign:e.valign;"middle"==u?z=p.y-g.y+(p.i-g.i)/2:"bottom"==u&&(z=p.y-g.y+p.i-g.i);u=new a.U(g.x+t-y,g.y+z-n,g.b+2*y,g.i+2*n);if(e.isLayout)return u;(t||z)&&x.ib(t,z);e=c.Xpa;for(x=0;x<e.length;x++)a.qj.align(g,e[x].S4a,e[x].text,e[x].text.V().b);return u};f.jZa=function(a,p,e){var g=a.A();
e=e.clone();var u=f.A2(a,p,g.title,e,null,!0);if(u){var t=u.V(),x=v.Bh(a,g.layout.titleGapHeight);e.y+=t.i+x;e.i-=Math.floor(t.i+x)}a=f.BFa(a,p,g.sections,e,[]);return u?t.Hn(a):a};f.Cn=function(c,f){var e=c.A(),g=e.backgroundColor,u=e.borderColor,t=e.dnd?e.dnd.drop.legend:{},e=e.dnd?e.dnd.drag.series:{};if(g||u||0<Object.keys(t).length||0<Object.keys(e).length)t=new a.Rect(c.a,f.x,f.y,f.b,f.i),g?t.bb(g):t.Yb(),u&&(t.uc(u),t.Wc(!0)),c.B(t),c.Vb.Pf("background",t)};f.A2=function(c,f,e,g,u,t,v,y){var n=
c.A(),z=f.a,w=a.m.ea(z);if(!e)return null;e=new a.M(z,e,g.x,g.y);z=n.titleStyle;u&&u.titleStyle?z=new a.j(u.titleStyle):u&&n._sectionTitleStyle&&(z=n._sectionTitleStyle);e.ub(z);return a.ga.Xc(e,g.b,Infinity,f)?(w&&e.na(g.x+g.b-e.V().b),n.isLayout?f.removeChild(e):(f={id:v,button:y},f.isCollapsible=u&&("on"==u.collapsible||1==u.collapsible),c.Ob().Xb(e,new a.qg(e.fn(),null,null,f)),t&&c.xTa({text:e,S4a:u&&u.titleHalign?u.titleHalign:n.titleHalign})),e):null};f.BFa=function(c,p,e,g,u){if(!e||0==e.length)return new a.U(0,
0,0,0);var t=c.A();null==t.symbolWidth&&null==t.symbolHeight?(t.symbolWidth=f.eAa,t.symbolHeight=f.eAa):(null==t.symbolWidth?t.symbolWidth=t.symbolHeight:null==t.symbolHeight&&(t.symbolHeight=t.symbolWidth),t.symbolWidth=parseInt(t.symbolWidth),t.symbolHeight=parseInt(t.symbolHeight));for(var x=v.Bh(c,t.layout.sectionGapHeight),y=v.Bh(c,t.layout.titleGapHeight),n=v.Bh(c,t.layout.sectionGapWidth),z=f.dXa(c),t="vertical"!=t.orientation,w=null,A=g.clone(),d,h=0;h<e.length;h++){var B=u.concat([h]),r=
"off"==e[h].expanded||0==e[h].expanded?y:x;t?(d=f.uFa(c,p,e[h],A,z),d.b>A.b?(A.b<g.b&&(g.y+=d.i+r,g.i-=d.i+r),d=d.b<=g.b?f.uFa(c,p,e[h],g,z):f.DFa(c,p,e[h],g,z,B,!0),g.y+=d.i+r,g.i-=d.i+r,A=g.clone()):(A.b-=d.b+n,a.m.ea(c.a)||(A.x+=d.b+n))):(d=f.DFa(c,p,e[h],g,z,B,!1),g.y+=d.i+r,g.i-=d.i+r);w=w?w.Hn(d):d}return w};f.XUa=function(c,p,e,g,u,t,v,y,n,z,w){var A=f.qka(c,g,u+"Enabled",t,v),d=f.qka(c,g,u+"Over",t,v);g=f.qka(c,g,u+"Down",t,v);c=new a.ra(c,A,d,g,null,n,z,w);p=F.Xb([c],p,e,y,null,!1);c.zg("button");
p.txa();return c};f.qka=function(c,p,e,g,u){var t=a.m.ea(c)?"RTL":"";c=new a.Image(c,p[e+t]?p[e+t]:p[e],g,u,f.zk,f.zk);c.Yb();return c};f.DFa=function(c,p,e,g,u,t,x){if(e){var y=c.A(),n=v.Bh(c,y.layout.symbolGapWidth),z=v.Bh(c,y.layout.rowGap),w=v.Bh(c,y.layout.columnGap),A=c.a,d=a.m.ea(A),h=null!=e.sections&&0<e.sections.length,B=null!=e.items&&0<e.items.length;g=g.clone();"off"!=y.scrolling&&(g.i=Infinity);var r,l="on"==e.collapsible||1==e.collapsible,C;if(l){r=d?g.x+g.b-f.zk:g.x;if(!y.isLayout){var K=
"off"==e.expanded||0==e.expanded;C=K?"closed":"open";var K=a.I.Ja(a.I.pa,K?"EXPAND":"COLLAPSE",null),R=c.Ob();C=f.XUa(A,c,e,y._resources,C,r,g.y,K,t,R.hva,R);p.B(C)}r=new a.U(r,g.y,f.zk,f.zk);A=v.Bh(c,y.layout.symbolGapWidth);d||(g.x+=f.zk+A);g.b-=f.zk+A}A=(A=f.A2(c,p,e.title,g,e,!l&&1>=t.length,t,C))?A.V():new a.U(d?g.x+g.b:g.x,g.y,0,0);A=r?A.Hn(r):A;if(!B&&!h||"off"==e.expanded||0==e.expanded)return A;0<A.i&&(l=v.Bh(c,y.layout.titleGapHeight),g.y+=A.i+l,g.i-=A.i+l);h&&(t=f.BFa(c,p,e.sections,g,
t),A=A.Hn(t));if(!B)return A;t=f.wUa(c,g,u,e.items,x);x=t.numCols;B=t.numRows;t=t.width;h=g.y;if(0==B||0==x)return A;l=Math.min(x*(t+w)-w,g.b);A=A.Hn(new a.U(d?g.x+g.b-l:g.x,g.y,l,B*(u+z)-z));if(y.isLayout)return A;y=t-y.symbolWidth-n;n=0;l=1;r=e.items.length;for(C=0;C<r&&(f.w_(c,p,e.items[C],g,y,u,C),g.y+=u+z,n++,n===B&&l!==x&&(g.y=h,g.b-=t+w,d||(g.x+=t+w),n=0,l++),n!==B);C++);return A}};f.uFa=function(c,p,e,g,u){if(e){var t=c.A(),x=t.symbolWidth,y=v.Bh(c,t.layout.symbolGapWidth),n=v.Bh(c,t.layout.columnGap),
z=v.Bh(c,t.layout.titleGapWidth),w=null!=e.items&&0<e.items.length,A=a.m.ea(c.a),d=g.clone(),h=f.A2(c,p,e.title,g,e,!1),B=h?h.V():new a.U(A?g.x+g.b:g.x,g.y,0,0);if(!w)return B;0<B.b&&(d.b-=B.b+z,A||(d.x+=B.b+z));for(var z=[],r=g.b-d.b,l,C=e.items.length,w=0;w<C;w++)l=e.items[w],l=Math.ceil(a.ga.yq(c.a,l.text,t.textStyle)),r+=l+x+y+n,z.push(l);0<C&&(r-=n);B=new a.U(A?g.x+g.b-r:g.x,g.y,r,Math.max(u,B.i));if(t.isLayout||r>g.b)return p.removeChild(h),B;for(w=0;w<C;w++)l=e.items[w],f.w_(c,p,l,d,z[w],u,
w),g=z[w]+x+y,d.b-=g+n,A||(d.x+=g+n);return B}};f.wUa=function(c,f,e,g,u){for(var t=c.A(),x=[],y=0;y<g.length;y++)x.push(g[y].text);var n=a.ga.Kba(c.a,x,t.textStyle),x=t.symbolWidth,z=v.Bh(c,t.layout.symbolGapWidth),y=v.Bh(c,t.layout.rowGap);c=v.Bh(c,t.layout.columnGap);t=Math.ceil(x+z+n);u?(u=Math.min(Math.max(Math.floor((f.b+c)/(t+c)),1),g.length),e=Math.min(Math.floor((f.i+y)/(e+y)),Math.ceil(g.length/u)),u=Math.ceil(g.length/e),e=Math.ceil(g.length/u)):Infinity==f.i?(u=1,e=g.length):(e=Math.min(Math.floor((f.i+
y)/(e+y)),g.length),u=Math.ceil(g.length/e),e=Math.ceil(g.length/u));f=Math.min(t,(f.b-c*(u-1))/u);return f<x?{width:0,numCols:0,numRows:0}:{width:f,numCols:u,numRows:e}};f.dXa=function(c){var f=c.A(),e=a.ga.xq(c.a,f.textStyle);c=f.symbolHeight+v.Bh(c,f.layout.symbolGapHeight);return Math.ceil(Math.max(e,c))};f.w_=function(c,p,e,g,u,t){var x=c.A(),y=c.a,n=a.m.ea(y),z=x.symbolWidth,w=v.Bh(c,x.layout.symbolGapWidth),A=n?g.x+g.b-z:g.x,d=n?g.x+g.b-z-w:g.x+z+w,h=f.iVa(c,A,g.y,t,e),B=e.text,r;null!=B&&
(r=f.jVa(p,u,B,x.textStyle))&&(r.na(d),a.ga.yQ(r,g.y+t/2),n&&r.dh());p.B(h);g=new a.Rect(y,n?d-u-f.qZ:A-f.qZ,g.y-f.qZ,z+w+u+2*f.qZ,t+2*f.qZ);g.Yb();x=x.hideAndShowBehavior;"none"!=x&&"off"!=x&&g.setCursor("pointer");p.B(g);p=[g,h];null!=r&&p.push(r);r=F.Xb(p,c,e,null!=r?r.fn():null,e.shortDesc,f.BXa(c,e));f.pca(f.Bba(e),c)&&(h.Zr(r.Zb()),h.Ma().sc());if("none"!=x&&"off"!=x||null!=e.shortDesc)g.zg("img"),r.txa()};f.BXa=function(a,f){return"on"==f.drilling?!0:"off"==f.drilling?!1:"on"==a.A().drilling};
f.jVa=function(c,f,e,g){e=new a.M(c.a,e);e.ub(g);return e=a.ga.Xc(e,f,Infinity,c)?e:null};f.iVa=function(c,p,e,g,u){var t=c.A(),v=c.a,y=null!=u.type?u.type:u.symbolType;u.markerShape||(u.markerShape=t._markerShape);u.color||(u.color=t._color);u.lineWidth||(u.lineWidth="lineWithMarker"==y?f.bia:t._lineWidth);var n=t.symbolWidth,t=t.symbolHeight,z=e+g/2,w=p+n/2;"line"==y?v=f.hCa(v,p,e,n,g,u):"lineWithMarker"==y?(v=f.hCa(v,p,e,n,g,u),f.pca(f.Bba(u),c)||v.B(f.dz(c,w,z,n*f.xAa,t*f.xAa,u))):"image"==y?
v=f.ska(c,p,e,n,t,g,u):"_verticalBoxPlot"==y?(t=Math.max(4*Math.round(t/4),4),v=new a.ca(v),v.B(f.dz(c,w,z+t/4,n,t/2,f.e$(u,"q2"))),v.B(f.dz(c,w,z-t/4,n,t/2,f.e$(u,"q3")))):"_horizontalBoxPlot"==y?(p=a.m.ea(v),n=Math.max(4*Math.round(n/4),4),p=n/4*(p?1:-1),v=new a.ca(v),v.B(f.dz(c,w+p,z,n/2,t,f.e$(u,"q2"))),v.B(f.dz(c,w-p,z,n/2,t,f.e$(u,"q3")))):v=f.dz(c,w,z,n,t,u);return v};f.ska=function(c,f,e,g,u,t,v){return new a.Ac(c.a,f+g/2,e+t/2,g,u,null,v.source)};f.dz=function(c,f,e,g,u,t){var v=c.a,y=c.A();
c=t.markerShape;var n=t.markerColor?t.markerColor:t.color,z=t.markerStyle||t.markerSvgStyle?t.markerStyle||t.markerSvgStyle:t.style||t.svgStyle,w=t.markerClassName||t.markerSvgClassName?t.markerClassName||t.markerSvgClassName:t.className||t.svgClassName,A=t.pattern;A&&"none"!=A?(g=new a.W(v,c,y.skin,0,0,g,u,null,null,!0),g.Ia(new a.kb(A,n,"#FFFFFF")),g.ib(f,e)):(g=new a.W(v,c,y.skin,f,e,g,u,null,null,!0),g.bb(n));t.borderColor&&g.uc(t.borderColor,null,t._borderWidth?t._borderWidth:1);"square"!=c&&
"rectangle"!=c||g.Wc(!0);g.sc(w).Ma(z);return g};f.hCa=function(c,f,e,g,u,t){e+=u/2;c=new a.Gb(c,f,e,f+g,e);f=new a.ma(t.color,1,t.lineWidth);g=t.lineStyle;"dashed"==g?f.um(a.Pa.VB(g),"4,2,4"):"dotted"==g&&f.um(a.Pa.VB(g),"2");c.sc(t.className||t.svgClassName).Ma(t.style||t.svgStyle);c.Ha(f);c.Wc(!0);return c};f.e$=function(a,f){return{markerShape:"rectangle",color:a._boxPlot[f+"Color"],pattern:a._boxPlot["_"+f+"Pattern"],className:a._boxPlot[f+"ClassName"]||a._boxPlot[f+"svgClassName"],style:a._boxPlot[f+
"Style"]||a._boxPlot[f+"svgStyle"]}};f.Bba=function(a){var f=null;return f=a.categories&&0<a.categories.length?a.categories[0]:a.id?a.id:a.text};f.pca=function(c,f){var e=f.A().hiddenCategories;return!e||0>=e.length?!1:-1!==a.Y.ac(e,c)};a.K(a,"Legend",a.Rf);a.K(a.Rf,"newInstance",a.Rf.newInstance);a.K(a.Rf.prototype,"destroy",a.Rf.prototype.Ec);a.K(a.Rf.prototype,"getAutomation",a.Rf.prototype.Bi);a.K(a.Rf.prototype,"getPreferredSize",a.Rf.prototype.jy);a.K(a.Rf.prototype,"highlight",a.Rf.prototype.Zd);
a.K(a.Rf.prototype,"render",a.Rf.prototype.ia);a.K(x.prototype,"getDomElementForSubId",x.prototype.Sh);a.K(x.prototype,"getItem",x.prototype.getItem);a.K(x.prototype,"getSection",x.prototype.Z3a);a.K(x.prototype,"getTitle",x.prototype.ny)})(dvt);
  return dvt;
});
