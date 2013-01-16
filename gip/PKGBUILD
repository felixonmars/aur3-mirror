# Maintainer: TDY <tdy@archlinux.info>

pkgname=gip
pkgver=1.7.0_1
pkgrel=1
pkgdesc="An IP address calculator"
arch=('i686' 'x86_64')
url="http://gip.googlecode.com/"
license=('GPL')
depends=('desktop-file-utils' 'gtkmm>=2.4' 'libsigc++' 'shared-mime-info')
makedepends=('gettext' 'intltool' 'pkgconfig')
options=('!emptydirs')
install=gip.install
source=(http://gip.googlecode.com/files/gip-${pkgver/_/-}.tar.gz
        gip-$pkgver.diff)
md5sums=('a45c1ace942b2f51bee61e75a4b2465a'
         'd38800c21da78132ff82ff0ef8aa668b')

build() {
  cd "$srcdir/gip-${pkgver/_/-}"
  patch -Np1 -i ../gip-$pkgver.diff
  ./build.sh --prefix /usr
}

package() {
  cd "$srcdir/gip-${pkgver/_/-}"
  ./build.sh --prefix "$pkgdir/usr" --install
}

# vim:set ts=2 sw=2 et:
