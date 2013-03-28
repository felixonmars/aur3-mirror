# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

_gitname=qtserialport
_gitroot='git://gitorious.org/qt/qtserialport.git'

pkgname=qtserialport-git
pkgver=20130328
pkgrel=1
pkgdesc="Add-on for the Qt library, providing a single interface for both hardware and virtual serial ports"
arch=('i686' 'x86_64')
url="http://qt-project.org/wiki/QtSerialPort"
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
provides=('qtserialport')

build() {
  cd "$srcdir"
  git clone --depth=1 ${_gitroot}

  sed -i 's/ examples tests//' ${_gitname}/${_gitname}.pro

  mkdir "$srcdir"/${_gitname}-build && cd "$srcdir"/${_gitname}-build
  qmake ../${_gitname}/${_gitname}.pro
  make
}

package() {
  cd "$srcdir"/${_gitname}-build
  make INSTALL_ROOT="$pkgdir" install

  sed -i '1,1d' "$pkgdir"/usr/lib/libQt5SerialPort.prl
}
