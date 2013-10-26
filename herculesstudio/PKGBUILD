# Maintainer: Gatchan <ebnerbenoit@gmail.com>

pkgname=herculesstudio
_pkgname=HerculesStudio
pkgver=1.4.0
pkgrel=1

pkgdesc="A Linux and Mac OS GUI to the Hercules emulator for z architecture."
url="http://www.jacobdekel.com/hercstudio/"
arch=('x86_64')

license=('GPL3')
depends=('qt4' 'hercules')
source=("http://sourceforge.net/projects/hercstudio/files/${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
md5sums=('58d6643a97ce80df44bf655a5ac23c6c')

build() {
  cd "$_pkgname"
  qmake-qt4
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
