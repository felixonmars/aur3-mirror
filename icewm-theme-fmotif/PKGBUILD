#Maintainer: karnath <karnathtorjian@gmail.com>

pkgname=icewm-theme-fmotif
pkgver=1
pkgrel=1
pkgdesc="icewm theme , looks like old motif theme"
arch=('any')
depends=('icewm')
license=('CCPL')
url="http://www.box-look.org/"
source=("http://box-look.org/CONTENT/content-files/141670-FMotif.tar.gz")
md5sums=('c656f5a5f2d706658ba61faa75ac8db0')

build() {
    mkdir -p $pkgdir/usr/share/icewm/themes/FMotif
    cp -a $srcdir/FMotif/* $pkgdir/usr/share/icewm/themes/FMotif/
}


