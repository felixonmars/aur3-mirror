pkgname=libquvi-scripts-nsfw
_real_pkgname=libquvi-scripts
pkgver=0.4.16
pkgrel=1
pkgdesc='Library for parsing video download links. Scripts for nsfw sites included.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('LGPL')
depends=('curl' 'lua')
provides=('libquvi-scripts=0.4.16')
conflicts=('libquvi-scripts')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${_real_pkgname}-${pkgver}.tar.xz")
md5sums=('693f9ebce64485367e29db07d11e4edf')

build() {
  cd "${_real_pkgname}-${pkgver}"

  ./configure --prefix=/usr --with-nsfw
  make
}

package() {
  cd "${_real_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
