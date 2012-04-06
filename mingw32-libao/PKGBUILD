# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mingw32-libao
_pkgname=libao
pkgver=1.1.0
pkgrel=1
pkgdesc='Cross-platform audio output library and plugins (mingw32)'
url='http://xiph.org/ao/'
arch=('any')
license=('GPL')
options=('!libtool' '!strip' '!buildflags')
depends=('alsa-lib' 'mingw32-runtime' 'mingw32-w32api')
makedepends=('libpulse' 'mingw32-gcc')
source=("http://downloads.xiph.org/releases/ao/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('9301bc4886f170c7122ab62677fb71cf001c04fd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  ./configure --host=i486-mingw32 \
  	--prefix=/usr/i486-mingw32 \
      --disable-pulse \
      --enable-static
  
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
