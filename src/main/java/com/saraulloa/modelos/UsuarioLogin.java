package com.saraulloa.modelos;

import jakarta.validation.constraints.NotBlank;

public class UsuarioLogin {
    
    @NotBlank(message="Por favor proporciona tu correo")
    private String correo;

    @NotBlank(message = "Por favor proporciona una contraseña válida.")
    private String contrasenia;
    

    public UsuarioLogin() {}


	public String getCorreo() {
		return correo;
	}


	public void setCorreo(String correo) {
		this.correo = correo;
	}


	public String getContrasenia() {
		return contrasenia;
	}


	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}
}
