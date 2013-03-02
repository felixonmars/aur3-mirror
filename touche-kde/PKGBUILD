# Maintainer: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=touche-kde
pkgver=0.3
pkgrel=1
pkgdesc="Touché is an application that brings full support on GNU/Linux desktops to your input devices: keyboard, mices, even IR remote receivers - KDE Version"
arch=('i686' 'x86_64')
url="http://rockman81.blogspot.it/p/touche.html"
license=('GPL')
groups=()
depends=('qt4' 'kdelibs' 'qjson' )
makedepends=(cmake)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=( http://rockman81.github.com/Touche/files/Touch%C3%A9-$pkgver.tar.gz )
noextract=()

build() {
  cd "${srcdir}/Touché"
  mkdir build -p
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release ..
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

md5sums=('7239a1b8000405820bf0e2c64a7cfb4c')
