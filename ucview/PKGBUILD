# Maintainer: jordi Cerdan (jcerdan) <jcerdan@tecob.com>
# Contributor: Kamil Śliwak (Cameel) <cameel2+aur@gmail.com>
# Contributor: Niel West (Nielkie) <nielkie@gmail.com>
pkgname=ucview
pkgver=0.33
pkgrel=1
pkgdesc="A video image capture application that uses the unicap toolkit."
arch=('i686' 'x86_64')
url="http://unicap-imaging.org"
license=('GPL')
depends=('libunicapgtk' 'libglade' 'gconf' 'hicolor-icon-theme')
makedepends=('intltool' 'perlxml')
install=ucview.install
source=(http://www.unicap-imaging.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('da609cf706e70254abea06cc1fb495e2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
