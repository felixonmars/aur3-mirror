# Maintainer: Facundo Bianco (vando) <facundo{at}esdebian{dot}org>
pkgname=qataki
pkgver=0.05
pkgrel=2
pkgdesc="A command line Identi.ca/StatusNet/Twitter client"
arch=('any')
url="http://chr.tx0.org/qataki/"
license=('Unlicense')
depends=('elinks' 'curl' 'par')
provides=("qataki")
source=(https://github.com/chr/qataki/archive/master.zip)
md5sums=('58b4046af8e98a2fad517542ba1a4ed7')


package() {
        cd $srcdir/qataki-master

        install -Dm755 qataki    $pkgdir/usr/bin/qataki
        install -Dm644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE
}

