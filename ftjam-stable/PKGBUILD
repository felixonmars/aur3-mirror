# $Id: PKGBUILD 136989 2011-09-04 19:07:07Z eric $
# Maintainer: Harley Laue <losinggeneration@gmail.com>
# Contributor: Roman Kyrylych <roman@gmail.com>

pkgname=ftjam-stable
pkgver=2.5.2
pkgrel=1
pkgdesc='FT Jam - an enhanced version of the Jam build tool - the latest stable release'
arch=('i686' 'x86_64')
url="http://freetype.org/jam/"
license=('custom')
depends=('glibc')
provides=('jam' 'ftjam')
conflicts=('ftjam')
source=(http://downloads.sourceforge.net/freetype/ftjam-$pkgver.tar.bz2 \
        license.txt)
md5sums=('e61304b370ba06f68082f0219a196576'
         'ef8ff7da77fe60e25d1e3e740600f1f0')

build() {
  cd "${srcdir}/ftjam-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/ftjam-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
