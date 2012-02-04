# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=kgpg
pkgver=3.5.9
pkgrel=2
pkgdesc="Simple graphical interface for GnuPG."
arch=('i686')
url="http://developer.kde.org/~kgpg"
license=('GPL')
depends=('kdelibs3' 'gnupg' 'qt3')
source=(ftp://ftp.kde.org/pub/kde/stable/$pkgver/src/kdeutils-$pkgver.tar.bz2)
conflicts=('kdeutils')

md5sums=('dbe5ddff57141f27778601df5571e182')

build() {
  cd "${srcdir}/kdeutils-$pkgver"

  ./configure --prefix=/opt/kde --without-arts
  cd ./$pkgname
  make || return 1
  make DESTDIR=${pkgdir} install
}
