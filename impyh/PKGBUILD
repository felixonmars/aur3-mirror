# Maintainer: DaeS
pkgname=impyh
pkgver=20120404
pkgrel=1
pkgdesc="Comfortable GUI for scrot written in python"
arch=('i686' 'x86_64')
url="https://github.com/daesdp/Impyh"
license=('GPL')
depends=('python' 'python-gobject' 'scrot')
makedepends=('git')
install=.INSTALL
_gitroot="https://github.com/daesdp/Impyh.git"
_gitname="Impyh"

build() {
  msg "Connecting to GIT server...."
  git clone $_gitroot
  cd "${srcdir}/${_gitname}/${pkgname}"
}

package() {
  msg "Starting to install...."
  cp -Rf "${srcdir}/$_gitname/${pkgname}"/* "${pkgdir}/"
  chmod 775 ${pkgdir}/usr/share/impyh/ -R
  chmod a+x ${pkgdir}/usr/bin/impyh
}

