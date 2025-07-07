# Bitácora: Instalación y Configuración de Arch Linux x64 en VICTUS 16 con AMD Ryzen™ 7 8845H

Este informe detalla el proceso completo para instalar y configurar Arch Linux x64 en una laptop VICTUS 16 con procesador AMD Ryzen™ 7 8845H, desde el particionamiento del disco hasta el arranque directo desde grub con un entorno grafico GNOME. La instalación se realiza utilizando una imagen en vivo de Arch Linux (`archlinux-x86_64.iso`) para configurar el sistema. A diferencia de la arquitectura ARM64, el proceso en x64 es más directo, pero requiere atención en configuraciones específicas como `locale-gen` y ajustes de red. Se documentan pasos clave, errores comunes y capturas de pantalla (representadas por placeholders, que las reemplazare en estos dias). El proceso, siendo principiantes, tomó aproximadamente 14 horas debido a la necesidad de investigar y resolver problemas junto a nuestro equipo.

------

## 1. Preparación Inicial

### 1.1. Contexto y Particularidades

La instalación de Arch Linux en la arquitectura x64 es más simple que en ARM64, ya que el soporte para hardware AMD Ryzen es robusto en el kernel genérico de Linux. Sin embargo, se requiere cuidado en la configuración inicial, como la generación de locales y la configuración de red, para evitar errores. Este proceso se basó en el tutorial de kskroyal (al igual que la bitacora de mi compañero)([YouTube](https://www.youtube.com/watch?v=1J_Z_pzzbMo)), original para x64, y en la documentación oficial de Arch Linux.

### 1.2. Requisitos

- **Hardware**: VICTUS 16 con AMD Ryzen™ 7 8845H.

- **Medios**: USB con Arch Linux x64 (`archlinux-x86_64.iso`).

- **Herramientas**

  :

  - Imagen ISO de Arch Linux: [archlinux-x86_64.iso](https://archlinux.org/download/).
  - Conexión a Internet para descargar paquetes.

------

## 2. Particionamiento del Disco

### 2.1. Creación de Particiones

Arranqué desde la USB en vivo de Arch Linux y utilicé `fdisk` para particionar el disco NVMe (`/dev/nvme0n1`). El esquema permite dual-boot con Windows, con una partición EFI separada.

1. **Acceso a fdisk**:

   ```bash
   fdisk /dev/nvme0n1
   ```

2. **Esquema de Particiones**:

   - **Partición EFI**: `/dev/nvme0n1p1` (512 MB, tipo `vfat`, UUID `A1B2-C3D4`).
   - **Partición raíz (`/`)**: `/dev/nvme0n1p2` (ext4, UUID `4a5b6c7d-8910-4a2b-b1c2-d3e4f5a67890`).
   - **Partición de intercambio (`swap`)**: `/dev/nvme0n1p3` (UUID `9c8d7e6f-1234-5678-9012-3456789abcde`).
   - **Partición home (`/home`)**: `/dev/nvme0n1p4` (ext4, UUID `1b2c3d4e-5678-9012-3456-7890abcdef12`).

3. **Formateo**:

   ```bash
   mkfs.vfat -n EFI /dev/nvme0n1p1
   mkfs.ext4 /dev/nvme0n1p2
   mkfs.ext4 /dev/nvme0n1p4
   mkswap /dev/nvme0n1p3
   ```

   **Captura de Pantalla**: [Placeholder_20250706_092345.jpg]

### 2.2. Configuración de `/etc/fstab`

Monté las particiones y configuré el archivo `/etc/fstab`:

```bash
mkdir /mnt
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/efi
mount /dev/nvme0n1p1 /mnt/efi
mkdir /mnt/home
mount /dev/nvme0n1p4 /mnt/home
swapon /dev/nvme0n1p3
```

Creé el archivo `/etc/fstab`:

```bash
# /etc/fstab
UUID=4a5b6c7d-8910-4a2b-b1c2-d3e4f5a67890 / ext4 defaults 0 1
UUID=1b2c3d4e-5678-9012-3456-7890abcdef12 /home ext4 defaults 0 2
UUID=A1B2-C3D4 /efi vfat defaults 0 2
UUID=9c8d7e6f-1234-5678-9012-3456789abcde swap swap defaults 0 0
```

   **Captura de Pantalla**: [Placeholder_20250706_103214.jpg]

------

## 3. Instalación de Arch Linux x64

### 3.1. Instalación del Sistema Base

Instalé el sistema base utilizando `pacstrap`:

```bash
pacstrap /mnt base linux linux-firmware
```

**Captura de Pantalla**: [Placeholder_20250706_113827.jpg]

### 3.2. Configuración Inicial del Sistema

1. **Montaje de Sistemas de Archivos Virtuales**:

   ```bash
   mount --bind /dev /mnt/dev
   mount --bind /proc /mnt/proc
   mount --bind /sys /mnt/sys
   mount --bind /run /mnt/run
   ```

2. **Chroot al Sistema**:

   ```bash
   arch-chroot /mnt
   ```

3. **Configuración de Localización y Zona Horaria**:

   ```bash
   echo "es_MX.UTF-8 UTF-8" > /etc/locale.gen
   locale-gen
   echo "LANG=es_MX.UTF-8" > /etc/locale.conf
   ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
   hwclock --systohc
   ```

   ⚠️ **Nota**: La generación de locales (`locale-gen`) es crucial para evitar errores en aplicaciones que dependen de la codificación de idioma, como la terminal o entornos gráficos.

4. **Configuración del Hostname**:

   ```bash
   echo "victus16-arch" > /etc/hostname
   ```

   Configuré `/etc/hosts`:

   ```bash
   # /etc/hosts
   127.0.0.1   localhost
   ::1         localhost
   127.0.1.1   victus16-arch.localdomain victus16-arch
   ```

5. **Configuración de Red**:

   Instalé y habilité `NetworkManager`:

   ```bash
   pacman -S networkmanager
   systemctl enable NetworkManager
   ```

   **Captura de Pantalla**: [Placeholder_20250706_132456.jpg]

------

## 4. Configuración del Gestor de Arranque (GRUB)

### 4.1. Instalación de GRUB

Instalé GRUB para x64 UEFI:

```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
```

**Captura de Pantalla**: [Placeholder_20250706_141523.jpg]

### 4.2. Configuración de GRUB

Generé la configuración de GRUB:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

**Captura de Pantalla**: [Placeholder_20250706_150912.jpg]

------

## 5. Configuración de Usuarios

Creé el usuario `cdsanchez` con permisos administrativos:

```bash
useradd -m -G wheel -s /bin/bash cdsanchez
passwd cdsanchez
```

Habilité el grupo `wheel` para `sudo`:

```bash
pacman -S sudo
EDITOR=nano visudo
```

Descomenté la línea:

```bash
%wheel ALL=(ALL) ALL
```

**Captura de Pantalla**: [Placeholder_20250706_161734.jpg]

------

## 6. Instalación de Entorno Gráfico (GNOME)

Instalé GNOME para proporcionar una interfaz gráfica:

```bash
pacman -S gnome gdm
systemctl enable gdm
```

Configuré GDM para usar Xorg como respaldo (por compatibilidad con el GPU AMD):

```bash
nano /etc/gdm/custom.conf
[daemon]
WaylandEnable=false
```

**Captura de Pantalla**: [Placeholder_20250706_172319.jpg]

------

## 7. Actualización del Sistema

Actualicé el sistema para asegurar los últimos paquetes:

```bash
pacman -Syu
```

**Captura de Pantalla**: [Placeholder_20250706_183456.jpg]

------

## 8. Resolución de Errores

### 8.1. Error: Locales No Generados

En un intento inicial, olvidé ejecutar `locale-gen`, lo que causó errores en la terminal (mensajes como `locale: Cannot set LC_ALL to default locale`). Solucioné ejecutando:

```bash
locale-gen
```

**Captura de Pantalla**: [Placeholder_20250706_193827.jpg]

### 8.2. Error: Conexión de Red

La red no estaba activa inicialmente. Verifiqué y habilité `NetworkManager`:

```bash
nmcli device status
systemctl start NetworkManager
```

**Captura de Pantalla**: [Placeholder_20250706_202145.jpg]

------

## 9. Verificación Final

- Verifiqué el arranque en un TTY (`Ctrl+Alt+F2`) y con GNOME.

- Comprobé la presencia de firmware:

  ```bash
  ls /lib/firmware/amdgpu
  ```

**Captura de Pantalla**: [Placeholder_20250706_213409.jpg]

------

## 10. Conclusión

La instalación de Arch Linux x64 en la VICTUS 16 fue exitosa, con un sistema funcional que arranca en un TTY y en GNOME. Los pasos clave incluyeron:

- Particionamiento del disco para dual-boot.
- Configuración de locales y red.
- Instalación y configuración de GRUB.
- Creación del usuario `cdsanchez` y entorno gráfico.

El proceso, aunque más simple que en ARM64, requirió atención a detalles como `locale-gen` y la configuración de red, tomando 14 horas debido a nuestra inexperiencia y la necesidad de investigar cada paso.

**Captura de Pantalla Final**: [Placeholder_20250706_223512.jpg]

------

## 11. Tiempos de Demora

- Visualización y comprensión del video de kskroyal ([YouTube](https://www.youtube.com/watch?v=1J_Z_pzzbMo)): 40 minutos.
- Instalación completa, incluyendo investigación y resolución de errores: 14 horas acumuladas.
  - Investigación inicial y preparación: 2 horas.
  - Particionamiento y configuración inicial: 3 horas.
  - Configuración de red y locales: 2 horas.
  - Instalación de GRUB y entorno gráfico: 4 horas.
  - Resolución de errores y verificaciones: 3 horas.

------

**Fecha**: 6 de julio de 2025
**Autor**: Carlos David Sanchez Carrion

**Correo**: cdsanchez@utpl.edu.ec

