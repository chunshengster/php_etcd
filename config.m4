dnl $Id$
dnl config.m4 for extension etcd

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(etcd, for etcd support,
[  --with-etcd             Include etcd support])

dnl Otherwise use enable:

dnl PHP_ARG_ENABLE(etcd, whether to enable etcd support,
dnl [  --enable-etcd           Enable etcd support])

if test "$PHP_ETCD" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-etcd -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/etcd.h"  # you most likely want to change this
  dnl if test -r $PHP_ETCD/$SEARCH_FOR; then # path given as parameter
  dnl   ETCD_DIR=$PHP_ETCD
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for etcd files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       ETCD_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$ETCD_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the etcd distribution])
  dnl fi

  dnl # --with-etcd -> add include path
  dnl PHP_ADD_INCLUDE($ETCD_DIR/include)

  dnl # --with-etcd -> check for lib and symbol presence
  dnl LIBNAME=etcd # you may want to change this
  dnl LIBSYMBOL=etcd # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $ETCD_DIR/$PHP_LIBDIR, ETCD_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_ETCDLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong etcd lib version or lib not found])
  dnl ],[
  dnl   -L$ETCD_DIR/$PHP_LIBDIR -lm
  dnl ])
  
  dnl PHP_SUBST(ETCD_SHARED_LIBADD)

  PHP_NEW_EXTENSION(etcd, etcd.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
