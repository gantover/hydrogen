var ne=Object.defineProperty;var re=(e,t,n)=>t in e?ne(e,t,{enumerable:!0,configurable:!0,writable:!0,value:n}):e[t]=n;var M=(e,t,n)=>(re(e,typeof t!="symbol"?t+"":t,n),n);(function(){const t=document.createElement("link").relList;if(t&&t.supports&&t.supports("modulepreload"))return;for(const s of document.querySelectorAll('link[rel="modulepreload"]'))r(s);new MutationObserver(s=>{for(const i of s)if(i.type==="childList")for(const a of i.addedNodes)a.tagName==="LINK"&&a.rel==="modulepreload"&&r(a)}).observe(document,{childList:!0,subtree:!0});function n(s){const i={};return s.integrity&&(i.integrity=s.integrity),s.referrerPolicy&&(i.referrerPolicy=s.referrerPolicy),s.crossOrigin==="use-credentials"?i.credentials="include":s.crossOrigin==="anonymous"?i.credentials="omit":i.credentials="same-origin",i}function r(s){if(s.ep)return;s.ep=!0;const i=n(s);fetch(s.href,i)}})();function S(){}function U(e){return e()}function T(){return Object.create(null)}function C(e){e.forEach(U)}function z(e){return typeof e=="function"}function F(e,t){return e!=e?t==t:e!==t||e&&typeof e=="object"||typeof e=="function"}function se(e){return Object.keys(e).length===0}function c(e,t){e.appendChild(t)}function K(e,t,n){e.insertBefore(t,n||null)}function P(e){e.parentNode&&e.parentNode.removeChild(e)}function _(e){return document.createElement(e)}function L(e){return document.createTextNode(e)}function x(){return L(" ")}function ie(e,t,n,r){return e.addEventListener(t,n,r),()=>e.removeEventListener(t,n,r)}function V(e,t,n){n==null?e.removeAttribute(t):e.getAttribute(t)!==n&&e.setAttribute(t,n)}function oe(e){return Array.from(e.childNodes)}function D(e,t){t=""+t,e.data!==t&&(e.data=t)}let R;function A(e){R=e}const y=[],B=[];let b=[];const H=[],ae=Promise.resolve();let k=!1;function ce(){k||(k=!0,ae.then(G))}function N(e){b.push(e)}const j=new Set;let m=0;function G(){if(m!==0)return;const e=R;do{try{for(;m<y.length;){const t=y[m];m++,A(t),fe(t.$$)}}catch(t){throw y.length=0,m=0,t}for(A(null),y.length=0,m=0;B.length;)B.pop()();for(let t=0;t<b.length;t+=1){const n=b[t];j.has(n)||(j.add(n),n())}b.length=0}while(y.length);for(;H.length;)H.pop()();k=!1,j.clear(),A(e)}function fe(e){if(e.fragment!==null){e.update(),C(e.before_update);const t=e.dirty;e.dirty=[-1],e.fragment&&e.fragment.p(e.ctx,t),e.after_update.forEach(N)}}function le(e){const t=[],n=[];b.forEach(r=>e.indexOf(r)===-1?t.push(r):n.push(r)),n.forEach(r=>r()),b=t}const E=new Set;let ue;function J(e,t){e&&e.i&&(E.delete(e),e.i(t))}function de(e,t,n,r){if(e&&e.o){if(E.has(e))return;E.add(e),ue.c.push(()=>{E.delete(e),r&&(n&&e.d(1),r())}),e.o(t)}else r&&r()}function pe(e){e&&e.c()}function Q(e,t,n){const{fragment:r,after_update:s}=e.$$;r&&r.m(t,n),N(()=>{const i=e.$$.on_mount.map(U).filter(z);e.$$.on_destroy?e.$$.on_destroy.push(...i):C(i),e.$$.on_mount=[]}),s.forEach(N)}function X(e,t){const n=e.$$;n.fragment!==null&&(le(n.after_update),C(n.on_destroy),n.fragment&&n.fragment.d(t),n.on_destroy=n.fragment=null,n.ctx=[])}function _e(e,t){e.$$.dirty[0]===-1&&(y.push(e),ce(),e.$$.dirty.fill(0)),e.$$.dirty[t/31|0]|=1<<t%31}function Y(e,t,n,r,s,i,a,l=[-1]){const p=R;A(e);const o=e.$$={fragment:null,ctx:[],props:i,update:S,not_equal:s,bound:T(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(t.context||(p?p.$$.context:[])),callbacks:T(),dirty:l,skip_bound:!1,root:t.target||p.$$.root};a&&a(o.root);let $=!1;if(o.ctx=n?n(e,t.props||{},(f,u,...w)=>{const g=w.length?w[0]:u;return o.ctx&&s(o.ctx[f],o.ctx[f]=g)&&(!o.skip_bound&&o.bound[f]&&o.bound[f](g),$&&_e(e,f)),u}):[],o.update(),$=!0,C(o.before_update),o.fragment=r?r(o.ctx):!1,t.target){if(t.hydrate){const f=oe(t.target);o.fragment&&o.fragment.l(f),f.forEach(P)}else o.fragment&&o.fragment.c();t.intro&&J(e.$$.fragment),Q(e,t.target,t.anchor),G()}A(p)}class Z{constructor(){M(this,"$$");M(this,"$$set")}$destroy(){X(this,1),this.$destroy=S}$on(t,n){if(!z(n))return S;const r=this.$$.callbacks[t]||(this.$$.callbacks[t]=[]);return r.push(n),()=>{const s=r.indexOf(n);s!==-1&&r.splice(s,1)}}$set(t){this.$$set&&!se(t)&&(this.$$.skip_bound=!0,this.$$set(t),this.$$.skip_bound=!1)}}const he="4";typeof window<"u"&&(window.__svelte||(window.__svelte={v:new Set})).v.add(he);const ge="/hydrogen/assets/svelte-a39f39b7.svg",me="/hydrogen/vite.svg";function ye(e){let t,n,r,s,i;return{c(){t=_("button"),n=L("count is "),r=L(e[0])},m(a,l){K(a,t,l),c(t,n),c(t,r),s||(i=ie(t,"click",e[1]),s=!0)},p(a,[l]){l&1&&D(r,a[0])},i:S,o:S,d(a){a&&P(t),s=!1,i()}}}function be(e,t,n){let r=0;return[r,()=>{n(0,r+=1)}]}class $e extends Z{constructor(t){super(),Y(this,t,be,ye,F,{})}}function we(e){let t,n,r,s,i,a,l=e[0].add(5,7)+"",p,o,$,f,u,w,g,I,O,v;return u=new $e({}),{c(){t=_("main"),n=_("div"),n.innerHTML=`<a href="https://vitejs.dev" target="_blank" rel="noreferrer"><img src="${me}" class="logo svelte-11cv5lq" alt="Vite Logo"/></a> <a href="https://svelte.dev" target="_blank" rel="noreferrer"><img src="${ge}" class="logo svelte svelte-11cv5lq" alt="Svelte Logo"/></a>`,r=x(),s=_("h1"),s.textContent="Vite + Svelte",i=x(),a=_("h1"),p=L(l),o=L(";"),$=x(),f=_("div"),pe(u.$$.fragment),w=x(),g=_("p"),g.innerHTML='Check out <a href="https://github.com/sveltejs/kit#readme" target="_blank" rel="noreferrer">SvelteKit</a>, the official Svelte app framework powered by Vite!',I=x(),O=_("p"),O.textContent="Click on the Vite and Svelte logos to learn more",V(f,"class","card"),V(O,"class","read-the-docs svelte-11cv5lq")},m(d,W){K(d,t,W),c(t,n),c(t,r),c(t,s),c(t,i),c(t,a),c(a,p),c(a,o),c(t,$),c(t,f),Q(u,f,null),c(t,w),c(t,g),c(t,I),c(t,O),v=!0},p(d,[W]){(!v||W&1)&&l!==(l=d[0].add(5,7)+"")&&D(p,l)},i(d){v||(J(u.$$.fragment,d),v=!0)},o(d){de(u.$$.fragment,d),v=!1},d(d){d&&P(t),X(u)}}}function ve(e,t,n){let{bindings:r}=t;return e.$$set=s=>{"bindings"in s&&n(0,r=s.bindings)},[r]}class xe extends Z{constructor(t){super(),Y(this,t,ve,we,F,{bindings:0})}}let h;function Ae(e,t){return h.add(e,t)>>>0}async function Se(e,t){if(typeof Response=="function"&&e instanceof Response){if(typeof WebAssembly.instantiateStreaming=="function")try{return await WebAssembly.instantiateStreaming(e,t)}catch(r){if(e.headers.get("Content-Type")!="application/wasm")console.warn("`WebAssembly.instantiateStreaming` failed because your server does not serve wasm with `application/wasm` MIME type. Falling back to `WebAssembly.instantiate` which is slower. Original error:\n",r);else throw r}const n=await e.arrayBuffer();return await WebAssembly.instantiate(n,t)}else{const n=await WebAssembly.instantiate(e,t);return n instanceof WebAssembly.Instance?{instance:n,module:e}:n}}function ee(){const e={};return e.wbg={},e}function te(e,t){return h=e.exports,q.__wbindgen_wasm_module=t,h}function Le(e){if(h!==void 0)return h;const t=ee();e instanceof WebAssembly.Module||(e=new WebAssembly.Module(e));const n=new WebAssembly.Instance(e,t);return te(n,e)}async function q(e){if(h!==void 0)return h;const t=ee();(typeof e=="string"||typeof Request=="function"&&e instanceof Request||typeof URL=="function"&&e instanceof URL)&&(e=fetch(e));const{instance:n,module:r}=await Se(await e,t);return te(n,r)}const Oe=Object.freeze(Object.defineProperty({__proto__:null,add:Ae,default:q,initSync:Le},Symbol.toStringTag,{value:"Module"})),Ee=async(e={})=>{let{importHook:t,serverPath:n}=e,r="assets/rust_lib-cc27db1d.wasm";return n!=null&&(r=n+/[^\/\\]*$/.exec(r)[0]),t!=null&&(r=t(r)),await q(r),Oe},Ce=async()=>{const e=await Ee();new xe({target:document.body,props:{bindings:e}})};Ce();
