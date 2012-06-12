# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Alexander Markov <apsheronets@gmail.com>
# Contributor: Winston Weinert
pkgname=cellwriter
pkgver=1.3.4
pkgrel=5
pkgdesc="CellWriter is a grid-entry natural handwriting input panel. As you write characters into the cells, your writing is instantly recognized at the character level"
arch=("i686" "x86_64")
license=('GPL')
url="http://v1.risujin.org/cellwriter/"
depends=("gtk2>=2.0" "libxtst>=1.0" "libgnome>=2.0" "hicolor-icon-theme")
source=(http://v1.risujin.org/pub/cellwriter/$pkgname-$pkgver.tar.gz \
        http://launchpadlibrarian.net/18959127/${pkgname}-${pkgver}-cellwidget-dont-disable-xinput.diff)
md5sums=('72b4e552a32d6acd888da0b88aeebbdd'
         '5e8c61309c5ec8f67f0af7bb5ceb1aea')
install=$pkgname.install

build() {
  cd "${srcdir}/$pkgname-$pkgver/src"
  patch -p0 < "${srcdir}/${pkgname}-${pkgver}-cellwidget-dont-disable-xinput.diff"

  cd "${srcdir}/$pkgname-$pkgver"
  env LDFLAGS='-lX11' ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
