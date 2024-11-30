package com.saraulloa.servicios;

import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.saraulloa.modelos.Usuario;
import com.saraulloa.repositorios.RepositorioUsuario;
import jakarta.validation.Valid;

@Service
public class ServicioUsuario {
    @Autowired
    private final RepositorioUsuario repositorioUsuario;

    public ServicioUsuario(RepositorioUsuario repositorioUsuario) {
        this.repositorioUsuario = repositorioUsuario;
    }

    public List<Usuario> obtenerTodosLosUsuarios() {
        return this.repositorioUsuario.findAll();
    }

    public Usuario agregarUno(Usuario usuario) {
        String contraseñaEncriptada = BCrypt.hashpw(usuario.getContrasenia(), BCrypt.gensalt());
        usuario.setContrasenia(contraseñaEncriptada);
        return this.repositorioUsuario.save(usuario);
    }

    public Usuario obtenerUnoParaLogin(String correo, String contraseña) {
        Usuario usuario = this.repositorioUsuario.findOneByCorreo(correo);
        if (usuario != null && BCrypt.checkpw(contraseña, usuario.getContrasenia())) {
            return usuario;
            
        }
        return null;
    }

    public BindingResult validarRegistro(BindingResult validation, @Valid Usuario usuario) {
        // TODO Auto-generated method stub
        return null;  
    }

	public Usuario obtenerUsuarioPorId(Long id_usuario) {
		// TODO Auto-generated method stub
		return null;
	}
}