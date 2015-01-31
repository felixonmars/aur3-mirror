# Maintainer: Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Contributor: Evan Anderson <evan1124@gmail.com>
# Contributor: Paolo Stivanin <garrett16@hotmail.it>
# Contributor: Marius Nestor <marius@softpedia.com>

pkgname=xf86-video-intel-devel
_pkgname=xf86-video-intel
pkgver=2.99.917
pkgrel=1
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers (devel version)"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org"
license=('gpl')
depends=('intel-dri' 'libxvmc' 'xcb-util>=0.3.9' 'systemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=18' 'resourceproto' 'scrnsaverproto' 'libx11' 'libxrender')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna' 'xf86-video-intel')
provides=('xf86-video-intel-uxa' 'xf86-video-intel-sna' 'xf86-video-intel')
conflicts=('xorg-server<1.14.0' 'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy' 'xf86-video-intel')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=($url/archive/individual/driver/$_pkgname-$pkgver.tar.bz2
    xf86-video-intel-devel.install)

sha256sums=('00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf9667c9'
            '6905dfb5d76fc2e46ecae91c91a84c0aa610b70209ef5f8382f826c9a8108f77')

build() {
    cd $srcdir/$_pkgname-$pkgver
    ./configure --prefix=/usr --enable-dri || return 1
    make
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    make DESTDIR="$pkgdir" install || return 1
}

