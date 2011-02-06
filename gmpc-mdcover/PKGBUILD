# Maintainer: Claudio Kozický <claudiokozicky@gmail.com>

pkgname=gmpc-mdcover
pkgver=0.20.0
pkgrel=1
pkgdesc="A plugin which fetches metadata from the music directory."
arch=('i686' 'x86_64')
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_MDCOVER"
license=('GPL2')
depends=('gmpc>=0.20.0')
conflicts=('gmpc-mdcover-git')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e0f50943e46ff83614d9d18e08aa2b4e592b71df090763e0827dee8106170d82')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
