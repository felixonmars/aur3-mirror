# Author: Martin Osmera <mailto:martin.osmera@gmail.com>
# Date: 2012-12-28
# License: GNU GPLv2
pkgname=mcu8051ide
pkgver=1.4.7
pkgrel=2
pkgdesc="Graphical IDE for microcontrollers based on 8051."
arch=('any')
url="http://mcu8051ide.sourceforge.net"
license=('GPL2')
install=$pkgname.install
depends=('bwidget>=1.8' 'tcllib>=1.11' 'itcl>=3.4' 'tcl>=8.5.9' 'tdom-git>=0.8' 'tk>=8.5.9' 'tkimg>=1.4' 'tclx>=8.4' 'shared-mime-info' 'desktop-file-utils')
makedepends=('cmake>=2.8')
optdepends=('sdcc: full support for C language'
'hunspell: support for spell checking in comments'
'rxvt-unicode: terminal emulator in the IDE'
'doxygen: support for automated generation of documentation files'
'indent: automated indentation of C source files')
source=("http://downloads.sourceforge.net/mcu8051ide/${pkgname}-${pkgver}.tar.gz")
md5sums=('491c16f65ac233dfc238f5643322f1ab')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
