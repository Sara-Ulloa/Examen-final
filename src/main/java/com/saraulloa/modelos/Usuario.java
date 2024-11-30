package com.saraulloa.modelos;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Size(min=8, message="La contraseña necesita tener al menos 8 caracteres.")
	private String contrasenia;
	
	@NotBlank(message = "Las contraseñas no coinciden.")
	private String confirmacionContrasenia;
	
	@NotBlank(message="Por favor ingresa un correo válido")
    @Column(unique = true)
    private String correo;
	
	@NotBlank(message = "Por favor proporciona tu nombre.")
    @Size(min = 3, message = "Ingrese un nombre con al menos 3 caracteres.")
    private String nombre;
	
	@NotBlank(message = "Por favor proporciona tu apellido.")
    @Size(min = 3, message = "Ingrese un apellido con al menos 3 caracteres.")
    private String apellido;
	
	@OneToMany(mappedBy="usuario", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Poema> poemas;
	
	@Temporal(TemporalType.DATE)
	@Column(name="fecha_creacion")
	private Date fechaCreacion;
	
	@Temporal(TemporalType.DATE)
	@Column(name="fecha_actualizacion")
	private Date fechaActualizacion;
	
	public Usuario() {}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public String getConfirmacionContrasenia() {
		return confirmacionContrasenia;
	}

	public void setConfirmacionContrasenia(String confirmacionContrasenia) {
		this.confirmacionContrasenia = confirmacionContrasenia;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaActualizacion() {
		return fechaActualizacion;
	}

	public void setFechaActualizacion(Date fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	

	@PrePersist
	protected void onCreate() {
		this.fechaCreacion = new Date();
		this.fechaActualizacion = this.fechaCreacion;
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.fechaActualizacion = new Date();
	}
}