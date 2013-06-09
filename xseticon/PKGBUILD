# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>

pkgname=xseticon
pkgver=0.1
pkgrel=3
pkgdesc="Utility to set the window manager icon of an X11 window (eg. xterm)"
arch=('i686' 'x86_64')
url="http://www.leonerd.org.uk/code/xseticon/"
license=('GPL')
depends=('glib2' 'gd' 'libxmu')
source=(http://www.leonerd.org.uk/code/xseticon/${pkgname}-${pkgver}+bzr13.tar.gz)
sha256sums=('6b568674643e13a3671bd74aaa8316f11721d48764a822f76d28b83a88d919b9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}+bzr13"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}+bzr13"

  make install PREFIX="${pkgdir}/usr"
}

