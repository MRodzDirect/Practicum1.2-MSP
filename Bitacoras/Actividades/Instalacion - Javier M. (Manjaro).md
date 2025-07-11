---
# typora-copy-images-to: ../../assets/images(arch-linux-mar)
typora-root-url: ../../assets/images(arch-linux-mar)
---

# Bitácora: Instalación y Configuración de Manjaro XFCE en Lenovo Legion 5 15IMH05

## Especificaciones del Equipo

- **Modelo**: Lenovo Legion 5 15IMH05
- **Sistema Operativo Original**: Windows 11
- **Procesador**: Intel® Core™ i7-10750H CPU @ 2.60 GHz (2.59 GHz)
- **RAM Instalada**: 8.00 GB

## 1. Liberación y Reducción de Espacio en Windows 11

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.001.png)

**Estado inicial del espacio en disco.** Se realizaron las siguientes acciones para liberar espacio:

- **Eliminación de aplicaciones no esenciales**: Se desinstalaron mediante la interfaz de Windows y comandos específicos.

- **Limpieza de archivos temporales**: Utilizando el Liberador de Espacio en Disco y Configuración de Almacenamiento.

- **Desinstalación de juegos y software preinstalado**: Realizado desde el Panel de Control.

- Reducción de la partición principal

  : Gestionada desde Administración de Discos de Windows.

  - **Espacio asignado para Manjaro**: Aproximadamente 80 GB.
  - **Tipo de partición**: No asignada (posteriormente configurada como ext4).

### Archivos temporales eliminados:

- Archivos de instalación de Windows.
- Archivos de actualizaciones.
- Contenido de la Papelera de Reciclaje.
- Miniaturas.
- Archivos temporales de aplicaciones.

**Resultado**: Liberación de aproximadamente **10 GB**.

### Desinstalación de aplicaciones pesadas:

Se desinstalaron aplicaciones innecesarias, logrando liberar **15 GB** adicionales.

### Liberación de espacio en disco:

1. Acceder al Liberador de Espacio en Disco mediante **Windows + S**.
2. Seleccionar la unidad **C:**.
3. Limpiar archivos del sistema y seleccionar todas las opciones permitidas.
   **Resultado**: Liberación de **3 GB** adicionales.

### Liberación de archivos en la nube:

Se sincronizaron archivos con **OneDrive** y **Dropbox**, recuperando espacio adicional.

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.002.jpeg)

## 2. Creación del USB de Instalación

- **Descarga de la ISO**: Se obtuvo la imagen de **Manjaro XFCE** desde el sitio oficial.
- **Creación del USB booteable**: Usando **Rufus** en modo **GPT + UEFI**.
- **Verificación de integridad**: Completada exitosamente.

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.003.jpeg)

## 3. Particionado del Disco

- Acceso a **Administración de Discos**.
- Reducción del volumen existente.
- Creación de una nueva partición con el espacio liberado.
- Asignación de letra de unidad y nombre (sin definir).

## 4. Actualización de Windows 11 Home a Windows 11 Pro

- Actualización realizada para optimizar el rendimiento de Manjaro en dual boot (obteniendo mayor cantidad de almacenamiento para realizar la instalacion, y una posibilidad a correr aplicaciones en un entorno virtual sin comprometer el estado o la seguridad del sistema oficial de Manjaro).

