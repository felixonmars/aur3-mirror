# Maintainer: Gregory Haynes <greg@greghaynes.net>
# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=kobby-git
pkgver=1.0
pkgrel=1
pkgdesc="A collaborative text editor for KDE"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cmake>=2.6' 'libqinfinity>=1.0b3' 'kdebase>=4.1')
url=('http://kobby.greghaynes.net/home')
optdepends=()
makedepends=('automoc4')
provides=('kobby')

build() {
  git clone git://gitorious.org/kobby/mainline.git kobby
  cd $srcdir/kobby
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

