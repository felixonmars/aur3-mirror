# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=e-uae
pkgver=0.8.29
pkgrel=1
pkgdesc="A version of the Ubiquitous Amiga Emulator, that attempts to bring many of the great features of WinUAE to non-Windows platforms."
url="http://www.rcdrummond.net/uae"
license="GPL"
arch=(i686 x86_64)
replaces=(uae)
depends=('gtk2>=2.0.0' 'sdl' 'alsa-lib')
makedepends=('zlib')
source=(http://www.rcdrummond.net/uae/${pkgname}-${pkgver}-WIP4/${pkgname}-${pkgver}-WIP4.tar.bz2)
md5sums=('cbfd7e3d7a1b323331afbb92ea7ff4f0')

build() {
  cd $startdir/src/${pkgname}-${pkgver}-WIP4/
  ./configure --enable-bsdsock --enable-scsi-device \
     	      --with-sdl --with-sdl-gfx --with-sdl-gl \
     	      --with-alsa --prefix=/usr
     	      # DGA / XF86VidMode incompatible w/ SDL
      	      # Uncomment dga/vidmode & comment out sdl to use.
     	      #--enable-dga --enable-vidmode
  make || return 1
  make prefix=${startdir}/pkg/usr install
}
