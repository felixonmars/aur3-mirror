# Contributed by; Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor:  itikhonov
pkgname=heirloom-doctools-cvs
pkgver=20120529
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Documentation Tools consist of a modern roff suite."
url="http://heirloom.sourceforge.net/doctools.html"
license=('custom:"caldera"' 'custom:"opensolaris"' 'custom:"lucent"')
source=('config.diff')
makedepends=('cvs')
md5sums=('ccb66e215599cab347132e2f3240156e')

build() {

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-doctools

  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom-doctools $srcdir/build
  cd $srcdir/build
  patch -p1 < ../config.diff
  make
}

package() {
  cd $srcdir/build 
  make install ROOT=$pkgdir
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m0644 $srcdir/heirloom-doctools/LICENSE/CALDERA.LICENSE $pkgdir/usr/share/licenses/${pkgname}/CALDERA.LICENSE
  install -m0644 $srcdir/heirloom-doctools/LICENSE/OPENSOLARIS.LICENSE $pkgdir/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE
  install -m0644 $srcdir/heirloom-doctools/LICENSE/LUCENT.LICENSE $pkgdir/usr/share/licenses/${pkgname}/LUCENT.LICENSE
}