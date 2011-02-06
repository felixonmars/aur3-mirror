#Maintainer: Kandu <1123monkey@163.com>

pkgname=linux1g1g
pkgver=0.9
pkgrel=2
pkgdesc="Online music player"
arch=('i686' 'x86_64')
license=('Artistic License/GPL')
url="http://www.1g1g.org/"
source=(http://www.1g1g.org/app/1g1glinux/${pkgname}-${pkgver}-${pkgrel}-src.tar.bz2 1g1g.desktop)
md5sums=('c712bd7f1c0a85e1053eab252186b584'
         '2dcee176dd3b2bb9fe5cde043ba96374')

depends=('qt' 'flashplugin')

build() {
  cd ${srcdir}/${pkgname}
  qmake -o Makefile linux1g1g.pro
  make || return 1
  mkdir -p ${pkgdir}/usr/bin
  cp ${pkgname} ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  cp icon.png ${pkgdir}/usr/share/pixmaps/1g1g.png
  mkdir -p ${pkgdir}/usr/share/applications/
  cp $startdir/1g1g.desktop ${pkgdir}/usr/share/applications/
}

