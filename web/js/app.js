const H=[
{id:"altstore",name:"AltStore Classic",source:"altstore-classic://source?url=",install:"altstore://install?url="},
{id:"sidestore",name:"SideStore",source:"sidestore://source?url=",install:"sidestore://install?url="},
{id:"feather",name:"Feather",source:"feather://source/",install:"feather://install/"},
{id:"livecontainer",name:"LiveContainer",source:"livecontainer://sources?url=",install:""},
{id:"stikstore",name:"StikStore",source:"stikstore://add-source?url=",install:""},
{id:"trollapps",name:"TrollApps",source:"trollapps://add?url=",install:""},
{id:"flarestore",name:"FlareStore",source:"flarestore://source?url=",install:""},
{id:"esign",name:"ESign",source:"esign://addsource?url=",install:"esign://install?url="},
{id:"ksign",name:"Ksign",source:"ksign://addsource?url=",install:"ksign://install?url="},
{id:"gbox",name:"GBox",source:"gbox://AddSource/",install:""},
{id:"kravasigner",name:"KravaSigner",source:"kravasigner://addRepo=",install:""}];
const S={sources:JSON.parse(localStorage.getItem("ASC.sources")||"[]")};
const $=x=>document.querySelector(x);
const esc=x=>String(x??"").replace(/[&<>]/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;"}[c]));
const url=x=>/^https?:\/\//i.test(x)?x:"https://"+x;
const save=()=>localStorage.setItem("ASC.sources",JSON.stringify(S.sources));
const handlerURL=(h,u)=>h.source+(h.id==="feather"||h.id==="gbox"?u:encodeURIComponent(u));
const installURL=(h,u)=>h.install+(h.id==="feather"?u:encodeURIComponent(u));
const openURL=u=>{if(u)location.href=u};
async function readSource(u){
if(window.webkit&&window.webkit.messageHandlers&&window.webkit.messageHandlers.fetchJSON){
return new Promise(function(resolve,reject){
window.ASCBridgeResolve=function(status,b64,error){
if(status<200||status>=300){reject(Error(error||("HTTP "+status)));return}
try{const bytes=Uint8Array.from(atob(b64),function(c){return c.charCodeAt(0)});resolve(JSON.parse(new TextDecoder().decode(bytes)))}catch(e){reject(e)}
};
window.webkit.messageHandlers.fetchJSON.postMessage(u);
});
}
const r=await fetch(u,{cache:"no-store"});if(!r.ok)throw Error("HTTP "+r.status);return r.json()}
function sourceCard(s){return '<div class="card"><h3>'+esc(s.name)+'</h3><p class="muted">'+esc(s.url)+'</p><p>'+(s.apps||[]).length+' apps</p><button onclick="showSource(\''+encodeURIComponent(s.url)+'\')">Browse</button> <button onclick="sourceLinks(\''+encodeURIComponent(s.url)+'\')">Add to…</button> <button onclick="removeSource(\''+encodeURIComponent(s.url)+'\')">Remove</button></div>'}
function appCard(a,s){const v=a.versions&&a.versions[0]||a;return '<div class="card"><h3>'+esc(a.name||a.identifier)+'</h3><p class="muted">'+esc(a.developerName||a.developer||'')+' '+esc(v.version||'')+'</p><p>'+esc(a.localizedDescription||a.description||'')+'</p><button onclick="getApp(\''+encodeURIComponent(s.url)+'\',\''+encodeURIComponent(a.bundleIdentifier||a.identifier||'')+'\')">Get</button> <button onclick="sourceLinks(\''+encodeURIComponent(s.url)+'\')">Add Source</button></div>'}
window.sourceLinks=function(u){u=decodeURIComponent(u);$("#modalBody").innerHTML="<h2>Add to…</h2>"+H.map(h=>'<button class="handler" onclick="openHandler(\''+h.id+'\',\''+encodeURIComponent(u)+'\')"><b>'+h.name+'</b><small>'+h.source+'</small></button>').join("");$("#modal").classList.remove("hidden")};
window.openHandler=function(id,u){const h=H.find(x=>x.id===id);if(h)openURL(handlerURL(h,decodeURIComponent(u)))};
window.removeSource=function(u){u=decodeURIComponent(u);S.sources=S.sources.filter(x=>x.url!==u);save();renderSources();renderApps()};
window.showSource=async function(u){u=decodeURIComponent(u);const s=S.sources.find(x=>x.url===u);if(!s)return;$("#modalBody").innerHTML="<h2>"+esc(s.name)+"</h2><p>"+esc(s.url)+"</p><div id=\"sourceApps\">Loading…</div>";$("#modal").classList.remove("hidden");$("#sourceApps").innerHTML=(s.apps||[]).map(a=>appCard(a,s)).join("")||"<p>No apps.</p>"};
window.getApp=function(su,id){const s=S.sources.find(x=>x.url===decodeURIComponent(su));const a=(s&&s.apps||[]).find(x=>(x.bundleIdentifier||x.identifier||"")===decodeURIComponent(id));if(!a)return;const v=a.versions&&a.versions[0]||a;const links=H.filter(h=>h.install&&v.downloadURL).map(h=>'<button class="handler" onclick="installHandler(\''+h.id+'\',\''+encodeURIComponent(v.downloadURL)+'\')"><b>'+h.name+'</b><small>Install URL</small></button>').join("");$("#modalBody").innerHTML="<h2>"+esc(a.name||a.identifier)+"</h2><p>"+esc(a.localizedDescription||a.description||"")+"</p>"+links+"<a class=\"handler\" href=\""+esc(v.downloadURL||"")+"\">Download IPA</a><button class=\"handler\" onclick=\"sourceLinks('"+encodeURIComponent(s.url)+"')\">Add Source</button>";$("#modal").classList.remove("hidden")};
window.installHandler=function(id,u){const h=H.find(x=>x.id===id);if(h)openURL(installURL(h,decodeURIComponent(u)))};
window.addSource=async function(){const raw=prompt("AltSource URL");if(!raw)return;const u=url(raw);try{const x=await readSource(u);x.url=u;x.apps=Array.isArray(x.apps)?x.apps:[];S.sources=[x].concat(S.sources.filter(s=>s.url!==u));save();renderSources();renderApps()}catch(e){alert("Unable to load source: "+e.message)}};
function renderSources(){const a=$("#app");a.innerHTML="<h2>"+t("sources")+"</h2><button onclick=\"addSource()\">"+t("add")+"</button><div>"+S.sources.map(sourceCard).join("")+"</div>"}
function renderApps(){const a=$("#app");const all=[];S.sources.forEach(s=>(s.apps||[]).forEach(x=>all.push(appCard(x,s))));a.innerHTML="<h2>"+t("apps")+"</h2><input id=\"search\" placeholder=\"Search apps…\"><div id=\"appgrid\">"+all.join("")+"</div>";$("#search").oninput=function(){const q=this.value.toLowerCase();$("#appgrid").innerHTML=all.filter(x=>x.toLowerCase().includes(q)).join("")}}
const state={lang:localStorage.getItem("ASC.language")||"en",page:"home"};
const t=k=>(ASC_I18N[state.lang]||ASC_I18N.en)[k]||k;
function render(){const a=$("#app");if(state.page==="sources")return renderSources();if(state.page==="apps")return renderApps();if(state.page==="clients"){a.innerHTML="<h2>"+t("clients")+"</h2>"+H.map(h=>'<div class="card"><h3>'+h.name+'</h3><code>'+h.source+'</code></div>').join("");return}a.innerHTML='<div class="card"><h2>'+t("home")+'</h2><p>'+t("welcome")+'</p><button onclick="addSource()">'+t("add")+"</button></div>"}
document.addEventListener("click",e=>{const b=e.target.closest("[data-page]");if(b){state.page=b.dataset.page;render()}if(e.target.id==="modalClose"||e.target.id==="modal")$("#modal").classList.add("hidden")});
window.setLang=function(v){state.lang=v;localStorage.setItem("ASC.language",v);ASC_applyI18n(v);render()};
render();