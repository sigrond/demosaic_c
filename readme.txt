demosaic w c
Autor: Tomasz Jakubczyk
sigrond93@gmail.com

oryginalne matlabowe:
>> tic; A4=AviReadPike_Split('f:\Moje dokumenty\matlab\DEG_clean412.avi',1:10); toc;
Elapsed time is 2.487486 seconds.
napisane w matlabie:
>> tic; A4=AviReadPike_Split('f:\Moje dokumenty\matlab\DEG_clean412.avi',1:10); toc;
Elapsed time is 5.259141 seconds.
napisane w c:
>> tic; A4=AviReadPike_Split('f:\Moje dokumenty\matlab\DEG_clean412.avi',1:10); toc;
Elapsed time is 2.310971 seconds.
napisane w c z poprawieniem dost�pu do pami�ci i i&1 zamiast i%2 :
>> tic; A4=AviReadPike_Split('f:\Moje dokumenty\matlab\DEG_clean412.avi',1:10); toc;
Elapsed time is 2.135670 seconds.

najpierw �ci�gn�� i uruchomi� skrypt gnumex
wybra� kompilator mingw i inne opcje wed�ug potrzeb
mex -v COMPFLAGS="$COMPFLAGS -Wall -std=c99" LINKFLAGS="$LINKFLAGS" demosaic_c_mex.c