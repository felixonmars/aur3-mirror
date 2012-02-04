pkgname=xf86-video-ati-6.14.2
_realpkgname=xf86-video-ati
pkgver=6.14.2
pkgrel=1
pkgdesc="X.org ati video driver 6.14.2"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
provides=('xf86-video-ati=6.14.2')
depends=('libdrm>=2.4.6' 'libpciaccess' 'ati-dri>=7.4')
makedepends=('pkgconfig' 'xorg-server>=1.6.0' 'fontsproto'
	         'glproto>=1.4.9' 'xf86driproto' 'diffutils' 'xorg-util-macros' 'xineramaproto' 'mesa')
conflicts=('xorg-server<1.6.0' 'xf86-video-ati=6.14.2')
options=('!libtool')
license=('custom')
source=('LICENSE')
md5sums=('aa0d682804e197e94812a04663230b52')
source=(http://cgit.freedesktop.org/xorg/driver/xf86-video-ati/snapshot/xf86-video-ati-xf86-video-ati-6.14.2.tar.bz2)

build() {
    cd $srcdir/xf86-video-ati-xf86-video-ati-6.14.2

    ./autogen.sh

    ./configure --prefix=/usr \
                --enable-dri || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
