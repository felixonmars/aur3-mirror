# Maintainer: Gregory Haynes <greg@greghaynes.net>
# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=libqinfinity-svn
pkgver=1.0b4
pkgrel=1
pkgdesc="A Qt4 interface to libinfinity"
arch=('i686' 'x86_64')
url="http://greghaynes.github.com/libqinfinity"
license=('GPL')
depends=('cmake>=2.6' 'libinfinity>=0.3.0' 'libinfinity-api=0.3' 'qt>=4.5')
optdepends=()
provides=()

build() {
  git clone git://gitorious.org/libqinfinity/mainline.git libqinfinity
  cd $srcdir/libqinfinity
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