-  Para esto compilamos (con ayuda de mis compa;eros ) e instalamos una version especifica de Windows 11 pro que permite aprovechar:

  - Tecnologias de Virtualizacion Acelerada: Hyper-V
  - Encrypcion de ultimo estandar Bit-Locker
  - Creacion y exportacion de maquinas virtuales y contenedores dentro de Windows 11.
  - Plan B en caso de que Manjaro deje de funcionar o sea corrompido por algun comando o error cometido de parte mia (puedo migrar todo el proyecto hacia Windows 11 Pro en una VM sin problemas).

  
  
  **Compilacion (Micro Win 11) y manejo de errores:**
  
  ![IMG_20250605_151906](../../assets/images(manjaro-javier)/IMG_20250605_151906.jpg)
  
  ![IMG_20250605_164023](../../assets/images(manjaro-javier)/IMG_20250605_164023.jpg)
  
  
  
  **Proceso de instalacion:**
  
  ![IMG_20250605_165554](../../assets/images(manjaro-javier)/IMG_20250605_165554.jpg)
  
  ![IMG_20250605_165623](../../assets/images(manjaro-javier)/IMG_20250605_165623.jpg)
  
  ![IMG_20250605_165745](../../assets/images(manjaro-javier)/IMG_20250605_165745.jpg)
  
  ![IMG_20250605_165857](../../assets/images(manjaro-javier)/IMG_20250605_165857.jpg)
  
  ![IMG_20250605_165859](../../assets/images(manjaro-javier)/IMG_20250605_165859.jpg)
  
  ![IMG_20250605_165912](../../assets/images(manjaro-javier)/IMG_20250605_165912.jpg)
  
  ![IMG_20250605_170249](../../assets/images(manjaro-javier)/IMG_20250605_170249.jpg)
  
  ![IMG_20250605_170403](../../assets/images(manjaro-javier)/IMG_20250605_170403.jpg)
  
  ![IMG_20250605_170448](../../assets/images(manjaro-javier)/IMG_20250605_170448.jpg)
  
  ![IMG_20250605_170449](../../assets/images(manjaro-javier)/IMG_20250605_170449.jpg)
  
  ![IMG_20250605_171333](../../assets/images(manjaro-javier)/IMG_20250605_171333.jpg)
  
  ![IMG_20250605_171333_1](../../assets/images(manjaro-javier)/IMG_20250605_171333_1.jpg)
  
  ![IMG_20250605_171334](../../assets/images(manjaro-javier)/IMG_20250605_171334.jpg)
  
  ![IMG_20250605_171524](../../assets/images(manjaro-javier)/IMG_20250605_171524.jpg)
  
  ![IMG_20250605_171537](../../assets/images(manjaro-javier)/IMG_20250605_171537.jpg)
  
  ![IMG_20250605_171755](../../assets/images(manjaro-javier)/IMG_20250605_171755.jpg)
  
  ![IMG_20250605_171820](../../assets/images(manjaro-javier)/IMG_20250605_171820.jpg)
  
  ![IMG_20250605_171838](../../assets/images(manjaro-javier)/IMG_20250605_171838.jpg)
  
  ![IMG_20250605_172014](../../assets/images(manjaro-javier)/IMG_20250605_172014.jpg)
  
  ![IMG_20250605_135047](../../assets/images(manjaro-javier)/IMG_20250605_135047.jpg)
  
  ![IMG_20250605_142510](../../assets/images(manjaro-javier)/IMG_20250605_142510.jpg)
  
  

## 5. Instalación de Manjaro Linux XFCE

- Configuración del BIOS/UEFI

  :

  - Desactivación de **Secure Boot**.
  - Prioridad de arranque asignada al USB.

