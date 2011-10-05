# Contributor: oldbay <old_bay@mail.ru>

pkgname=mdc
pkgver=1.0.4.3
pkgrel=1
pkgdesc="MDC Internet Messenger"
arch=('i686' 'x86_64')
url="http://mdc.ru/"
license=('GPL')
depends=('qt')
makedepends=('svn' 'boost' 'boost-libs' 'mpfr')
source=('mdc_externlib.pri' 'plugins.pro' 'mdc.desktop' 'mdc.png')
md5sums=('f892ada64ed005d1f537d599215bb300'
         'f4e62d43221ec02266b4e016cfae3e53'
         '2305dd93a90856fdfc5fd94c1188ca10'
         '790e6c5289f44841082e07fa5a88bed1')
build() {
  
  cd $srcdir
  svn co svn://svn.mdc.ru/client/tags/$pkgver

  install -D -m644 ${srcdir}/mdc_externlib.pri ${srcdir}/$pkgver/src/mdc/mdc_externlib.pri
  install -D -m644 ${srcdir}/plugins.pro ${srcdir}/$pkgver/src/plugins/plugins.pro
  
  cd $srcdir/$pkgver
  find . -name .svn -print0 | xargs -0 rm -rf
  qmake -recursive
  make debug
  #make release
  
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  mkdir ${pkgdir}/usr/lib
  mkdir ${pkgdir}/usr/share
  mkdir ${pkgdir}/usr/share/applications
  mkdir ${pkgdir}/usr/share/pixmaps
  
  install -D -m755 ${srcdir}/$pkgver/bin/mdcd ${pkgdir}/usr/bin/mdcd
  cp -a ${srcdir}/$pkgver/lib/mdc ${pkgdir}/usr/lib/
  cp -a ${srcdir}/$pkgver/share/mdc ${pkgdir}/usr/share/
  install -D -m644 ${srcdir}/mdc.desktop ${pkgdir}/usr/share/applications/mdc.desktop
  install -D -m644 ${srcdir}/mdc.png ${pkgdir}/usr/share/pixmaps/mdc.png

}
