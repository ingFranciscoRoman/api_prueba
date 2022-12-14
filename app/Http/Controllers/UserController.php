<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;


class UserController extends Controller{

    public function createUsers(Request $request)
    {
        $input = $request->all();
        $input['password'] = Hash::make($request->password);
        User::create($input);
        
        return response()->json([
            'res' => true, 
            'message' => 'Registro insertado correctamente.'
        ]);
    }

    public function login(Request $request){
        $user = User::whereEmail($request->email)->first();

        if (!is_null($user) && Hash::check($request->password, $user->password)) {
            $user->api_token = Str::random(150);
            $user->save();
            return response()->json([
                'res' => true,
                'token' => $user->api_token, 
                'rol_usuario' => $user->id_user_r,
                'message' => 'Bienvenido al sistema.'
            ]); 
        }else{
            return response()->json([
                'res' => false, 
                'message' => 'La contraseña o el usuario son incorrectos.'
            ]);
        }
    }

    public function logout()
    {
        $user = auth()->user();
        $user->api_token = null;
        $user->save();

        return response()->json([
            'res' => true, 
            'message' => 'Cerrar sesion.'
        ]);

    }

}