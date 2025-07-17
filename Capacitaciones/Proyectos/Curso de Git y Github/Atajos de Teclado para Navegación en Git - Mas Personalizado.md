- - 

  - | Comando                                     | Descripción                                                  |
    | ------------------------------------------- | ------------------------------------------------------------ |
    | `git add [filename]`                        | Agrega un nuevo archivo al modo staging. Preparado para el commit |
    | `git reset [filename]`                      | Quita un archivo del modo staging. No se subira al repo cuando hacemos el commit |
    | `git commit -m "[mensaje]"`                 | Realiza el commit de los cambios preparados con un mensaje.  |
    | `git checkout -- .`                         | ⭐Nos **retorna** nuestro repositorio al **ultimo commit efectuado**. Asi cualquier cambio inesperado es revertido al ultimo estado estable en el que hicimos commit |
    | `git branch -m [old_name] [new_name]`       | Cambiar el nombre de una rama en git. Ejm: master -> main .  |
    | `git config --global -e`                    | Editar la configuracion global de git, con respecto a ajustes del usuario, aliases e init. |
    | `git commit -am "[message]"`                | ✔️Agrega los cambios hechos **a**: los archivos que ya estan en staging (seran subidos al repo). Y agrega un **m**ensaje. (No subira archivos fuera de staging) |
    | `git push`                                  | Sube el contenido del repositorio local a un repositorio remoto. |
    | `git branch`                                | Lista, crea o elimina ramas.                                 |
    | `git checkout [rama]`                       | Cambia a otra rama o restaura archivos del árbol de trabajo. |
    | `git merge [rama]`                          | Fusiona cambios de una rama en la rama actual.               |
    | `git config --global user.name "[nombre]"`  | Establece el nombre de usuario global para los commits.      |
    | `git config --global user.email "[correo]"` | Establece el correo electrónico global para los commits.     |
    

## Configuraciones globales recomendadas

### Al iniciar en git

**Nota:** Siempre reiniciar la terminal al aplicar una configuracion global en git 



* Cambiar la rama por default con la que trabajaremos: Se llamara `main`

```bash
git config--global init.defaultBranch main
```



## Sobre Posibles Errores:

### Leves

#### #1 Warning de LF reemplazado por CRLF .

```bash
warning: LF will be replaced by CRLF in browserconfig. xml. The file will have its original line endings in your working directory warning: LF will be replaced by CRLF in fonts/glyphicons-halflings-regular. svg. The file will have its original line endings in your working directory warning: LF will be replaced by CRLF in js/main. js. The file will have its original line endings in your working directory warning: LF will be replaced by CRLF in js/vendor/bootstrap. js. The file will have its original line endings in your working directory warning: LF will be replaced by CRLF in js/vendor/bootstrap. min. js. The file will have its original line endings in your working directory warning: LF will be replaced by CRLF in js/vendor/jquery-1.11. 2.min. js.
```



+ CRLF, no es nada serio, es básicamente una interpretación de un carácter.

![image-20250717093859712](C:\Users\mabarca1\AppData\Roaming\Typora\typora-user-images\image-20250717093859712.png)



+ Solucion sugerida en el curso (Solo suprimir ese output):

```bash
git config core.autocrlf true
```



## Usando git en VSCode



### Leyenda de archivos

* M:

![image-20250717102502073](C:\Users\mabarca1\AppData\Roaming\Typora\typora-user-images\image-20250717102502073.png)

La M quiere decir que el archivo ha sido modificado desde el ultimo commit.

**Nota: ** EN VScode se puede regresar un archivo que fue `staged` a su estado cuando se le hizo `stage`. De esa forma no regresaria a su estado del `ultimo commit`. 

Ejm: Es como si luego de tomarle la foto a alguien (`commit`), le colocamos una corbata para que suba al escenario, si la corbata nos parece un poco basica, con VScode le `agregamos` un adorno a su corbata, pero si **preferimos** **revertirlo** a su estado previo: **VSCode lo regresa** a su estado original en el escenario (**usando corbata, sin el adorno extra**). En **git** es diferente: **lo regresa** a su estado **antes** de que le tomaramos la **foto** `before commit`