# Maintainer: h31 <h31mail@yandex.com>

pkgname=libtheora-beta
pkgver=1.1.1
pkgrel=1
pkgdesc="An open video codec developed by the Xiph.org (new thusnelda version + old version for compability)"
arch=('i686' 'x86_64')
depends=('libogg')
makedepends=('libvorbis')
provides=('libtheora')
conflicts=('libtheora')
url=http://www.xiph.org
license=('custom')
options=(!libtool)
if [ "${CARCH}" == "x86_64" ]; then
  source=(http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.bz2
  ftp://ftp.archlinux.org/extra/os/x86_64/libtheora-1.0-1.1-x86_64.pkg.tar.gz)
  md5sums=('292ab65cedd5021d6b7ddd117e07cd8e'
	 '4083f015742f799483d7c58128ba9b32')
else
  source=(http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.bz2
  ftp://ftp.archlinux.org/extra/os/i686/libtheora-1.0-1-i686.pkg.tar.gz)
  md5sums=('292ab65cedd5021d6b7ddd117e07cd8e'
         'be180070586dc6870a0947fde9b0f118')
fi

build() {
  cd "${srcdir}/libtheora-${pkgver}"
  ./configure --prefix=/usr --enable-shared --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/licenses/libtheora"
  install -m644 LICENSE COPYING "${pkgdir}/usr/share/licenses/libtheora/" || return 1
  cd $startdir/src
  cp -dp usr/lib/libtheora.so.0.3.4 ${pkgdir}/usr/lib/
  cp -dp usr/lib/libtheoradec.so.1.0.1 ${pkgdir}/usr/lib/
  cp -dp usr/lib/libtheoraenc.so.1.0.1 ${pkgdir}/usr/lib/
}