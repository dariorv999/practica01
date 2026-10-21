package com.practica01.practica01.service;

import com.practica01.practica01.domain.Suculenta;
import com.practica01.practica01.repository.SuculentaRepository;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class SuculentaService {

    private final SuculentaRepository suculentaRepository;

    @Transactional(readOnly = true)
    public List<Suculenta> getSuculentas(boolean activo) {
        log.trace("Consultando suculentas (solo activas: {})", activo);
        if (activo) {
            return suculentaRepository.findByActivoTrue();
        }
        return suculentaRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<Suculenta> getSuculenta(Integer idSuculenta) {
        return suculentaRepository.findById(idSuculenta);
    }

    @Transactional
    public void save(Suculenta suculenta) {
        log.trace("Guardando suculenta {}", suculenta.getNombreComun());
        suculentaRepository.save(suculenta);
    }

    @Transactional
    public void delete(Integer idSuculenta) {
        if (!suculentaRepository.existsById(idSuculenta)) {
            throw new IllegalArgumentException("La suculenta con ID " + idSuculenta + " no existe.");
        }
        try {
            suculentaRepository.deleteById(idSuculenta);
            suculentaRepository.flush();
            log.trace("Suculenta {} eliminada", idSuculenta);
        } catch (DataIntegrityViolationException e) {
            throw new IllegalStateException("No se puede eliminar la suculenta. Tiene datos asociados.", e);
        }
    }
}