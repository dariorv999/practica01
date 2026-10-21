document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('suculentaModal');
    if (!modal) {
        return;
    }
    const form = document.getElementById('suculentaForm');
    const header = document.getElementById('suculentaModalHeader');
    const titulo = document.getElementById('suculentaModalTitulo');
    const id = document.getElementById('suculentaId');
    const nombreComun = document.getElementById('suculentaNombreComun');
    const nombreCientifico = document.getElementById('suculentaNombreCientifico');
    const familia = document.getElementById('suculentaFamilia');
    const colorPrincipal = document.getElementById('suculentaColorPrincipal');
    const alturaCm = document.getElementById('suculentaAlturaCm');
    const precioEstimado = document.getElementById('suculentaPrecioEstimado');
    const nivelRiego = document.getElementById('suculentaNivelRiego');
    const rutaImagen = document.getElementById('suculentaRutaImagen');
    const activo = document.getElementById('suculentaActivo');
    const preview = document.getElementById('suculentaPreview');

    function mostrarPreview(url) {
        if (url) {
            preview.src = url;
            preview.classList.remove('d-none');
        } else {
            preview.removeAttribute('src');
            preview.classList.add('d-none');
        }
    }
    rutaImagen.addEventListener('input', function () {
        mostrarPreview(this.value.trim());
    });

    modal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        if (!button) {
            return;
        }
        const modo = button.getAttribute('data-modo');
        form.reset();
        id.value = '';
        mostrarPreview('');
        titulo.textContent = button.getAttribute('data-titulo') || '';
        header.classList.remove('bg-info', 'bg-warning', 'text-white');
        if (modo === 'editar') {
            const d = button.dataset;
            id.value = d.id || '';
            nombreComun.value = d.nombreComun || '';
            nombreCientifico.value = d.nombreCientifico || '';
            familia.value = d.familia || '';
            colorPrincipal.value = d.colorPrincipal || '';
            alturaCm.value = d.alturaCm || '';
            precioEstimado.value = d.precioEstimado || '';
            nivelRiego.value = d.nivelRiego || 'Bajo';
            rutaImagen.value = d.rutaImagen || '';
            activo.checked = d.activo === 'true';
            mostrarPreview(rutaImagen.value);
            header.classList.add('bg-warning');
        } else {
            activo.checked = true;
            header.classList.add('bg-info', 'text-white');
        }
    });
});