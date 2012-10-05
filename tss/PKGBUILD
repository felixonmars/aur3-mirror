pkgname=tss 
pkgver=0.7.5
pkgrel=2
pkgdesc="A GUI to make theora video streams using ffmpeg2theora software."
arch=('i686' 'x86_64')
url="http://gollum.artefacte.org/tss/"
depends=('dvgrab' 'ffmpeg2theora' 'oggfwd' 'ffmpeg' 'libtheora' 'libraw1394' 'vte')
license=('GPL3')
source=(http://gollum.artefacte.org/tss/${pkgname}-${pkgver}.tgz)
md5sums=('3868488037f6fe45687b2f125b302ff2')
build() {
    cd ${startdir}/src/${pkgname}-${pkgver}
    ./configure -prefix=/usr
    make || return 1
    make DESTDIR=$startdir/pkg install 
}

