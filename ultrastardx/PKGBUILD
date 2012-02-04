# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=ultrastardx
pkgver=1.1
pkgrel=1
pkgdesc="UltraStar Deluxe (USDX) is a free and open source karaoke game."
arch=('i686' 'x86_64')
url="http://ultrastardeluxe.org/"
license=('GPL')
depends=('ffmpeg' 'libpng12' 'lua' 'portaudio' 'sdl_image' 'sqlite3' 'ttf-dejavu' 'ttf-freefont' 'wqy-microhei')
makedepends=('fpc' 'gcc' 'make' 'pkg-config')
options=('!libtool')
groups=('usdx')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)
md5sums=('fa4128c9527b06408614c39e93a23bbc')

build() { 
  cd ${srcdir}/${pkgname}-${pkgver}-src

  export libpng_VERSION=12
  export libavcodec_VERSION=52.86.0
  export libavformat_VERSION=52.78.0
  export libavutil_VERSION=50.24.0
  export libswscale_VERSION=0.11.0

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make LDFLAGS="" || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  install -d ${pkgdir}/usr/share/{applications,pixmaps} || return 1

  make LDFLAGS="" DESTDIR=${pkgdir} install || return 1

  install -m644 dists/${pkgname}.desktop \
		${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${pkgdir}/usr/share/${pkgname}/resources/icons/${pkgname}-icon.png \
		${pkgdir}/usr/share/pixmaps/${pkgname}.png || return 1

  # symlink fonts...
  rm ${pkgdir}/usr/share/${pkgname}/fonts/*/*.tt*
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf ${pkgdir}/usr/share/${pkgname}/fonts/DejaVu/ || return 1
  ln -s /usr/share/fonts/TTF/DejaVuSans-Bold.ttf ${pkgdir}/usr/share/${pkgname}/fonts/DejaVu/ || return 1
  ln -s /usr/share/fonts/TTF/FreeSans.ttf ${pkgdir}/usr/share/${pkgname}/fonts/FreeSans/ || return 1
  ln -s /usr/share/fonts/TTF/FreeSansBold.ttf ${pkgdir}/usr/share/${pkgname}/fonts/FreeSans/ || return 1
  ln -s /usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc ${pkgdir}/usr/share/${pkgname}/fonts/wqy-microhei/ || return 1

  # Removing unnecessary stuff
  find ${pkgdir} -type f -name "AUTHORS*" -exec rm {} \;
  find ${pkgdir} -type f -name "COPYING*" -exec rm {} \;
  find ${pkgdir} -type f -name "CREDITS" -exec rm {} \;
  find ${pkgdir} -type f -name "LICENSE*" -exec rm {} \;
  find ${pkgdir} -type f -name "README*" -exec rm {} \;
}
