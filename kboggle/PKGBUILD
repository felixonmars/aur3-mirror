# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kboggle
pkgver=0.4.1
pkgrel=3
pkgdesc="A Boggle game for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=26195"
license=('GPL')
depends=('kdelibs3')
source=(http://www.bramschoenmakers.nl/files/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('e59939aa274b2e87861310241bce7a92')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --without-arts
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
