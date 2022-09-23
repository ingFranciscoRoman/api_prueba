<?php   
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Articulo extends Model{
    protected $table = "articulos";

    protected $fillable = [
        'id', 'cod_producto', 'descripcion', 'precio', 'stock'
    ];

    // public $timestamps = false;
}