# Informe de Actividades: Instalacion del Sistema Operativo Manjaro / Arch Linux

**Participantes**: Marco Abarca Rodriguez, Leonardo Mendieta, Javier Montaño, Carlos Sanchez  
**Fecha del Informe**: 7 de junio de 2025
**Período Cubierto**: Semana del 30 de mayo al 6 de Junio de 2025
**Institución/Empresa**: UTPL - DEPARTAMENTO DE CIENCIAS DE LA COMPUTACION Y ELECTRONICA

## 1. Introducción

Este informe detalla el progreso, actividades y resultados obtenidos tras respaldar, recuperar, particionar, formatear y reinstalar Windows 11 pro en nuestras maquinas, todo esto con el objetivo de descargar e instalar Manjaro como opcion de  Dual Boot junto a Windows. Trabajamos todos los miembros de Practicum 1.2 y nos ayudamos para conseguir todo el procedimiento con minima o nula perdida de datos. Lo realizamos presencialmente en la Universidad y demoramos en total 40 horas.

## 2. Progreso de la actividad

- **Instalaciones Completadas**: En la PC de Leonardo, de Javier.  
- **Porcentaje de Avance**: (100%)
- **Fechas Clave**:  
  - Inicio de las actividades: 30/05/2025
  - Finalización de módulos: 
    - Instalacion en las maquinas de ambos compañeros completadas el 4 y 6 de Junio de 2025 respectivamente.
    - Instalacion en las maquinas de Carlos Sanches y mi persona Marco Abarca completadas el 14 y 26 de Junio de 2025 respectivamente.
  - Próximos hitos: Nada mas al respecto...

## 3. Actividades y Proyectos Realizados

- - Durante el período cubierto, se realizaron las siguientes actividades:  
    - **Actividad 1**: Respaldo completo del sistema operativo y/o particiones enteras del Disco Local. 
    - **Actividad 2**: Instalación del Windows 11 pro para aprovechar mejoras en las tecnologias de virtualizacion que podemos usar en algun momento del proyecto.  
    - Proyecto Principal: Instalación del Sistema Operativo basado en Arch para obtener una compatibilidad total con las herramientas de trabajo que utilizaremos a traves de todo el Practicum 1.2 .  
      - **Descripción**: Para cada PC los metodos de instalacion variaron significativamente, es por ello que incluyo dentro de la carpeta : " " las experiencias y configuraciones personales que tuvimos que ajustar al detalle para conseguir un estado funcional de nuestro OS (Manjaro / Arch Linux) sin perder información de nuestro sistema Windows.
      - **Estado**: Completado
      - 👁️**Enlace/Referencia**:
        - [Instalacion - Marco A. (Linux Arch)](https://github.com/MRodzDirect/Practicum1.2-MSP/Practicum1.2-MSP/Bitacoras/Actividades/Instalacion - Marco A. (Linux Arch).md)
        - [Instalacion - Leonardo M. (Manjaro)](https://github.com/MRodzDirect/Practicum1.2-MSP/Practicum1.2-MSP/Bitacoras/Actividades/Instalacion - Leonardo M. (Manjaro).md)
        - [Instalacion - Javier M. (Manjaro)](https://github.com/MRodzDirect/Practicum1.2-MSP/Practicum1.2-MSP/Bitacoras/Actividades/Instalacion - Javier M. (Manjaro).md)
        - [Instalacion - Carlos S. (Linux Arch)](https://github.com/MRodzDirect/Practicum1.2-MSP/Practicum1.2-MSP/Bitacoras/Actividades/Instalacion - Carlos S. (Linux Arch).md)

## 4. Resultados y Aprendizajes

- **Conocimientos Adquiridos**: Particionamiento, Respaldos en unidades externas, descarga del .ISO o imagen de instalacion, Flasheo en un USB con Rufus / Ventoy, definicion y asignacion de la Tabla de Particiones (root , home , swap), puntos de montaje en un Sistema de archivos basado en Linux, Configuracion del Bootloader GRUB, arreglos de Dual Boot con Windows, actualizacion del sistema y seleccion de componentes / librerias .
- **Habilidades Desarrolladas**: Configuración de sistemas operativos basados en Linux, escritura de la tabla de particiones ( ``/etc/fstab``  ); búsqueda, investigacion avanzada de imagenes compatibles con plataformas poco populares (arquitectura ARM64).  
- **Resultados Medibles**: Instalación exitosa de Arch Linux en 2 maquinas y Manjaro en las 2 restantes.  
- **Aplicación Práctica**: Los conocimientos adquiridos se aplicarán en el desarrollo y depuración de aplicaciones backend modulares para proyectos académicos y preprofesionales en UTPL, mejorando la escalabilidad de sistemas y la configuración de las mismas.

## 5. Desafíos y Soluciones

- **Desafío**: Error durante la instalación de Arch Linux en ARM64: Al arrancar la maquina, toma 2 segundos y se apaga de inmediato
- **Solución**: Se agregaron los archivos binrarios del arbol-kernel para el dispositivo: fueron copiados desde una instalacion exitosa hasta los directorios: ``lib/firmware/`` y `/boot` para permitir la correcta gestion y asignacion del kernel respecto a los modulos con los que enciende el  disco inicial de arranque (``initrd``), resolviendo el problema y aperturando la posibilidad a encender Arch-Linux sin necesidad de un script-auxiliar ``Arch-Chroot`` ejecutado desde otra particion con Ubuntu ARM64.  Se lo pudo resolver en en 2 horas.
- **Desafío**: Error durante la instalación de Windows 11 Pro: "Couldn't Find Storage Driver Load Error in Windows Install"  
- **Solución**: Se siguio la guia a continuacion: [Guia](https://youtu.be/XwrjABFHaJ0)  y se lo pudo resolver en en 20 minutos
- **Desafío**: Error durante la instalación de Windows 11 Pro: "Could not locate 'efi\boot\bootx64.efi "  
- **Solución**: Se siguio la guia a continuacion: [Guia](https://youtu.be/lFqXK08DuhU)  y se lo pudo resolver en en 22 minutos.
- **Desafío**: Pantalla negra de login para Gnome en Linux
- **Solución**: Se siguio la guia a continuacion: [Guia](https://youtu.be/lFqXK08DuhU)  y se lo pudo resolver en en 5 minutos. [Guia](https://www.youtube.com/watch?v=dr5TdjIneFo)

* Entre muchos otros mas documentados en cada Bitácora especifica

## 6. Conclusión y Próximos Pasos

* En resumen, el proyecto realizado durante el Practicum 1.2 ha sido un éxito significativo en la instalación y configuración de un sistema de arranque dual con Windows 11 Pro y Manjaro/Arch Linux. Gracias al trabajo colaborativo y la dedicación de todos los miembros, se lograron respaldar, particionar y reinstalar los sistemas operativos sin pérdida de datos, superando diversos desafíos técnicos complejos.

  

  * El proceso permitió adquirir valiosos conocimientos y habilidades prácticas en particionamiento, manejo de imágenes ISO, configuración de bootloaders y resolución de problemas específicos relacionados con arquitecturas ARM64 y errores comunes en instalaciones. Además, la experiencia obtenida fortalece la capacidad para implementar soluciones eficientes en entornos reales y prepara al equipo para futuros desarrollos académicos y profesionales en el ámbito de sistemas operativos y backend modular.
  * Finalmente, la documentación detallada de cada paso y solución adoptada garantiza que este conocimiento sea accesible para futuras referencias, consolidando una base sólida para el aprendizaje continuo y la innovación tecnológica en la Universidad Técnica Particular de Loja.