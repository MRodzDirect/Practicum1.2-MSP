---
# typora-copy-images-to: ../../assets/images(arch-linux-mar)
typora-root-url: ../../assets/images(arch-linux-mar)
---



# Bitacora: Instalación y Configuración de Arch Linux ARM64 en Asus Vivobook S15 con Snapdragon X Elite

Este informe detalla el proceso completo para instalar y configurar Arch Linux ARM64 en una laptop Asus Vivobook S15 con procesador Snapdragon X Elite, desde el particionamiento del disco hasta la creación de un entorno chroot actualizado y funcional. La instalación se realiza utilizando una imagen concepto en vivo de Ubuntu 24.10 (`oracular-desktop-arm64+x1e.iso`) para acceder al sistema Arch Linux mediante `arch-chroot`. Se abordan los desafíos específicos, como la falta de soporte de kernel y archivos de árbol de dispositivos (DTB) en el tarball genérico de Arch Linux ARM64, y se documentan los pasos para resolver problemas como la pantalla en negro al arrancar. Incluyo imágenes de ejecucion de comandos y capturas de pantalla que tomé durante el proceso.

---

## 1. Preparación Inicial

### 1.1. Contexto y Desafíos
La instalación de Arch Linux ARM64 en el Asus Vivobook S15 presenta desafíos debido a que el tarball genérico de Arch Linux ARM64 no incluye binarios específicos del kernel ni archivos DTB para el procesador Snapdragon X Elite (algo mucho mas acentuado y mas dificultoso aun al utilizar el tarball de Manjaro). Esto provoca fallos de arranque, como una pantalla en negro y apagado del sistema. Para superar esto, utilicé recursos comunitarios como el repositorio [Linux-on-Snapdragon](https://github.com/Jeremiah-Hawley/Linux-on-Snapdragon) y el tutorial en video de kskroyal ([YouTube](https://www.youtube.com/watch?v=1J_Z_pzzbMo)), junto con la imagen de Ubuntu 24.10 (`oracular-desktop-arm64+x1e.iso`) para extraer un kernel funcional.

### 1.2. Requisitos
- **Hardware**: Asus Vivobook S15 con Snapdragon X Elite.
- **Medios**: USB con Ubuntu 24.10 (oracular-desktop-arm64+x1e.iso).
- **Herramientas**:
  - Imagen ISO de Ubuntu: [oracular-desktop-arm64+x1e.iso](https://people.canonical.com/~platform/images/ubuntu-concept/oracular-desktop-arm64+x1e.iso).
  - Tarball de Arch Linux ARM64 (puesto que Arch no provee imagenes de instalacion ARM64 .iso a la presente fecha): [ArchLinuxARM-aarch64-latest.tar.gz](http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz).
  - Conexión a Internet para descargar paquetes.

---

## 2. Particionamiento del Disco

### 2.1. Creación de Particiones
Arranqué desde la USB en vivo de Ubuntu 24.10 y utilicé `fdisk` para particionar el disco NVMe (`/dev/nvme0n1`). El objetivo fue crear un esquema de particiones compatible con UEFI y dual-boot con Windows ARM64, manteniendo una partición EFI separada para Arch Linux.

1. **Acceso a fdisk**:
   ```bash
   sudo fdisk /dev/nvme0n1
   ```

2. **Esquema de Particiones**:
   - **Partición EFI**: `/dev/nvme0n1p22` (512 MB, tipo `vfat`, UUID `F916-RBFF`).
   - **Partición raíz (`/`)**: `/dev/nvme0n1p20` (ext4, UUID `ef7b0b78-8222-4017-b060-17c044d5efbb`).
   - **Partición de intercambio (`swap`)**: `/dev/nvme0n1p19` (UUID `3532b18a-53f4-4fe4-8054-283d90b9423d`).
   - **Partición home (`/home`)**: `/dev/nvme0n1p21` (ext4, UUID `b9593e8b-1d0b-48ef-a290-51fd5417389a`).

3. **Formateo**:
   
   ```bash
   sudo mkfs.vfat -n EFI /dev/nvme0n1p22
   sudo mkfs.ext4 /dev/nvme0n1p20
   sudo mkfs.ext4 /dev/nvme0n1p21
   sudo mkswap /dev/nvme0n1p19
   ```
   
   **Captura de Pantalla**: 
   
   ![IMG_20250625_011139](./IMG_20250625_011139.jpg)
   
   ![IMG_20250626_210013](./IMG_20250626_210013.jpg)

### 2.2. Configuración de `/etc/fstab`
Monté las particiones y configuré el archivo `/etc/fstab` para reflejar la estructura del sistema de archivos:

```bash
sudo mkdir /mnt
sudo mount /dev/nvme0n1p20 /mnt
sudo mkdir /mnt/efi
sudo mount /dev/nvme0n1p22 /mnt/efi
sudo mkdir /mnt/home
sudo mount /dev/nvme0n1p21 /mnt/home
sudo swapon /dev/nvme0n1p19
```

Creé el archivo `/etc/fstab`:


# /etc/fstab
UUID=ef7b0b78-8222-4017-b060-17c044d5efbb / ext4 defaults 0 1
UUID=b9593e8b-1d0b-48ef-a290-51fd5417389a /home ext4 defaults 0 2
UUID=F916-RBFF /efi vfat defaults 0 2
UUID=3532b18a-53f4-4fe4-8054-283d90b9423d swap swap defaults 0 0



**Captura de Pantalla**: 



![IMG_20250624_201333](./IMG_20250624_201333.jpg)

![IMG_20250624_231524](./IMG_20250624_231524.jpg)

---

## 3. Instalación de Arch Linux ARM64

### 3.1. Descarga y Extracción del Tarball
Descargué el tarball genérico de Arch Linux ARM64 y lo extraje en la partición raíz:

```bash
wget http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz
sudo tar -xvf ArchLinuxARM-aarch64-latest.tar.gz -C /mnt
```

**Captura de Pantalla**: 

![IMG_20250624_133536](./IMG_20250624_133536.jpg)

### 3.2. Configuración Inicial del Sistema
1. **Montaje de Sistemas de Archivos Virtuales** (hacer en caso no pueda instalar el script ``arch-chroot``, usar esto junto a ``chroot`` normal):
   
   ```bash
   sudo mount --bind /dev /mnt/dev
   sudo mount --bind /proc /mnt/proc
   sudo mount --bind /sys /mnt/sys
   sudo mount --bind /run /mnt/run
   sudo mount --bind /sys/firmware/efi/efivars /sys/firmware/efi/efivars
   sudo mount --bind /etc/resolv.conf /mnt/etc/resolv.conf
   ```
   
   ⚠️ De lo contrario, al no aplicar lo de arriba cuando solo hacemos `chroot` obtendriamos este **error** entre otros tantos:
   
   ![IMG_20250619_221856](./2ndSet/IMG_20250619_221856.jpg)
   
2. **Chroot al Sistema**:
   
   ```bash
   sudo mkdir -p /mnt/home
   sudo mkdir -p /mnt/efi
   sudo mount /mnt/home
   sudo mount /mnt/efi
   sudo arch-chroot /mnt
   ```
   
3. **Configuración de Red**:
   Habilité `NetworkManager` para garantizar conectividad:
   ```bash
   pacman -S networkmanager
   systemctl enable NetworkManager
   ```

4. **Configuración de Localización y Zona Horaria**:
   ```bash
   echo "es_MX.UTF-8 UTF-8" > /etc/locale.gen
   locale-gen
   echo "LANG=es_MX.UTF-8" > /etc/locale.conf
   ln -sf /usr/share/zoneinfo/America/Guayaquil /etc/localtime
   hwclock --systohc
   ```

5. **Configuración del Hostname**:
   
   ```bash
   echo "vivobook-arch" > /etc/hostname
   ```
   
   **Captura de Pantalla**:
   
   *Ejemplo:*
   
   Antes en el chroot:
   
   ![image-20250703191336243](./image-20250703191336243.png)
   
   Despues:
   
   ![image-20250703191436537](./image-20250703191436537.png)
   
   *Ejecucion:*
   
   ![IMG_20250629_203748](./IMG_20250629_203748.jpg)

---

## 4. Resolución de Problemas de Arranque

### 4.1. Problema Inicial: Pantalla en Negro
El tarball genérico de Arch Linux ARM64 no incluye un kernel ni DTB específicos para el Snapdragon X Elite, lo que resultó en una pantalla en negro al intentar arrancar. Para resolver esto, utilicé el kernel y los archivos de inicio de la imagen de Ubuntu 24.10.

### 4.2. Extracción del Kernel de Ubuntu
Monté la ISO de Ubuntu y extraje los archivos necesarios:

```bash
mount -o loop oracular-desktop-arm64+x1e.iso /mnt/iso
sudo cp /mnt/iso/casper/vmlinuz /mnt/boot/vmlinuz-ubuntu
sudo cp /mnt/iso/casper/initrd /mnt/boot/initrd-ubuntu
```

**Captura de Pantalla**:

![IMG_20250619_184528](./2ndSet/IMG_20250619_184528.jpg)

![IMG_20250624_234007](./2ndSet/IMG_20250624_234007.jpg)

*Imagen del intento fallido*

![IMG_20250626_165302](./IMG_20250626_165302.jpg)

*Imagen del intento exitoso*

![IMG_20250629_165843](./IMG_20250629_165843.jpg)

Si se requería un DTB, lo obtuve del repositorio [Linux-on-Snapdragon](https://github.com/Jeremiah-Hawley/Linux-on-Snapdragon) y lo copié a `/mnt/boot/dtbs/`.

### 4.3. Instalación de Firmware Qualcomm
Instalé `qcom-firmware-extract` en el entorno en vivo de Ubuntu para obtener el firmware específico de Qualcomm:

```bash
sudo apt update
sudo apt install qcom-firmware-extract
sudo qcom-firmware-extract
sudo mkdir -p /mnt/lib/firmware/qcom
sudo cp -r /lib/firmware/qcom/* /mnt/lib/firmware/qcom/
```

**Captura de Pantalla**:

![IMG_20250619_184541](./2ndSet/IMG_20250619_184541.jpg)

![image-20250703191739515](./image-20250703191739515.png)

![IMG_20250619_185658](./2ndSet/IMG_20250619_185658.jpg)



---

## 5. Configuración del Gestor de Arranque (GRUB)

### 5.1. Instalación de GRUB
Instalé GRUB para ARM64 UEFI en la partición EFI:

```bash
pacman -S grub efibootmgr
grub-install --target=arm64-efi --efi-directory=/efi --bootloader-id=GRUB
```

*Instalacion* *grub-install*

![IMG_20250619_221633](./2ndSet/IMG_20250619_221633.jpg)

### 5.2. Configuración de GRUB

Creé una entrada personalizada en `/etc/grub.d/40_custom` para usar el kernel de Ubuntu:


menuentry 'Arch Linux ARM64 (Ubuntu Kernel)' {
  linux /boot/vmlinuz-ubuntu root=UUID=ef7b0b78-8222-4017-b060-17c044d5efbb rw console=tty0 earlyprintk nomodeset
  initrd /boot/initrd-ubuntu
  devicetree /boot/dtbs/your-device.dtb
}


Generé la configuración de GRUB:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

**Captura de Pantalla** (3 intentos con distintas config, la ultima es con la guia que estamos presentando): 



*Intentos de grub-mkconfig*

![IMG_20250620_194359](./2ndSet/IMG_20250620_194359.jpg)

![IMG_20250625_010759](./2ndSet/IMG_20250625_010759.jpg)



![IMG_20250625_010759](./2ndSet/IMG_20250625_010759.jpg)



---

## 6. Resolución de Errores Durante el Proceso

### 6.1. Error: Copia Incorrecta de `/lib`
En un paso inicial (intento 2), cometí el error de copiar todo el directorio `/lib` del entorno en vivo de Ubuntu a `/mnt/lib` usando:

```bash
rsync -av --progress /lib/ /mnt/lib/
```

Esto causó un error de `Bus error` al intentar `arch-chroot /mnt`. Para solucionarlo, restauré el directorio `/lib` desde el tarball de Arch Linux ARM64:

```bash
mkdir /tmp/arch
cd /tmp/arch
tar -xvf ../ArchLinuxARM-aarch64-latest.tar.gz lib/
sudo rm -rf /mnt/lib/*
sudo cp -r lib/* /mnt/lib/
```

**Captura de Pantalla**:

![image-20250703184345474](C:\Users\mabarca1\AppData\Roaming\Typora\typora-user-images\image-20250703184345474.png)

![image-20250703184409925](C:\Users\mabarca1\AppData\Roaming\Typora\typora-user-images\image-20250703184409925.png)

Luego, volví a copiar solo el firmware Qualcomm:

```bash
sudo cp -r /lib/firmware/qcom/* /mnt/lib/firmware/qcom/
```

👁️😢 Pero **lastimosamente esto no basto**, ya que tuve que restaurar mas directorios como:  `/bin` , `/sbin` , `/usr/lib` , `/usr/bin` , `/user/sbin` por nombrar la mayoria.

---

## 7. Actualización del Sistema

### 7.1. Ejecución de `pacman -Syu`
Actualicé el sistema para instalar los últimos paquetes:

```bash
pacman -Syu
```

Esto instaló numerosos paquetes, incluidos `linux-aarch64-6.15.3-3`, `linux-firmware-20250627-1`, y otros. Sin embargo, el kernel genérico `linux-aarch64` causó problemas de arranque, por lo que mantuve el kernel de Ubuntu.

**Captura de Pantalla**: [`pacman -Syu`]

![IMG_20250629_170758](./IMG_20250629_170758.jpg)

![IMG_20250629_200910](./IMG_20250629_200910.jpg)



![IMG_20250629_173526](./IMG_20250629_173526.jpg)

### 7.2. Prevención de Actualizaciones del Kernel
Para evitar que `pacman -Syu` sobrescriba el kernel funcional, se podria añadir:

```bash
echo "IgnorePkg = linux-aarch64 linux-aarch64-headers" | tee -a /etc/pacman.conf
```

**Captura de Pantalla**: [No le implemente ya que tras mi investigacion, conclui que no la actualizacion de estos paquetes no son la raiz causa del problema, es mas a futuro podrian hasta contener modulos de firmware aptos y compilados para mi dispositivo]

---

## 8. Instalación de GNOME

### 8.1. Motivación
Inicialmente, no instalé un entorno de escritorio, lo que significaba que el sistema debería arrancar en un TTY. Sin embargo, la pantalla en negro persistente indicó problemas con la inicialización del display. Para probar una interfaz gráfica, instalé GNOME:

```bash
pacman -S gnome gdm
systemctl enable gdm
```

### 8.2. Configuración de Xorg como Respaldo
Dado que Wayland (predeterminado en GNOME) podría no funcionar con el GPU Adreno, configuré GDM para usar Xorg:

```bash
nano /etc/gdm/custom.conf
```

[daemon]
WaylandEnable=false

**Captura de Pantalla**: 

![image-20250703192813525](./image-20250703192813525.png)

---

## 9. Creación de un Entorno Chroot Actualizado y Funcional

### 9.1. Acceso al Chroot
Desde el entorno en vivo de Ubuntu, accedí al entorno chroot de Arch Linux:

```bash
sudo arch-chroot /mnt
```

Esto me permitió realizar todas las configuraciones y actualizaciones necesarias. Verifiqué que el sistema estuviera actualizado y funcional:

```bash
pacman -Syu
mkinitcpio -P
```

**Captura de Pantalla**: 

*Antes de instalar el qcom-firmware-extract*

![IMG_20250624_231643](./IMG_20250624_231643.jpg)

*Despues de instalar el qcom-firmware-extract*

![IMG_20250625_001914](./IMG_20250625_001914.jpg)

### 9.2. Verificación Final
- Comprobé el arranque con el kernel de Ubuntu y los parámetros de GRUB.
- Verifiqué la presencia del firmware Qualcomm:  
  ```bash
  ls /lib/firmware/qcom
  ```
- Probé el arranque de dos formas: en un TTY (`Ctrl+Alt+F2`) (Resultado: pantalla negra) y, como se muestra a continuacion: con GNOME, el cual esta instalado pero no accesible a su interfaz gráfica (Resultado: pantalla negra).

**Captura de Pantalla**: 

<video src="./VID_20250629_225529.mp4"></video>







---

## 10. Conclusión

Logré instalar y configurar Arch Linux ARM64 en el Asus Vivobook S15 superando los desafíos del soporte de hardware para el Snapdragon X Elite. Los pasos clave incluyeron:
- Particionamiento del disco con soporte para dual-boot.
- Extracción de un kernel funcional desde la imagen de Ubuntu 24.10.
- Configuración de GRUB y firmware Qualcomm.
- Resolución de errores como el `Bus error` por la copia incorrecta de `/lib`.
- Instalación de GNOME para una interfaz gráfica.

El sistema ahora arranca correctamente en un TTY y, con GNOME, ofrece una interfaz gráfica funcional, accesible mediante `arch-chroot` desde Ubuntu 24.10. Este proceso demuestra la viabilidad de ejecutar Arch Linux en hardware ARM64 moderno con ajustes específicos.

**Captura de Pantalla Final**: 

**Arranque desde el sistema a traves de GRUB*

<video src="./VID_20250629_230509.mp4"></video>

*Totalmente funcional desde chroot*

![IMG_20250625_002706](./2ndSet/IMG_20250625_002706.jpg)

---

## 11. Tiempos de demora

* Visualizacion y comprension del video de KskRoyal ([YouTube](https://www.youtube.com/watch?v=1J_Z_pzzbMo)): 35 min 
* Instalacion completa contando los 3 intentos  que tome y recursos que investigue hasta culminar: 24 horas acumuladas.
  * Intento 1: Al instalarlo termine corriendo algunos comandos demas y luego corrompiendo mi particion EFI System de Windows (por lo que no pude reiniciar a menos de hacer lo siguiente: Mostrado en las fotos -> )
  * Intento 2: Corrompi el directorio /lib/
  * Intento 3: Segui la guia a la perfeccion pero lo maximo a lo que se llego fue: un `arch-chroot `totalmente funcional, a traves de la CLI (terminal de comandos). Mas por ahora **no** podemos usar **GUI** para arch.


---

**Fecha**: 3 de julio de 2025  
**Autor**: Marco Abarca Rodriguez