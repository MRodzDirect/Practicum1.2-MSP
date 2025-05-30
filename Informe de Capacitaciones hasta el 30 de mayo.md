# Informe de Capacitaciones: Aprende a desarrollar y desplegar microservicios en la nube, utilizando el framework Spring

**Participante**: Marco Abarca Rodriguez  
**Fecha del Informe**: 29 de mayo de 2025  
**Período Cubierto**: Semana del 23 al 29 de mayo de 2025
**Institución/Empresa**: UTPL - DEPARTAMENTO DE CIENCIAS DE LA COMPUTACION Y ELECTRONICA

## 1. Introducción
Este informe detalla el progreso, actividades y resultados obtenidos durante el curso "Aprende a desarrollar y desplegar microservicios en la nube, utilizando el framework Spring". El curso tiene como objetivo desarrollar habilidades en la creación y despliegue de microservicios utilizando Spring Boot y Spring Cloud, con un enfoque en la arquitectura de microservicios para aplicaciones escalables y modernas. Se imparte en modalidad en línea y tiene una duración de aproximadamente 8 semanas.

## 2. Progreso del Curso
- **Módulos Completados**: Módulo 1: Fundamentos sobre servicios web, Módulo 2: Microservicios y Spring Boot  
- **Porcentaje de Avance**: 9 videos de 109 completos. (8.26%)
- **Fechas Clave**:  
  - Inicio del curso: 16/05/2025
  - Finalización de módulos: Módulo 1 completado el 20 de mayo de 2025, Módulo 2 completado el 29 de mayo de 2025.
  - Próximos hitos: Módulo 3 a completarse el 5 de junio de 2025

## 3. Actividades y Proyectos Realizados
- - Durante el período cubierto, se realizaron las siguientes actividades:  
    - **Actividad 1**: Configuración del entorno de desarrollo con Eclipse IDE y MariaDB (por compatibilidad con mi arquitectura), incluyendo la instalación de dependencias necesarias para Spring Boot.  
    - **Actividad 2**: Resolución de ejercicios introductorios sobre servicios web REST y conceptos básicos de microservicios.  
    - Proyecto Principal: Desarrollo de un microservicio básico utilizando Spring Boot.  
      - **Descripción**: Creación de un microservicio REST simple que permite gestionar una lista de libros, con operaciones CRUD básicas (Crear, Leer, Actualizar, Eliminar).  
      - **Estado**: En progreso, endpoints básicos implementados.  
      - **Enlace/Referencia**: Código disponible en un repositorio de GitHub (enlace a crear tras consolidar el proyecto).

## 4. Resultados y Aprendizajes
- **Conocimientos Adquiridos**: Comprensión de los fundamentos de servicios web REST, conceptos clave de la arquitectura de microservicios, y uso básico de Spring Boot para crear aplicaciones modulares.  
- **Habilidades Desarrolladas**: Configuración de entornos de desarrollo con Spring Boot, escritura de endpoints REST básicos, y conexión con bases de datos relacionales (MariaDB) usando JPA.  
- **Resultados Medibles**: Finalización exitosa de los módulos 1 y 2 con ejercicios completados al 100%.  
- **Aplicación Práctica**: Los conocimientos adquiridos se aplicarán en el desarrollo de aplicaciones backend modulares para proyectos académicos y profesionales en UTPL, mejorando la escalabilidad de sistemas.

## 5. Desafíos y Soluciones
- **Desafío**: Error durante la instalación de Eclipse IDE: "Not all files were found, make sure you have installed the full program".  
- **Solución**: Se editó el registro en regedit.msc para permitir la descompresión de archivos en rutas extensas, resolviendo el problema tras 10 minutos adicionales de configuración.  
- **Desafío**: Adaptación de herramientas a un sistema arm64, ya que MySQL y Workbench no eran completamente compatibles.  
- **Solución**: Se optó por instalar MariaDB y DBeaver, equivalentes compatibles con arm64, completando la configuración en 15 minutos.

## 6. Conclusión y Próximos Pasos
- El curso ha permitido avanzar significativamente en el desarrollo de aplicaciones backend utilizando Spring Boot y en la comprensión de la arquitectura de microservicios. Los conocimientos adquiridos son directamente aplicables a proyectos de desarrollo de software en UTPL, especialmente en sistemas escalables y basados en la nube. Los próximos pasos incluyen:  
  - Completar Módulo 3: APIs REST antes del 5 de junio de 2025.  
  - Finalizar el proyecto principal de desarrollo de un microservicio CRUD antes del 15 de junio de 2025.

## 7. Anexos
- Bitácora: Comparativa NetBeans vs. Eclipse para proyectos Spring Boot.  

- Configuración del entorno:  

  - Instalacion del IDE y setup inicial (30 min, por que probe que tal funciona en comparacion a NetBeans) -> Ver Bitacora - Netbeans VS Eclipse para el proyecto Spring Boot


  <img src=".\assets\images\image-20250529103556749.png" alt="image-20250529103556749" style="zoom:50%;" />

  

  ✔️Compatible para mi sistema en arm64.

  <img src=".\assets\images\image-20250529121141600.png" alt="image-20250529121141600" />

  * Errores con la instalacion (+10 min):

    * "Not all files were found, make sure you have installed the full program".
    * Solucion: Editar este registro en regedit.msc para que permita archivos descomprimidos en rutas extensas

    <img src=".\assets\images\image-20250529112345449.png" alt="image-20250529112345449" />

  * Instalación del SQL e IDE (15 min)

    

    -  Para mi caso utilize aplicaciones mejores compatibles con mi sistema arm64: MariaDB y DBeaver, los cuales con equivalentes a MySQL y Workbench

​	<img src=".\assets\images\image-20250529111202302.png" alt="image-20250529111202302" />



<img src=".\assets\images\image-20250529111439559.png" alt="image-20250529111439559" />

- [Código fuente del microservicio en progreso: enlace a GitHub pendiente de crear].