#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=wizznic
pkgver=0.9.9
pkgrel=1
pkgdesc="A puzzlegame of matching bricks of the same kind."
arch=(i686 x86_64)
url="http://wizznic.sourceforge.net/"
license=('GPL3')
depends=('sdl_mixer' 'sdl_image' 'libgl')
source=("http://downloads.sourceforge.net/project/wizznic/Source%20Releases/wizznic-${pkgver}-src.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  make -f Makefile.linux DATADIR=/usr/share/wizznic/ BINDIR=/usr/bin/
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"

  make -f Makefile.linux DATADIR="${pkgdir}/usr/share/wizznic/" BINDIR="${pkgdir}/usr/bin/" install
}
md5sums=('1b017cd84903f40f2a3ae7aef9951e8d')
