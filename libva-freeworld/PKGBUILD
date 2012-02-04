pkgname=libva-freeworld
_origname=libva
_newver=1.0.10
pkgver=0.32.0
pkgrel=1
pkgdesc="Video Acceleration API for Linux (patched version for using with xpsb-glx)"
arch=('i686' 'x86_64')
url="http://www.splitted-desktop.com/~gbeauchesne/libva/"
license=('MIT')
depends=('libgl' 'libdrm' 'libxfixes')
makedepends=('mesa')
optdepends=('vdpau-video: VDPAU backend for VA API'
	    'xpsb-glx: VA API for GMA500')
options=('!libtool')
conflicts=('libva')
provides=('libva')
source=("http://www.splitted-desktop.com/~gbeauchesne/${_origname}/${_origname}_${pkgver}-1+sds2.tar.gz")

build() {
  cd ${srcdir}/${_origname}-${pkgver}

  for p in debian/patches/*.patch; do patch -p1 < $p; done

  autoreconf -i
  ./configure --disable-static --prefix=/usr  \
    --enable-glx
  make
}

package() {
  cd ${srcdir}/${_origname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING

  # compatibility workarounds
  echo ".text"|gcc -xassembler - -o ${pkgdir}/usr/lib/libva.so.0.29 -shared -Wl,-soname,libva.so.0 -L${pkgdir}/usr/lib -lva-compat
  echo ".text"|gcc -xassembler - -o ${pkgdir}/usr/lib/libva.so.${_newver} -shared -Wl,-soname,libva.so.1 -L${pkgdir}/usr/lib -lva-x11
  echo ".text"|gcc -xassembler - -o ${pkgdir}/usr/lib/libva-x11.so.${_newver} -shared -Wl,-soname,libva-x11.so.1 -L${pkgdir}/usr/lib -lva-x11
  echo ".text"|gcc -xassembler - -o ${pkgdir}/usr/lib/libva-glx.so.${_newver} -shared -Wl,-soname,libva-glx.so.1 -L${pkgdir}/usr/lib -lva-glx
  ldconfig -n ${pkgdir}/usr/lib
}

md5sums=('27b0108fbab69228b61f053d279fc520')