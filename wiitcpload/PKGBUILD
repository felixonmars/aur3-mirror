# Maintainer: Jesse Jaara	<gmail.com: jesse.jaara>

pkgname=wiitcpload
pkgver=0.05
pkgrel=2
pkgdesc='Stream wii executables easily to Homebrew/TCPLoader Channel.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/wiitcpload/'
license=('GPL3')
depends=('qt4')
source=("http://downloads.sourceforge.net/wiitcpload/$pkgname-$pkgver-source.tar.bz2")
md5sums=('14104082c26bc0b171300f2ad9ed32d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  make install INSTALL_ROOT="${pkgdir}"
}

