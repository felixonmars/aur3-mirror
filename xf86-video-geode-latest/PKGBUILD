# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=xf86-video-geode-latest
pkgver=2.11.9
pkgrel=1
pkgdesc="X.org AMD/Geode LX & NX video driver"
# there is no 64bit geode yet! (does not build either, i386 ASM)
arch=(i686)
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server>=1.6.3' 'xf86dgaproto')
conflicts=('xorg-server<1.6.3' 'xf86-video-geode')
options=('!libtool')
conflicts=('xf86-video-amd')
replaces=('xf86-video-amd')
provides=('xf86-video-geode')
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/xf86-video-geode-${pkgver}.tar.bz2)
md5sums=('718afca8425aa62662c03a9083915be1')

build() {
  cd "${srcdir}/xf86-video-geode-${pkgver}"
  ./configure --prefix=/usr \
      --enable-visibility || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/licenses/xf86-video-geode"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xf86-video-geode/" || return 1
}
