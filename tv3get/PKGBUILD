# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=tv3get
pkgver=1.0
pkgrel=1
pkgdesc='Download a video file from TV3, by its ID, and converted to mp4'
url='http://juanmah.wordpress.com'
arch=('i686' 'x86_64')
license=('GPL')
depends=('wget' 'rtmpdump' 'glibc' 'ffmpeg')
makedepends=('')
provides=('tv3get')
source=('tv3get.sh')
md5sums=('fcc228d6574cace95f8b236987a44d2b')

build() {

        mkdir -p $startdir/pkg/usr/bin
        cp $startdir/src/tv3get.sh $startdir/pkg/usr/bin

}
