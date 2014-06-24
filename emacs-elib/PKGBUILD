# Contributor: J. Bromley <jbromley@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-elib
_pkgname=elib
pkgver=1.0
pkgrel=4
pkgdesc="The Emacs Lisp library"
arch=('any')
url="http://jdee.sourceforge.net/"
license=('GPL')
depends=('emacs')
install="$pkgname.install"
source=(http://downloads.sourceforge.net/project/jdee/jdee/Dependencies/elib.tar.gz elib-deprecation.patch elib.texi.patch)
md5sums=('4feb380f2e3b12eb5500dfe6714e349d'
         '03c491e8a476b4ba4c8e494fed3f54b6'
         '2e88e1585923a05a38aab32f8e49b4fc')

prepare() {
  mv $srcdir/pub/comp/os/unix/gnu/elib/$_pkgname-$pkgver.tar.gz \
     $srcdir
  cd $srcdir/
  bsdtar -xzf $_pkgname-$pkgver.tar.gz
  cd $srcdir/$_pkgname-$pkgver

  # Fix up paths and old --infodir flag.
  sed -i 's!/usr/local!/usr!' Makefile
  sed -i 's!/info!/share/info!' Makefile
  sed -i 's!--infodir!--info-dir!g' Makefile
  
  patch -p1 < $srcdir/elib-deprecation.patch
  patch -p1 < $srcdir/elib.texi.patch
}

build () {
  cd $srcdir/$_pkgname-$pkgver
  make 
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -d $pkgdir/usr/share/{info,emacs/site-lisp/elib}
  make prefix=$pkgdir/usr install
  find $pkgdir -name dir -exec rm '{}' \;
}
