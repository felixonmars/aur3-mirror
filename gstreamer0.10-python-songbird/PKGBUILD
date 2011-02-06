# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=gstreamer0.10-python-songbird
pkgver=0.10.14
pkgrel=1
pkgdesc="Python bindings for GStreamer 0.10. Workaround for Songbird 1.2"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('pygobject>=2.16.1' 'gstreamer0.10-base>=0.10.22')
makedepends=('pkgconfig')
provides=('gstreamer0.10-python=0.10.14')
conflicts=('gstreamer0.10-python')
options=('!libtool')
source=(http://gstreamer.freedesktop.org/src/gst-python/gst-python-${pkgver}.tar.bz2)
md5sums=('a2df4bc00c718ab9d1edda4429a58b9d')

build() {
    cd $srcdir/gst-python-$pkgver
    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
