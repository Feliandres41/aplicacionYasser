<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $credentials = $request->only('email', 'password');

        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => 'Credenciales incorrectas'
            ], 401);
        }

        // Usuario autenticado
        $user = Auth::user();

        return response()->json([
            'message' => 'Login exitoso',
            'user' => $user
        ], 200);
    }
    public function registro(Request $request)
    {
        $usuario = User::create($request->all());

        return response()->json([
            "message" => "Guardado correctamente",
            "data" => $usuario
        ], 201);
    }
}