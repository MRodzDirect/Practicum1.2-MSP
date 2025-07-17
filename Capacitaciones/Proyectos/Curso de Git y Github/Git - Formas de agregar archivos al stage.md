# Git - Formas de agregar archivos al stage



### Navegacion

---

**Clase 16**

* Agregar archivos de una carpeta con cierta extension:

```bash
git add folder_name/*.type
```

- 
  - Ejm: Agregar todos los .json de una carpeta

```bash
	git add ArchivosJSON/*.json
```

**Nota:** SIempre hacerlo de tal manera, de lo contrario al hacer add sin el nombre de la carpeta, git no incluira los archivos de los subdirectorios

* **Git** por defecto no agrega carpetas vacias. Para hacerlo debemos crear un archivo `.gitkeep` dentro de la carpeta vacia:

​	*Antes:*

![image-20250717105207091](C:\Users\mabarca1\AppData\Roaming\Typora\typora-user-images\image-20250717105207091.png)

​	*Despues:*



​	![image-20250717105116699](C:\Users\mabarca1\AppData\Roaming\Typora\typora-user-images\image-20250717105116699.png) 

---



