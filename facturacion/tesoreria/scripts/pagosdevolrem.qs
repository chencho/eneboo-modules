/***************************************************************************
                 pagosdevolrem.qs  -  description
                             -------------------
    begin                : jue sep 27 2007
    copyright            : (C) 2007 by InfoSiAL S.L.
    email                : mail@infosial.com
 ***************************************************************************/
/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

/** @ file */

/** @class_declaration interna */
////////////////////////////////////////////////////////////////////////////
//// DECLARACION ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
class interna {
    var ctx:Object;
    function interna( context ) { this.ctx = context; }
    function init() { this.ctx.interna_init(); }
        function calculateField(fN:String):String {
                return this.ctx.interna_calculateField(fN);
        }
}
//// INTERNA /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
class oficial extends interna {
    var ejercicioActual:String;
        var contabActivada:Boolean;
        var noGenAsiento:Boolean;
        function oficial( context ) { interna( context ); }
        function bufferChanged(fN:String) {
                return this.ctx.oficial_bufferChanged(fN);
        }
}
//// OFICIAL /////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

/** @class_declaration head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////
class head extends oficial {
    function head( context ) { oficial ( context ); }
}
//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_declaration ifaceCtx */
/////////////////////////////////////////////////////////////////
//// INTERFACE  /////////////////////////////////////////////////
class ifaceCtx extends head {
    function ifaceCtx( context ) { head( context ); }
}


//// INTERFACE  /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

const iface = new ifaceCtx( this );

/** @class_definition interna */
////////////////////////////////////////////////////////////////////////////
//// DEFINICION ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
//// INTERNA /////////////////////////////////////////////////////
/** \C El marco 'Contabilidad' se habilitar� en caso de que est� cargado el m�dulo principal de contabilidad.
\end */
function interna_init()
{
        var util:FLUtil = new FLUtil();
        var cursor:FLSqlCursor = this.cursor();
        this.iface.noGenAsiento = false;

        connect(cursor, "bufferChanged(QString)", this, "iface.bufferChanged");

        this.iface.contabActivada = sys.isLoadedModule("flcontppal") && util.sqlSelect("empresa", "contintegrada", "1 = 1");
        this.iface.ejercicioActual = flfactppal.iface.pub_ejercicioActual();
        if (!this.iface.contabActivada) {
                this.child("tbwPagDevProv").setTabEnabled("contabilidad", false);
        }

        this.child("fdbTipo").setDisabled(true);
        this.child("fdbTipo").setValue("Pago");
}

function interna_calculateField(fN:String):String
{
        var util:FLUtil = new FLUtil();
        var cursor:FLSqlCursor = this.cursor();
        var valor:String;
        switch (fN) {
                default: {
                        valor = false;
                }
        }
        return valor;
}
//// INTERNA /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////


/** @class_definition oficial */
//////////////////////////////////////////////////////////////////
//// OFICIAL /////////////////////////////////////////////////////
function oficial_bufferChanged(fN:String)
{
        var cursor:FLSqlCursor = this.cursor();
        switch (fN) {
                default: {

                }
        }
}
//// OFICIAL /////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition head */
/////////////////////////////////////////////////////////////////
//// DESARROLLO /////////////////////////////////////////////////

//// DESARROLLO /////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////

/** @class_definition ifaceCtx */
/////////////////////////////////////////////////////////////////
//// INTERFACE  /////////////////////////////////////////////////

//// INTERFACE  /////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

