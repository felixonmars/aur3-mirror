# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=transferme
_pkgname=TransferMe
pkgver=1.0.2
pkgrel=1
pkgdesc="A simple p2p file and folder sharing."
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/TransferMe?content=145042'
license=('GPL')
depends=('qt')
makedepends=('unrar')
source=("http://citylan.dl.sourceforge.net/project/argon-od.u/src_${pkgver}.rar")
md5sums=('e5cad0845142720c5b9a98b6597aa518')

build() {
  mkdir ${srcdir}/${_pkgname} && cd ${srcdir}/${_pkgname}  
  unrar x -inul ../src_${pkgver}.rar
  qmake
  make 
}

package() {
  cd ${srcdir}/${_pkgname}
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
