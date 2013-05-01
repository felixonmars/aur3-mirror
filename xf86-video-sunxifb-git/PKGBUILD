# Maintainer: Georges Discry <georges at discry dot be>

pkgname=xf86-video-sunxifb-git
_gitname=xf86-video-sunxifb
pkgver=135.d147e25
pkgrel=1
pkgdesc="X.org mali video driver"
arch=('armv7h')
url="https://github.com/ssvb/xf86-video-sunxifb"
license=('MIT')
depends=('libump')
makedepends=('git' 'xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
provides=('xf86-video-sunxifb')
source=('git+https://github.com/ssvb/xf86-video-sunxifb')
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/${_gitname}"
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
  make DESTDIR="${pkgdir}/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
