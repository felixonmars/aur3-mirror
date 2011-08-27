#Manteiner: Andrea Marchesini <baku@ippolita.net>
pkgname=bbox
pkgver=0.1
pkgrel=1
pkgdesc="...something like dropbox based on subversion."
arch=(i686 x86_64)
url="http://bbox.nois3lab.it"
license=('custom')
depends=('qt' 'subversion' )
source=(http://bbox.nois3lab.it/package/${pkgname}-${pkgver}.deb)
md5sums=('e5b9a60a936ecc1a65a6e46c62b8f4d0')

build() {
  cd "$srcdir"
  ar x bbox-0.1.deb || return 1
  tar xzf data.tar.gz || return 1
  mv usr/ $pkgdir
}
