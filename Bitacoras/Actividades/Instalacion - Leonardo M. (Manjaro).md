# Bitácora: Instalación y Configuración de Manjaro XFCE en Dell Inspiron

## Especificaciones del Equipo

- **Modelo:** Dell (modelo específico no indicado)  
- **Sistema Operativo Original:** Windows 11 Home  
- **Sistema Operativo Actual:** Windows 11 Pro (después de reinstalación)  
- **Procesador:** Intel® Core™ i7  
- **RAM Instalada:** 8.00 GB  

---

## 1. Problemas con la partición y pérdida del sistema operativo

El proceso comenzó con la intención de instalar Manjaro XFCE en el equipo, pero para ello era necesario crear una partición en el disco. Al no poder desfragmentar correctamente el sistema desde Windows, se intentó realizar una partición forzada, lo cual resultó en la corrupción del sistema operativo Windows 11 Home.

Como consecuencia, fue necesario formatear completamente el equipo. Afortunadamente, se contaba con una copia de seguridad de todos los archivos importantes, por lo que no se perdió información relevante durante este incidente.

![OK](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/Problemas2025-07-16.jpeg)
![ERROR](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/Error2025-07-16.jpeg)
![BitLocker](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/ProblemasBitLocker2025-07-16.jpeg)


---

## 2. Reinstalación de Windows y preparación para Manjaro

Una vez formateado el equipo, se instaló Windows 11 Pro. Con el sistema limpio, se pudo realizar correctamente la partición destinada a Manjaro. Para la creación del USB booteable se utilizó la herramienta **Ventoy** y una imagen **ISO oficial de Manjaro XFCE**.

![Instalando](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/FormateoyDraivers2025-07-16.jpeg)
![Cargando](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/CargandoWindows2025-07-16.jpeg)
![Drivers](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/Drivers.png)
![Particion](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/ParticionCreada2025-07-16.jpeg)

---

## 3. Instalación de Manjaro XFCE

Desde el USB booteable creado con Ventoy, se arrancó el sistema en modo live y se procedió a ejecutar el instalador **Calamares**. Durante el proceso se particionó el disco completamente (sin dual boot) para dejar **Manjaro como único sistema operativo**. La instalación se completó con éxito y el sistema fue iniciado sin problemas desde el disco duro.

![Booteable](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/ManjaroIntentoDeInstalacion2025-07-16.jpeg)

---

## 4. Instalación de herramientas de desarrollo

Tras instalar Manjaro, se procedió con la instalación de las herramientas necesarias para el desarrollo del proyecto:

- **JHipster**  
- **PostgreSQL**  
- **Node.js**  

Estas herramientas fueron configuradas adecuadamente para poder trabajar en la aplicación requerida durante las prácticas.

![Inicio Manjaro](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/ManjaroInicio2025-07-16.jpeg)
![Instalando Mnajaro](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/InstalandoManjaro12025-07-16.jpeg)
![Instalando Manjaro](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(Leonardo)/InicioManjaro2025-07-16.jpeg)

---

## 5. Digitalización del Formulario 008

Una de las tareas asignadas fue la digitalización del **Formulario 008**, el cual originalmente se encontraba en formato físico. Tomando como base este formulario físico entregado previamente, se diseñó una versión digital en **HTML**. Esta versión fue desarrollada para integrarse directamente como una página dentro de la aplicación principal del proyecto, manteniendo la estructura, campos y diseño del original.

Se utilizó una plantilla basada en el modelo físico y se implementaron funcionalidades dinámicas según requerimientos específicos del formulario, como **campos condicionales** que aparecen en base a la selección de ciertas opciones.

![Formulario 008](https://raw.githubusercontent.com/MRodzDirect/Practicum1.2-MSP/refs/heads/main/assets/images(manjaro-javier)/WhatsApp%20Image%202025-07-11%20at%2011.22.09.jpeg)
