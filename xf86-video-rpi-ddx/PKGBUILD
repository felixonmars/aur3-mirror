# Maintainer: smotocel69 <smotocel69@gmail.com>
# Contribuitor: Georges Discry <georges at discry dot be>

pkgname=xf86-video-rpi-ddx
_gitname=xf86-video-fbturbo
pkgver=188.c395869
pkgrel=1
pkgdesc="X.org DDX video driver for Raspberry PI"
arch=('armv6h' 'armv7h')
url="https://github.com/ssvb/xf86-video-fbturbo"
license=('MIT')
depends=('')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
provides=('xf86-video-rpi-ddx')
conflicts=('xf86-video-fbturbo')
source=('git+https://github.com/ssvb/xf86-video-fbturbo')
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i 's/AC_CHECK_LIB(\(.\+\), \(.\+\),/AC_SEARCH_LIBS(\2, \1,/' configure.ac
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir "${pkgdir}/etc/"
  mkdir "${pkgdir}/etc/X11/"
  mkdir "${pkgdir}/etc/X11/xorg.conf.d/"
  cp "xorg.conf" "${pkgdir}/etc/X11/xorg.conf.d/99-fbturbo.conf"
  make DESTDIR="${pkgdir}/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
