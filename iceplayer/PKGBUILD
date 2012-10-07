# Maintainer: osily <ly50247 at 126 dot com>
# Contributor: peacekeep

pkgname=iceplayer
pkgver=4.0.5
pkgrel=2
pkgdesc="A simple music player"
license=('GPL')
arch=('i686' 'x86_64')
url="http://iceplayer.googlecode.com"
depends=('gstreamer0.10-ffmpeg' 'gstreamer0.10-ugly-plugins' 'gstreamer0.10-good-plugins' \
        'gstreamer0.10-base-plugins' 'mpfr' 'glib2' 'wget' 'libnotify')
source=('http://iceplayer.googlecode.com/files/iceplayer-src-4.0.5-20110520.tar.gz')
md5sums=('b16beb00df8b6bb9c49be0f71cd222f6')

build() {
    cd $pkgname-$pkgver-20110520
    sed -i '/#include <glib\/gtypes.h>/d' *.{h,c}
    ./configure --prefix=/usr
}

package() {
    cd $pkgname-$pkgver-20110520
    make DESTDIR="$pkgdir" install || return 1
    cp -r data/skin $pkgdir/usr/share/iceplayer
}
