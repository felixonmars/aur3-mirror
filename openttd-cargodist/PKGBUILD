# Maintainer: Chen Tong <blovemaple2010@gmail.com>

pkgname=openttd-cargodist
pkgver=gf401864b
epoch=20130609
pkgrel=1
pkgdesc='OpenTTD with passenger and cargo distribution patch'
arch=('i686' 'x86_64')
url='http://wiki.openttd.org/Passenger_and_cargo_distribution'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo2' 'hicolor-icon-theme' 'desktop-file-utils')
install=openttd.install
optdepends=('openttd-opengfx: free graphics set' 
            'openttd-opensfx: free sound set'
	    'openttd-openmsx: free music set')
source=("http://bundles.openttdcoop.org/cargodist/releases/${pkgver}-cd/${pkgname}-${pkgver}-cd-source.tar.xz")

md5sums=('1d7cfc77157e79a8cb00972e70684b3e')

build() {
  cd "${pkgname}-${pkgver}-cd"

 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD Cargodist" \
    --personal-dir=.${pkgname}    

  make
}

package() {
  cd "${pkgname}-${pkgver}-cd"

  make install

}

