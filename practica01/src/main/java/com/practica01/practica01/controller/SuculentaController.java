package com.practica01.practica01.controller;

import com.practica01.practica01.domain.Suculenta;
import com.practica01.practica01.service.SuculentaService;
import jakarta.validation.Valid;
import java.util.Locale;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/suculenta")
public class SuculentaController {

    private final SuculentaService suculentaService;
    private final MessageSource messageSource;

    @GetMapping("/listado")
    public String listado(Model model) {
        var suculentas = suculentaService.getSuculentas(false);
        model.addAttribute("suculentas", suculentas);
        model.addAttribute("totalSuculentas", suculentas.size());
        log.trace("Listado de suculentas: {} registros", suculentas.size());
        return "suculenta/listado";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid Suculenta suculenta, BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error",
                    messageSource.getMessage("suculenta.error04", null, Locale.getDefault()));
            return "redirect:/suculenta/listado";
        }
        try {
            suculentaService.save(suculenta);
            redirectAttributes.addFlashAttribute("todoOk",
                    messageSource.getMessage("mensaje.actualizado", null, Locale.getDefault()));
        } catch (DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("error",
                    messageSource.getMessage("suculenta.error05", null, Locale.getDefault()));
        }
        return "redirect:/suculenta/listado";
    }

    @PostMapping("/eliminar")
    public String eliminar(@RequestParam Integer idSuculenta, RedirectAttributes redirectAttributes) {
        String titulo = "todoOk";
        String detalle = "mensaje.eliminado";
        try {
            suculentaService.delete(idSuculenta);
        } catch (IllegalArgumentException e) {
            titulo = "error";
            detalle = "suculenta.error01";
        } catch (IllegalStateException e) {
            titulo = "error";
            detalle = "suculenta.error02";
        } catch (Exception e) {
            titulo = "error";
            detalle = "suculenta.error03";
        }
        redirectAttributes.addFlashAttribute(titulo, messageSource.getMessage(detalle, null, Locale.getDefault()));
        return "redirect:/suculenta/listado";
    }
}