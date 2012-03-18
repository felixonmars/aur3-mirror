# Maintainer: Jesse jaara <jesse.jaara@gmail.com>

pkgname=cairo-snapshot
pkgver=1.11.4
pkgrel=1
pkgdesc="Cairo vector graphics library, development snapshot"
arch=(i686 x86_64)    
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'fontconfig' 'pixman' 'glib2' 'xcb-util')
makedepends=('pkgconfig')  
provides=("cairo=${pkgver}-${pkgrel}" "cairo-xcb=${pkgver}-${pkgrel}")
conflicts=('cairo' 'cairo-xcb') 
options=('!libtool')
source=("http://cairographics.org/snapshots/cairo-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/cairo-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --enable-tee \
    --localstatedir=/var --disable-static --enable-xcb

  make
}

package() {
cd "${srcdir}/cairo-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
md5sums=('1378e19ba1ddbeb7c1ceb4397e9a6467')
