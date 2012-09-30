# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Heiko Baums <heiko@baums-on-web.de>

pkgname=alsa-tools-ice1712
_pkgbasename=alsa-tools
pkgver=1.0.26.1
pkgrel=1
pkgdesc="envy24control - Control tool for Envy24 (ice1712) based soundcards"
arch=('i686' 'x86_64')
url="http://alsa-project.org"
license=('GPL')
depends=('alsa-lib' 'gtk2')
source=(http://alsa.cybermirror.org/tools/${_pkgbasename}-${pkgver}.tar.bz2
	envy24control.desktop)
md5sums=('805526ea5d6c40e1f2c94cee86141230'
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
