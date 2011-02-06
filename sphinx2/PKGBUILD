# Contributor: Juri Hamburg <juri@fail2fail.com>
pkgname=sphinx2
pkgver=0.6
pkgrel=1
pkgdesc="decoder for speech recognition research."
arch=('i686' 'x86_64')
url="http://www.speech.cs.cmu.edu/sphinx/"
license=('BSD')
groups=()
depends=()
makedepends=()
source=(http://prdownloads.sourceforge.net/cmusphinx/${pkgname}-${pkgver}.tar.gz?download)
md5sums=('5fcd8e3b6c21334866f07c601f36b37e') 

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  sh ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

