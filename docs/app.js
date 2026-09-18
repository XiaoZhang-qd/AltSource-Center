const handlers=[
{id:"altstore",name:"AltStore",source:u=>"altstore-classic://source?url="+encodeURIComponent(u)},
{id:"feather",name:"Feather",source:u=>"feather://source/"+encodeURIComponent(u)},
{id:"livecontainer",name:"LiveContainer",source:u=>"livecontainer://source?url="+encodeURIComponent(u)},
{id:"sidestore",name:"SideStore",source:u=>"sidestore://source?url="+encodeURIComponent(u)},
{id:"stikstore",name:"StikStore",source:u=>"stikstore://add-source?url="+encodeURIComponent(u)},
{id:"trollapps",name:"TrollApps",source:u=>"trollapps://add?url="+encodeURIComponent(u)}];
const input=document.getElementById("source"),buttons=document.getElementById("buttons"),status=document.getElementById("status");
handlers.forEach(h=>{const b=document.createElement("button");b.textContent=h.name;b.onclick=()=>{const u=input.value.trim();if(!u){status.textContent="Enter a source URL first.";return}try{new URL(u)}catch{status.textContent="Invalid URL.";return}window.location.href=h.source(u);status.textContent="Opening "+h.name+"…"};buttons.appendChild(b)});
