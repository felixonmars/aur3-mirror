# Maintainer:  anonymous_user <31337h4ck3r  at gmail.com>
# Maintainer: vldmr <vldmr at lavabit.com>

pkgname=galculator-gtk2
_pkgname=galculator
pkgver=2.1.2
pkgrel=1
pkgdesc='GTK+ based scientific calculator (GTK2)'
arch=('i686' 'x86_64')
url='http://galculator.sourceforge.net/'
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('intltool')
conflicts=('galculator')
install=$_pkgname.install
source=(http://downloads.sourceforge.net/galculator/galculator-$pkgver.tar.bz2)
md5sums=('01c97ec3e18c26c64af78dca9f700d43')

build() {
  cd $srcdir/$_pkgname-$pkgver

  LDFLAGS+=' -lm'
  ./configure --prefix=/usr --disable-gtk3
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
