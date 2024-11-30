package com.saraulloa.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.saraulloa.modelos.Poema;
import com.saraulloa.modelos.Usuario;
import com.saraulloa.servicios.ServicioPoema;
import com.saraulloa.servicios.ServicioUsuario;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPoema {
	@Autowired
	private final ServicioPoema servicioPoema;
	
	@Autowired
	private final ServicioUsuario servicioUsuario;
	
	public ControladorPoema(ServicioPoema servicioPoema,ServicioUsuario servicioUsuario) {
		this.servicioPoema = servicioPoema;
		this.servicioUsuario = servicioUsuario;
	}
	
	@GetMapping("/poemas")
	public String desplegarPoemas(Model modelo, HttpSession sesion) {
		if(sesion.getAttribute("id_usuario") == null) {
			return "redirect:/login";
		}
		
		List<Poema> poemas = this.servicioPoema.obtenerTodos();
		modelo.addAttribute("poemas", poemas);
		return "poemas.jsp";
	}
	
	@GetMapping("/detalles/poema/{id}")
	public String desplegarDetallePoema(@PathVariable Long id,
										  Model modelo,
										  HttpSession sesion) {
		if(sesion.getAttribute("id_usuario") == null) {
			return "redirect:/login";
		}
		Poema  detallesPoema = this.servicioPoema.obtenerUno(id);
		modelo.addAttribute("detallePoema", detallesPoema);
		return "detallesPoema.jsp";
	}
	
	@GetMapping("/formulario/poema")
	public String desplegarFormularioAgregarPoema(@ModelAttribute Poema poema,
													 HttpSession sesion) {
		if(sesion.getAttribute("id_usuario") == null) {
			return "redirect:/login";
		}
		return "agregarPoema.jsp";
	}
	
	@PostMapping("/agregar/poema")
	public String agregarPoema(@Valid @ModelAttribute Poema poema, 
								  BindingResult validaciones,
								  HttpSession sesion) {
		if(validaciones.hasErrors()) {
			return "agregarPoema.jsp";
		}
		Long id_usuario = (Long)sesion.getAttribute("id_usuario");
		Usuario usuario = this.servicioUsuario.obtenerUsuarioPorId(id_usuario);
		poema.setUsuario(usuario);
		
		this.servicioPoema.agregarUno(poema);
		return "redirect:/poemas";
	}
	
	@DeleteMapping("/eliminar/poema/{id}")
	public String eliminarPoema(@PathVariable Long id) {
		this.servicioPoema.eliminarUno(id);
		return "redirect:/poemas";
	}
	
	@GetMapping("/editar/poema/{idPoema}")
    public String desplegarEditarPoema(@ModelAttribute("poema") Poema poema,
    									@PathVariable("idPoema") Long idPoema, Model modelo) {
    	Poema poemaNuevo = this.servicioPoema.obtenerPoemaPorId(idPoema);
    	modelo.addAttribute("poema", poemaNuevo);
        
        return "editarPoema.jsp";
    }
	
    @PutMapping("/actualizar/poema/{idPoema}")
    public String actualizarPoema(@Valid @ModelAttribute("poema") Poema poema,
                                    BindingResult validaciones,
                                    @PathVariable("idPoema") Long idPoema) {
        if (validaciones.hasErrors()) {
            return "editarPoema"; 
        }
        
        poema.setId(idPoema);
        this.servicioPoema.actualizarUno(poema);
        
        return "redirect:/poemas";
    }
}