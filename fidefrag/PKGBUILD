# Contributor Diego Ferigo <dieghen89@gmail.com>
pkgname=fidefrag
pkgver=2.11
pkgrel=3
pkgdesc="Filesystem independent file defragmenter written in Python"
url="https://launchpad.net/fidefrag"
license=('GPL')
arch=('i686')
source=(https://launchpad.net/~chameleondave/+archive/ppa/+files/${pkgname}_${pkgver}-0ubuntu1~ppa2_all.deb)
depends=('lsof' 'findutils' 'rsync' 'e2fsprogs' 'psyco' 'sudo')
provides=('fidefrag')
makedepends=('python')
md5sums=('f12ac81a2c1637d01039a0267e207ee4')

build()
{
cd ${srcdir}
bsdtar xf "${pkgname}_${pkgver}-0ubuntu1~ppa2_all.deb" || return 1
bsdtar xf data.tar.gz -C $pkgdir || return 1
}
