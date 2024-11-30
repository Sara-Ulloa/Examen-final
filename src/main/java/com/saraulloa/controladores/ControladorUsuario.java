package com.saraulloa.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.saraulloa.modelos.Usuario;
import com.saraulloa.modelos.UsuarioLogin;
import com.saraulloa.servicios.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuario {
	@Autowired
	private final ServicioUsuario servicioUsuario;
	
	public ControladorUsuario(ServicioUsuario servicioUsuario) {
		this.servicioUsuario = servicioUsuario;
	}
	
	@ModelAttribute
    public void addAttributes(@ModelAttribute Usuario usuario, @ModelAttribute UsuarioLogin usuarioLogin, Model model) {
        if (!model.containsAttribute("usuario")) {
            model.addAttribute("usuario", usuario);
        }
        if (!model.containsAttribute("usuarioLogin")) {
            model.addAttribute("usuarioLogin", usuarioLogin);
        }
    }
	
	@GetMapping("/registro")
    public String desplegarRegistro(@ModelAttribute("usuario") Usuario usuario) {
        return "registro.jsp";
    }

    @PostMapping("/procesa/registro")
    public String agregarUsuario(@Valid @ModelAttribute("usuario") Usuario usuario,
                                BindingResult validaciones,
                                HttpSession sesion) {
        if(validaciones.hasErrors()) {
            return "registro.jsp";
        }
        usuario =this.servicioUsuario.agregarUno(usuario);
        sesion.setAttribute("id_usuario", usuario.getId());
        sesion.setAttribute("nombre_usuario", usuario.getNombre() + " " + usuario.getApellido());
        return "redirect:/poemas";
    }
	
    @GetMapping("/login")
    public String desplegarLogin(@ModelAttribute UsuarioLogin usuarioLogin) {
        return "login.jsp";
    }
    @PostMapping("/procesa/login")
    public String procesaLogin(@Valid @ModelAttribute UsuarioLogin usuarioLogin,
                                BindingResult validaciones,
                                HttpSession sesion) {
        Usuario usuario = this.servicioUsuario.obtenerUnoParaLogin(usuarioLogin.getCorreo(), usuarioLogin.getContrasenia());

        if(usuario == null) {
            validaciones.rejectValue("contrasenia", "contraseniaNoCoincide", "Credenciales incorrectas");
        }

        if(validaciones.hasErrors()) {
            return "login.jsp";
        }
        sesion.setAttribute("id_usuario", usuario.getId());
        sesion.setAttribute("nombre_usuario", usuario.getNombre() + " " + usuario.getApellido());
        return "redirect:/poemas";
     }
    
    @GetMapping("/logout")
    public String logout(HttpSession sesion) {
    	sesion.invalidate();
    	return "redirect:/login";
    }
}