<?php   
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Libro extends Model{
    protected $table = "libros";

    protected $fillable = [
        'id', 'titulo', 'imagen', 'created_at', 'updated_at'
    ];

    // public $timestamps = false;
}