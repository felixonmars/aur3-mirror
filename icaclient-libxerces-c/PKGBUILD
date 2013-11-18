# Maintainer: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=icaclient-libxerces-c
pkgver=3.1.1
pkgrel=1
pkgdesc="32 bit libxerces needed by icaclient 13.0"
arch=('x86_64')
url="http://xerces.apache.org/xerces-c/"
license=('APACHE')
depends=('gcc-libs' 'curl')
makedepends=('gcc-multilib')
source=("http://apache.osuosl.org/xerces/c/3/sources/xerces-c-${pkgver}.tar.gz")
md5sums=('6a8ec45d83c8cfb1584c5a5345cb51ae')

build() {
  cd xerces-c-${pkgver}
  
  export CXXFLAGS='-m32'
  export CFLAGS='-m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure --prefix=/usr/ --libdir=/usr/lib32  \
    --sysconfdir=/etc ${SSE2}
  make
}

package() {
  mkdir -p ${pkgdir}/usr/lib32/pkgconfig
  install -m 0755 xerces-c-${pkgver}/src/.libs/libxerces-c.so xerces-c-${pkgver}/src/libxerces-c.la ${pkgdir}/usr/lib32/
  install -m 0755 xerces-c-${pkgver}/xerces-c.pc ${pkgdir}/usr/lib32/pkgconfig/
  cd ${pkgdir}/usr/lib32
  ln -s libxerces-c.so libxerces-c-3.1.so 

}
