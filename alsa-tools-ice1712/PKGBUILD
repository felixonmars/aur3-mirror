# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Heiko Baums <heiko@baums-on-web.de>

pkgname=alsa-tools-ice1712
_pkgbasename=alsa-tools
pkgver=1.0.27
pkgrel=1
pkgdesc="envy24control - Control tool for Envy24 (ice1712) based soundcards"
arch=('i686' 'x86_64')
url="http://alsa-project.org"
license=('GPL')
depends=('alsa-lib' 'gtk2')
source=(ftp://ftp.alsa-project.org/pub/tools/${_pkgbasename}-${pkgver}.tar.bz2
	    envy24control.desktop)
md5sums=('1ea381d00a6069a98613aa7effa4cb51'
         '3deb35cf4da901994e70619276613831')

build() {
  cd "$srcdir/${_pkgbasename}-${pkgver}/envy24control"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_pkgbasename}-${pkgver}/envy24control"
  make DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -D -m644 envy24control.desktop "$pkgdir/usr/share/applications/envy24control.desktop"
}
