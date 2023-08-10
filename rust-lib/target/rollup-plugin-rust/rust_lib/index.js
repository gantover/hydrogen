let wasm;

const cachedTextDecoder = (typeof TextDecoder !== 'undefined' ? new TextDecoder('utf-8', { ignoreBOM: true, fatal: true }) : { decode: () => { throw Error('TextDecoder not available') } } );

if (typeof TextDecoder !== 'undefined') { cachedTextDecoder.decode(); };

let cachedUint8Memory0 = null;

function getUint8Memory0() {
    if (cachedUint8Memory0 === null || cachedUint8Memory0.byteLength === 0) {
        cachedUint8Memory0 = new Uint8Array(wasm.memory.buffer);
    }
    return cachedUint8Memory0;
}

function getStringFromWasm0(ptr, len) {
    ptr = ptr >>> 0;
    return cachedTextDecoder.decode(getUint8Memory0().subarray(ptr, ptr + len));
}

const heap = new Array(128).fill(undefined);

heap.push(undefined, null, true, false);

let heap_next = heap.length;

function addHeapObject(obj) {
    if (heap_next === heap.length) heap.push(heap.length + 1);
    const idx = heap_next;
    heap_next = heap[idx];

    heap[idx] = obj;
    return idx;
}
/**
* @param {number} left
* @param {number} right
* @returns {number}
*/
export function add(left, right) {
    const ret = wasm.add(left, right);
    return ret >>> 0;
}

let WASM_VECTOR_LEN = 0;

const cachedTextEncoder = (typeof TextEncoder !== 'undefined' ? new TextEncoder('utf-8') : { encode: () => { throw Error('TextEncoder not available') } } );

const encodeString = (typeof cachedTextEncoder.encodeInto === 'function'
    ? function (arg, view) {
    return cachedTextEncoder.encodeInto(arg, view);
}
    : function (arg, view) {
    const buf = cachedTextEncoder.encode(arg);
    view.set(buf);
    return {
        read: arg.length,
        written: buf.length
    };
});

function passStringToWasm0(arg, malloc, realloc) {

    if (realloc === undefined) {
        const buf = cachedTextEncoder.encode(arg);
        const ptr = malloc(buf.length, 1) >>> 0;
        getUint8Memory0().subarray(ptr, ptr + buf.length).set(buf);
        WASM_VECTOR_LEN = buf.length;
        return ptr;
    }

    let len = arg.length;
    let ptr = malloc(len, 1) >>> 0;

    const mem = getUint8Memory0();

    let offset = 0;

    for (; offset < len; offset++) {
        const code = arg.charCodeAt(offset);
        if (code > 0x7F) break;
        mem[ptr + offset] = code;
    }

    if (offset !== len) {
        if (offset !== 0) {
            arg = arg.slice(offset);
        }
        ptr = realloc(ptr, len, len = offset + arg.length * 3, 1) >>> 0;
        const view = getUint8Memory0().subarray(ptr + offset, ptr + len);
        const ret = encodeString(arg, view);

        offset += ret.written;
    }

    WASM_VECTOR_LEN = offset;
    return ptr;
}

let cachedInt32Memory0 = null;

function getInt32Memory0() {
    if (cachedInt32Memory0 === null || cachedInt32Memory0.byteLength === 0) {
        cachedInt32Memory0 = new Int32Array(wasm.memory.buffer);
    }
    return cachedInt32Memory0;
}

let cachedFloat64Memory0 = null;

function getFloat64Memory0() {
    if (cachedFloat64Memory0 === null || cachedFloat64Memory0.byteLength === 0) {
        cachedFloat64Memory0 = new Float64Array(wasm.memory.buffer);
    }
    return cachedFloat64Memory0;
}

function getArrayF64FromWasm0(ptr, len) {
    ptr = ptr >>> 0;
    return getFloat64Memory0().subarray(ptr / 8, ptr / 8 + len);
}

function passArrayF64ToWasm0(arg, malloc) {
    const ptr = malloc(arg.length * 8, 8) >>> 0;
    getFloat64Memory0().set(arg, ptr / 8);
    WASM_VECTOR_LEN = arg.length;
    return ptr;
}

function _assertClass(instance, klass) {
    if (!(instance instanceof klass)) {
        throw new Error(`expected instance of ${klass.name}`);
    }
    return instance.ptr;
}

function getObject(idx) { return heap[idx]; }

function dropObject(idx) {
    if (idx < 132) return;
    heap[idx] = heap_next;
    heap_next = idx;
}

function takeObject(idx) {
    const ret = getObject(idx);
    dropObject(idx);
    return ret;
}

let cachedFloat32Memory0 = null;

function getFloat32Memory0() {
    if (cachedFloat32Memory0 === null || cachedFloat32Memory0.byteLength === 0) {
        cachedFloat32Memory0 = new Float32Array(wasm.memory.buffer);
    }
    return cachedFloat32Memory0;
}

function getArrayF32FromWasm0(ptr, len) {
    ptr = ptr >>> 0;
    return getFloat32Memory0().subarray(ptr / 4, ptr / 4 + len);
}

function passArrayF32ToWasm0(arg, malloc) {
    const ptr = malloc(arg.length * 4, 4) >>> 0;
    getFloat32Memory0().set(arg, ptr / 4);
    WASM_VECTOR_LEN = arg.length;
    return ptr;
}

let cachedUint32Memory0 = null;

function getUint32Memory0() {
    if (cachedUint32Memory0 === null || cachedUint32Memory0.byteLength === 0) {
        cachedUint32Memory0 = new Uint32Array(wasm.memory.buffer);
    }
    return cachedUint32Memory0;
}

function getArrayU32FromWasm0(ptr, len) {
    ptr = ptr >>> 0;
    return getUint32Memory0().subarray(ptr / 4, ptr / 4 + len);
}

function passArray32ToWasm0(arg, malloc) {
    const ptr = malloc(arg.length * 4, 4) >>> 0;
    getUint32Memory0().set(arg, ptr / 4);
    WASM_VECTOR_LEN = arg.length;
    return ptr;
}
/**
*/
export class Angulaire {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(Angulaire.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_angulaire_free(ptr);
    }
    /**
    * @param {bigint} l
    * @param {bigint} m
    * @param {string} wave_type
    */
    constructor(l, m, wave_type) {
        const ptr0 = passStringToWasm0(wave_type, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.angulaire_new(l, m, ptr0, len0);
        return Angulaire.__wrap(ret);
    }
    /**
    * @returns {EvalRes}
    */
    eval_range_values() {
        const ret = wasm.angulaire_eval_range_values(this.__wbg_ptr);
        return EvalRes.__wrap(ret);
    }
    /**
    * @param {number} theta
    * @returns {number}
    */
    eval_sign(theta) {
        const ret = wasm.angulaire_eval_sign(this.__wbg_ptr, theta);
        return ret;
    }
}
/**
*/
export class EvalRes {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(EvalRes.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_evalres_free(ptr);
    }
    /**
    * @returns {Float64Array}
    */
    get range() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_evalres_range(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v1 = getArrayF64FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 8);
            return v1;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Float64Array} arg0
    */
    set range(arg0) {
        const ptr0 = passArrayF64ToWasm0(arg0, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_evalres_range(this.__wbg_ptr, ptr0, len0);
    }
    /**
    * @returns {Float64Array}
    */
    get values() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_evalres_values(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v1 = getArrayF64FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 8);
            return v1;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Float64Array} arg0
    */
    set values(arg0) {
        const ptr0 = passArrayF64ToWasm0(arg0, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_evalres_values(this.__wbg_ptr, ptr0, len0);
    }
    /**
    * @returns {number}
    */
    get avr() {
        const ret = wasm.__wbg_get_evalres_avr(this.__wbg_ptr);
        return ret;
    }
    /**
    * @param {number} arg0
    */
    set avr(arg0) {
        wasm.__wbg_set_evalres_avr(this.__wbg_ptr, arg0);
    }
    /**
    * @returns {number}
    */
    get dist() {
        const ret = wasm.__wbg_get_evalres_dist(this.__wbg_ptr);
        return ret;
    }
    /**
    * @param {number} arg0
    */
    set dist(arg0) {
        wasm.__wbg_set_evalres_dist(this.__wbg_ptr, arg0);
    }
    /**
    * @returns {string}
    */
    get legend() {
        let deferred1_0;
        let deferred1_1;
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_evalres_legend(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            deferred1_0 = r0;
            deferred1_1 = r1;
            return getStringFromWasm0(r0, r1);
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
            wasm.__wbindgen_free(deferred1_0, deferred1_1, 1);
        }
    }
    /**
    * @param {string} arg0
    */
    set legend(arg0) {
        const ptr0 = passStringToWasm0(arg0, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_evalres_legend(this.__wbg_ptr, ptr0, len0);
    }
}
/**
*/
export class FunctionLegendre {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(FunctionLegendre.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_functionlegendre_free(ptr);
    }
    /**
    * @param {bigint} l
    * @param {bigint} m
    */
    constructor(l, m) {
        const ret = wasm.functionlegendre_new(l, m);
        return FunctionLegendre.__wrap(ret);
    }
    /**
    * @param {number} theta
    * @returns {number}
    */
    eval(theta) {
        const ret = wasm.functionlegendre_eval(this.__wbg_ptr, theta);
        return ret;
    }
    /**
    * @param {number} theta
    * @returns {number}
    */
    eval_sign(theta) {
        const ret = wasm.functionlegendre_eval_sign(this.__wbg_ptr, theta);
        return ret;
    }
}
/**
*/
export class MarchingCubes {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(MarchingCubes.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_marchingcubes_free(ptr);
    }
    /**
    * @param {Wave} wave
    * @param {number} size
    * @param {number} subdivisions
    * @param {number} avr
    */
    constructor(wave, size, subdivisions, avr) {
        _assertClass(wave, Wave);
        var ptr0 = wave.__destroy_into_raw();
        const ret = wasm.marchingcubes_new(ptr0, size, subdivisions, avr);
        return MarchingCubes.__wrap(ret);
    }
    /**
    * @param {number} threshold
    * @param {string} material_type
    * @returns {MarchingCubesResult}
    */
    get_res(threshold, material_type) {
        const ptr0 = passStringToWasm0(material_type, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.marchingcubes_get_res(this.__wbg_ptr, threshold, ptr0, len0);
        return MarchingCubesResult.__wrap(ret);
    }
}
/**
*/
export class MarchingCubesResult {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(MarchingCubesResult.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_marchingcubesresult_free(ptr);
    }
    /**
    * @returns {Float32Array}
    */
    get vertices() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_marchingcubesresult_vertices(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v1 = getArrayF32FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 4);
            return v1;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Float32Array} arg0
    */
    set vertices(arg0) {
        const ptr0 = passArrayF32ToWasm0(arg0, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_marchingcubesresult_vertices(this.__wbg_ptr, ptr0, len0);
    }
    /**
    * @returns {Uint32Array}
    */
    get indices() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_marchingcubesresult_indices(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v1 = getArrayU32FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 4);
            return v1;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Uint32Array} arg0
    */
    set indices(arg0) {
        const ptr0 = passArray32ToWasm0(arg0, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_marchingcubesresult_indices(this.__wbg_ptr, ptr0, len0);
    }
    /**
    * @returns {Float32Array}
    */
    get normals() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_marchingcubesresult_normals(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v1 = getArrayF32FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 4);
            return v1;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Float32Array} arg0
    */
    set normals(arg0) {
        const ptr0 = passArrayF32ToWasm0(arg0, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_marchingcubesresult_normals(this.__wbg_ptr, ptr0, len0);
    }
    /**
    * @returns {Float32Array}
    */
    get colors() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.__wbg_get_marchingcubesresult_colors(retptr, this.__wbg_ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v1 = getArrayF32FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 4);
            return v1;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Float32Array} arg0
    */
    set colors(arg0) {
        const ptr0 = passArrayF32ToWasm0(arg0, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.__wbg_set_marchingcubesresult_colors(this.__wbg_ptr, ptr0, len0);
    }
}
/**
*/
export class PolyLaguerreGen {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(PolyLaguerreGen.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_polylaguerregen_free(ptr);
    }
    /**
    * @param {bigint} nr
    * @param {bigint} l
    */
    constructor(nr, l) {
        const ret = wasm.polylaguerregen_new(nr, l);
        return PolyLaguerreGen.__wrap(ret);
    }
    /**
    * @param {number} u
    * @returns {number}
    */
    eval(u) {
        const ret = wasm.polylaguerregen_eval(this.__wbg_ptr, u);
        return ret;
    }
}
/**
*/
export class PolyLegendre {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(PolyLegendre.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_polylegendre_free(ptr);
    }
    /**
    * @param {bigint} l
    */
    constructor(l) {
        const ret = wasm.polylegendre_new(l);
        return PolyLegendre.__wrap(ret);
    }
    /**
    */
    apply_derivative() {
        wasm.polylegendre_apply_derivative(this.__wbg_ptr);
    }
    /**
    * @param {bigint} order
    */
    apply_derivatives(order) {
        wasm.polylegendre_apply_derivatives(this.__wbg_ptr, order);
    }
    /**
    * @param {number} u
    * @returns {number}
    */
    eval_poly(u) {
        const ret = wasm.polylegendre_eval_poly(this.__wbg_ptr, u);
        return ret;
    }
    /**
    * @param {number} u
    * @returns {number}
    */
    eval(u) {
        const ret = wasm.polylegendre_eval(this.__wbg_ptr, u);
        return ret;
    }
    /**
    * @param {number} u
    * @returns {number}
    */
    eval_sign(u) {
        const ret = wasm.polylegendre_eval_sign(this.__wbg_ptr, u);
        return ret;
    }
}
/**
*/
export class Radial {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(Radial.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_radial_free(ptr);
    }
    /**
    * @param {bigint} n
    * @param {bigint} l
    * @param {bigint} z
    * @param {string} wave_type
    */
    constructor(n, l, z, wave_type) {
        const ptr0 = passStringToWasm0(wave_type, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.radial_new(n, l, z, ptr0, len0);
        return Radial.__wrap(ret);
    }
    /**
    * @returns {EvalRes}
    */
    eval_range_values() {
        const ret = wasm.radial_eval_range_values(this.__wbg_ptr);
        return EvalRes.__wrap(ret);
    }
}
/**
*/
export class Wave {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(Wave.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_wave_free(ptr);
    }
    /**
    * @returns {Angulaire}
    */
    get angulaire() {
        const ret = wasm.__wbg_get_wave_angulaire(this.__wbg_ptr);
        return Angulaire.__wrap(ret);
    }
    /**
    * @param {Angulaire} arg0
    */
    set angulaire(arg0) {
        _assertClass(arg0, Angulaire);
        var ptr0 = arg0.__destroy_into_raw();
        wasm.__wbg_set_wave_angulaire(this.__wbg_ptr, ptr0);
    }
    /**
    * @returns {Radial}
    */
    get radial() {
        const ret = wasm.__wbg_get_wave_radial(this.__wbg_ptr);
        return Radial.__wrap(ret);
    }
    /**
    * @param {Radial} arg0
    */
    set radial(arg0) {
        _assertClass(arg0, Radial);
        var ptr0 = arg0.__destroy_into_raw();
        wasm.__wbg_set_wave_radial(this.__wbg_ptr, ptr0);
    }
    /**
    * @param {number} n
    * @param {number} l
    * @param {number} m
    * @param {number} z
    * @param {string} wave_type
    */
    constructor(n, l, m, z, wave_type) {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            const ptr0 = passStringToWasm0(wave_type, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
            const len0 = WASM_VECTOR_LEN;
            wasm.wave_new(retptr, n, l, m, z, ptr0, len0);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var r2 = getInt32Memory0()[retptr / 4 + 2];
            if (r2) {
                throw takeObject(r1);
            }
            return Wave.__wrap(r0);
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {number} x
    * @param {number} y
    * @param {number} z
    * @returns {number}
    */
    eval(x, y, z) {
        const ret = wasm.wave_eval(this.__wbg_ptr, x, y, z);
        return ret;
    }
    /**
    * @param {number} theta
    * @returns {number}
    */
    eval_sign(theta) {
        const ret = wasm.wave_eval_sign(this.__wbg_ptr, theta);
        return ret;
    }
}

async function __wbg_load(module, imports) {
    if (typeof Response === 'function' && module instanceof Response) {
        if (typeof WebAssembly.instantiateStreaming === 'function') {
            try {
                return await WebAssembly.instantiateStreaming(module, imports);

            } catch (e) {
                if (module.headers.get('Content-Type') != 'application/wasm') {
                    console.warn("`WebAssembly.instantiateStreaming` failed because your server does not serve wasm with `application/wasm` MIME type. Falling back to `WebAssembly.instantiate` which is slower. Original error:\n", e);

                } else {
                    throw e;
                }
            }
        }

        const bytes = await module.arrayBuffer();
        return await WebAssembly.instantiate(bytes, imports);

    } else {
        const instance = await WebAssembly.instantiate(module, imports);

        if (instance instanceof WebAssembly.Instance) {
            return { instance, module };

        } else {
            return instance;
        }
    }
}

function __wbg_get_imports() {
    const imports = {};
    imports.wbg = {};
    imports.wbg.__wbindgen_string_new = function(arg0, arg1) {
        const ret = getStringFromWasm0(arg0, arg1);
        return addHeapObject(ret);
    };
    imports.wbg.__wbindgen_throw = function(arg0, arg1) {
        throw new Error(getStringFromWasm0(arg0, arg1));
    };

    return imports;
}

function __wbg_init_memory(imports, maybe_memory) {

}

function __wbg_finalize_init(instance, module) {
    wasm = instance.exports;
    __wbg_init.__wbindgen_wasm_module = module;
    cachedFloat32Memory0 = null;
    cachedFloat64Memory0 = null;
    cachedInt32Memory0 = null;
    cachedUint32Memory0 = null;
    cachedUint8Memory0 = null;


    return wasm;
}

function initSync(module) {
    if (wasm !== undefined) return wasm;

    const imports = __wbg_get_imports();

    __wbg_init_memory(imports);

    if (!(module instanceof WebAssembly.Module)) {
        module = new WebAssembly.Module(module);
    }

    const instance = new WebAssembly.Instance(module, imports);

    return __wbg_finalize_init(instance, module);
}

async function __wbg_init(input) {
    if (wasm !== undefined) return wasm;


    const imports = __wbg_get_imports();

    if (typeof input === 'string' || (typeof Request === 'function' && input instanceof Request) || (typeof URL === 'function' && input instanceof URL)) {
        input = fetch(input);
    }

    __wbg_init_memory(imports);

    const { instance, module } = await __wbg_load(await input, imports);

    return __wbg_finalize_init(instance, module);
}

export { initSync }
export default __wbg_init;
