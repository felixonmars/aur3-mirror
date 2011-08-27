# Maintainer: Paolo Stivanin <garrett16@hotmail.it>
# Come to visit my site: www.polslinux.it

pkgname=xf86-video-intel-newest
_pkgname=xf86-video-intel
pkgver=2.15.901
pkgrel=2
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers 2.16-alpha1!"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license="gpl"
depends=('intel-dri>=7.10' 'libpciaccess>=0.11.0' 'libdrm>=2.4.26' 'libdrm>=2.4.26' 'libxvmc' 'xorg-server-devel')
makedepends=('pkgconfig' 'xorg-server>=1.9.0' 'xf86driproto>=2.1.0' 'glproto>=1.4.11' 'mesa>=7.8' 'xineramaproto>=1.2' 'inputproto>=2.0')
conflicts=('xorg-server<1.8.0' 'xf86-video-i810' 'xf86-video-intel-legacy' 'xf86-video-intel')
replaces=('xf86-video-intel' 'xf86-video-intel-git' 'xf86-video-intel-newest' 'xf86-video-i810' 'xf86-video-intel-legacy')
provides=(xf86-video-intel=2.15.901)
options=('!libtool')
groups=('xorg-video-drivers')
source=(${url}/archive/individual/driver/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('0c53119892de3aab0dff967fb7c2e09d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-dri || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
