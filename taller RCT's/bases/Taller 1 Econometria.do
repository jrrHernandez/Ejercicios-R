*******************************************
* Taller 1 econometria 2                  *
*Jose Ricardo Ricardo Hernandez - 202113889
*******************************************

*Punto 1*
use "C:\Users\richa\OneDrive - Universidad de los Andes\Universidad\octavo\Econometria 2\NHIS.dta"
*analizamos las variables continuas*
summarize age famsize educ inc health_index
* podemos ver que la media de edad es 35 años con una desviación estandar de 22 años.
* el tamaño de la familia en promedio es de 3 personas con una desviación estandar de 1
*los años de educación de una persona es en promedio 13 años con desviación estandar de 6.
*El ingreso total en promedio es de 68452.72*
* El promedio del indice de salud es del 38. EL máximo es del 54.21. El mínimo de 6.39


*para las variables discretas*

*sexo*
tab sex
*el 51% de las personas tienen fecha de nacimiento como mujer. El  48.36 % es 
*hombre de nacimiento.
*nwhite*
tab nwhite
*el 25.40% es no blanca. Mientras que el 74.60% es blanca.
*insurance*
tab insurance
*el 82.59% tiene un seguro de salud. Mientras que el 17.41% no*
 
 
 *punto 2*
ttest health_index, by(insurance)
reg health_index insurance 
tab insurance, summarize(age famsize educ inc)
reg health_index insurance age famsize sex educ inc nwhite