- Desde el Live USB

  :

  - Ejecución del instalador **Calamares**.
  - Particionado manual:
    - Partición raíz (**/**): ext4, 70 GB.
    - Partición **swap**: 4 GB (sin hibernación).
  - Mantenimiento del dual boot con Windows.

- Instalación completada y reinicio exitoso.

![Pantalla de un teléfono celular](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.004.jpeg)

![Pantalla de computadora encendida](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.005.jpeg)

![Manjaro Linux 25 ](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.006.jpeg)

## 6. Configuraciones e Instalaciones mediante Terminal

### Visual Studio Code

- Actualización del sistema

  :

  ```bash
  sudo pacman -Syu
  ```

- Instalación de VS Code

  :

  ```bash
  sudo pacman -S code
  ```

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.007.jpeg)

### Google Chrome

- **Instalación de YAY (AUR helper)**:

  ```bash
  sudo pacman -S yay
  ```

  ![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.008.jpeg)

- **Error en la instalación**: Problema con el paquete **base-devel** (falta de **fakeroot**).

  - Solución

    :

    ```bash
    sudo pacman -S base-devel
    ```

  ![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.012.jpeg)

- Instalación exitosa de **Google Chrome** tras resolver dependencias.

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.018.jpeg)

### Node.js 18 y npm

- **Intento inicial**:

  ```bash
  sudo pacman -Sy nodejs-lts-fermium npm
  ```

  Error: Paquete **nodejs-lts-fermium** no disponible en los repositorios.
  ![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.019.jpeg)

- **Solución con NVM**:

  1. Instalación de 

     nvm

     :

     ```bash
     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
     source ~/.bashrc
     ```

  2. Verificación de 

     nvm

     :

     ```bash
     nvm --version
     ```

  3. Instalación y configuración de Node.js 18:

     ```bash
     nvm install 18
     nvm use 18
     nvm alias default 18
     ```

  ![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.021.jpeg)

### Git 2.49.0

- Instalación

  :

  ```bash
  sudo pacman -S git
  ```

- Verificación

  :

  ```bash
  git --version
  ```

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.023.jpeg)

## 7. Cambio de Idioma y Problemas Iniciales

- Intento de cambio de idioma a español desde el gestor de configuración de XFCE.

- Error

  : Ejecución accidental de 

  ```
  exec startxfce4
  ```

  , causando una pantalla negra.

  - Síntomas:
    - Imposibilidad de volver a la terminal principal.
    - Cambio de interfaz a GNOME.
    - Fallos en los menús y carga del entorno.

## 8. Problemas con LightDM y Cambio a GNOME

- **Solución intentada**:

  ```bash
  sudo pacman -S gdm gnome
  sudo systemctl disable lightdm
  sudo systemctl enable gdm
  sudo reboot
  ```

- **Resultado**: Pantalla negra persistente.

- **Reinstalación de XFCE**:

  ```bash
  sudo pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
  sudo systemctl enable lightdm
  sudo systemctl disable gdm
  sudo reboot
  ```

## 9. Pantalla Negra en Manjaro XFCE

- **Causa posible**: Configuración incorrecta o scripts de inicio defectuosos.

- **Solución intentada**:

  1. Acceso a TTY con **Ctrl+Alt+F2**.

  2. Revisión de 

     ```
     /etc/locales.conf
     ```

     :

     ```bash
     sudo nano /etc/locales.conf
     ```

  3. Corrección de configuraciones erróneas y regeneración de locales:

     ```bash
     sudo locale-gen
     sudo localectl set-locale LANG=es_ES.UTF-8
     sudo rm -f /etc/locales.conf
     ```

  4. Reinstalación de XFCE y LightDM:

     ```bash
     sudo pacman -Syu xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
     sudo systemctl enable lightdm
     sudo systemctl start lightdm
     ```

- **Error persistente**: Pantalla negra debido a un script en `~/.bashrc` ejecutando `/etc/locales.conf`.

  - Corrección

    :

    ```bash
    nano ~/.bashrc
    sudo rm -f /etc/locales.conf
    sudo locale-gen
    sudo localectl set-locale LANG=es_ES.UTF-8
    ```

- **Reinstalación de LightDM**:

  ```bash
  sudo pacman -S lightdm lightdm-gtk-greeter
  sudo systemctl disable gdm
  sudo systemctl enable lightdm
  sudo systemctl start lightdm
  ```

- **Resultado**: Persistencia de la pantalla negra, retorno a GNOME con:

  ```bash
  sudo systemctl start gdm
  ```

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.024.jpeg)

## 10. Corrección de Archivos .desktop

- **Error**: Archivos `.desktop` en `~/.config/autostart` referenciaban ejecutables inexistentes.

- **Solución**:

  ```bash
  cat ~/.xsession-errors
  journalctl -xe | grep Xfce
  mkdir -p ~/.config/autostart-backup
  mv ~/.config/autostart/xfce4-* ~/.config/autostart-backup/
  startxfce4
  sudo pacman -S xorg-xinit
  sudo systemctl restart lightdm
  ```

- **Resultado**: Persistencia de la pantalla negra. Se optó por trabajar en GNOME.

## 11. Restablecimiento de Idioma

- Configuración del idioma a español:

  ```bash
  sudo localectl set-locale LANG=es_EC.UTF-8
  sudo locale-gen
  ```

## 12. Conexión a Red Wi-Fi (Eduroam)

- **Problema**: Conexión automática fallida.

- Solución

  :

  1. Acceso al menú de red.
  2. Selección de la red **eduroam**.
  3. Configuración:
     - **Wi-Fi security**: WPA & WPA2 Enterprise
     - **Authentication**: Protected EAP (PEAP)
     - **Anonymous identity**: (Vacío)
     - **Domain**: (Opcional, ej. utpl.edu.ec)
     - **CA certificate**: No requerido o certificado institucional.
     - **Inner authentication**: MSCHAPv2
     - **Username**: Correo institucional (ej. [jdmontano2@utpl.edu.ec](mailto:jdmontano2@utpl.edu.ec))
     - **Password**: Contraseña institucional.

![Imagen cargada](../../assets/images(manjaro-javier)/Aspose.Words.16616b24-454d-4237-9dc3-c2161c0c08f1.026.jpeg)
