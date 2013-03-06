# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=gsl-java
pkgver=1.3_0.6
_pkgver=1.3-0.6
pkgrel=2
pkgdesc="The GSL Java Interface allows Java applications to access the GNU Scientific Library"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/gsl-java/"
license=('GPL')
depends=(gcc java-environment apache-ant apache-ant-cpptasks apache-ant-c-tasks velocity gsl)
source=(http://sourceforge.net/projects/gsl-java/files/gsl-java/gsl-java-$_pkgver/gsl-java-$_pkgver.tar.gz
        build.xml.patch
        gsl_warning.patch
        stdstring.patch
        compilerarg.patch)
md5sums=('b1c8c5bd9b9a3789b9521cf1bd31b85f'
         '0030383f160a646ac6ac29961e9b2187'
         'e415d515fc1422898bee27108bee2b4d'
         'cdcad86dfde758424f5b684251844cf8'
         'aae6133c5ddfea3c6875ac2802c9878f')

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  patch -p0 -i ../build.xml.patch
  patch -p0 -i ../gsl_warning.patch
  patch -p0 -i ../stdstring.patch

  if [ $(uname -m) == "x86_64" ]
  then
    patch -p1 -i ../compilerarg.patch
  fi

  export CLASSPATH=/usr/share/java/apache-ant/lib/cpptasks.jar:$CLASSPATH
  export CLASSPATH=/usr/share/java/commons-collections/commons-collections.jar:$CLASSPATH
  export CLASSPATH=/usr/share/java/commons-lang/commons-lang.jar:$CLASSPATH
  export CLASSPATH=/usr/share/java/velocity.jar:$CLASSPATH
  ant dist
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  mkdir -p "$pkgdir/opt/gsl-java/"
  cp -r dist/* "$pkgdir/opt/gsl-java/"
}

# vim:set ts=2 sw=2 et:
