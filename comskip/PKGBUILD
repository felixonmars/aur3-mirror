# Maintainer: Daniel Murphy <mosquitogang201@gmail.com>
pkgname=comskip
pkgver=0.93i
pkgrel=1
pkgdesc="Automatic commercial flagger."
arch=('i686' 'x86_64')
url="http://forum.xbmc.org/showthread.php?tid=150084"
license=('GPL2')
depends=('argtable' 'ffmpeg')
source=("http://www.xilka.com/xilka/source/$pkgname-$pkgver.tar.xz")
md5sums=('5bddd3109166d6e495bb8cb18f9c1641')

build() {
    cd ${srcdir}/$pkgname-$pkgver
    ./configure
    make
}

package() {
    cd ${srcdir}/$pkgname-$pkgver
    mkdir -p ${pkgdir}/usr/bin && cp comskip ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/etc/comskip && cp comskip.ini ${pkgdir}/etc/comskip
    cp comskip.dictionary ${pkgdir}/etc/comskip
    # The following adjusts detection settings to what I've had the best luck with. Of course you may modify the settings as you like.
    sed -i s/mkv_time_offset=30.0/mkv_time_offset=0.0/g ${pkgdir}/etc/comskip/comskip.ini
    sed -i s/detect_method=43/detect_method=65/g ${pkgdir}/etc/comskip/comskip.ini
}
