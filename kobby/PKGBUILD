# Maintainer: mickael9 <mickael9 at gmail dot com>
pkgname=kobby
pkgver=1.0b5
pkgrel=1
pkgdesc="A collaborative text editor for KDE"
arch=('i686' 'x86_64')
url="http://greghaynes.github.com/kobby"
license=('GPL')
depends=('cmake>=2.6' 'libqinfinity>=1.0b5' 'kdebase>=4.1')
optdepends=()
makedepends=('automoc4')
provides=()
source=("http://kobby.greghaynes.net/file-cabinet/$pkgname-$pkgver.tar.gz")
md5sums=('4261ecedfa885f62614e28cbc197f235')

build() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
