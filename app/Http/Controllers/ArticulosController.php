<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Articulo;

class ArticulosController extends Controller{

    public function TodosArticulos()
    {
        $consulta = \DB::select("SELECT * FROM articulos");
        if (count($consulta) > 0) {
            return response()->json(array("status" => true, "articulos" => $consulta));
        }else{
            return response()->json(array("status" => false, "mensaje" => "No hay articulos que cargar"));
        }
    }

    public function consultarArticulos(Request $request)
    {

        $this->validate($request, [
            'descripcion' => 'required|string'
        ], [
            'descripcion.required' => 'Campo descripcion es requerido'
        ]);

        $buscar = \DB::select("SELECT * FROM  articulos WHERE descripcion LIKE '%".$request->descripcion."%'");

        if (!empty($buscar)) {
            return response()->json(['status' => true, 'datos' => $buscar]);            
        }else{
            return response()->json(['status' => false, 'message' => "Datos no encontrados o no existen"]);
        }

    }

    public function saveArticulos(Request $request)
    {
        $cod_producto   = $request->input('cod_producto');
        $descripcion    = $request->input('descripcion');
        $precio         = $request->input('precio');
        $stock          = $request->input('stock');

        $this->validate($request, [
            'cod_producto' => 'required|string'
        ], [
            'cod_producto.required' => 'Campo cod_producto es requerido'
        ]);

        $validacion = \DB::select("SELECT * FROM articulos WHERE cod_producto='".$cod_producto."'");

        if ( empty($validacion) ) {
            $savedata = \DB::select("INSERT INTO articulos (cod_producto, descripcion, precio, stock) VALUE ('".$cod_producto."', '".$descripcion."','".$precio."', '".$stock."')");
            return response()->json(array("status" => true, "respuesta" => "Datos guardados exitosamente" ));
        }else{
            return response()->json(array("status" => false, "error" => "El codigo del producto ya existe, valide por favor."));
        }
    }

    public function actualizarDatos( Request $request ){

        $this->validate($request, [
            'id' => 'required|int'
        ], [
            'id.required' => 'EL id es requerido'
        ]);

        $this->validate($request, [
            'cod_producto' => 'required|string'
        ], [
            'cod_producto.required' => 'EL cod_producto es requerido'
        ]);
        
        $update = \DB::select("UPDATE articulos SET cod_producto = '".$request->cod_producto."', descripcion='".$request->descripcion."', precio='".$request->precio."', stock='".$request->stock."' WHERE id = '". $request->id ."'");

        return response()->json([
            "res" => true, 
            "message" => "Datos actualizados correctamente"
        ]);

    }

    public function eliminarArticulo(Request $request){
        
        $this->validate($request, [
            'id' => 'required|int'
        ], [
            'id.required' => 'EL id es requerido para eliminar'
        ]);

        $validacion = \DB::select("SELECT id FROM articulos WHERE id = '".$request->id."'");

        if (!empty($validacion)) {
            $delete = \DB::delete("DELETE FROM articulos WHERE id = '". $request->id ."'");
            return response()->json(array('status' => true, "message" => "El articulo fue eliminado."));
        }else{
            return response()->json(['status' => false, "message" => "El articulo que intenta eliminar no existe."]);
        }

    }

}