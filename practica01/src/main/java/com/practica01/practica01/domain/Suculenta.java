package com.practica01.practica01.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "suculenta")
public class Suculenta implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_suculenta")
    private Integer idSuculenta;

    @Column(name = "nombre_comun", nullable = false, length = 80)
    @NotBlank
    @Size(max = 80)
    private String nombreComun;

    @Column(name = "nombre_cientifico", nullable = false, length = 120)
    @NotBlank
    @Size(max = 120)
    private String nombreCientifico;

    @Column(length = 60)
    @Size(max = 60)
    private String familia;

    @Column(name = "color_principal", length = 40)
    @Size(max = 40)
    private String colorPrincipal;

    @Column(name = "altura_cm", nullable = false)
    @NotNull
    @DecimalMin("0.1")
    private Double alturaCm;

    @Column(name = "precio_estimado", nullable = false, precision = 10, scale = 2)
    @NotNull
    @DecimalMin("0.0")
    private BigDecimal precioEstimado;

    @Column(name = "nivel_riego", nullable = false, length = 20)
    @NotBlank
    @Size(max = 20)
    private String nivelRiego;

    @Column(name = "ruta_imagen", length = 1024)
    @Size(max = 1024)
    private String rutaImagen;

    @Column(nullable = false)
    private boolean activo = true;
}