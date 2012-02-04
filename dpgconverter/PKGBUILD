# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=dpgconverter
pkgver=9
pkgrel=2
pkgdesc="This is a converter to produce DPG movies for Moonshell software for Nintendo DS."
arch=('i686' 'x86_64')
url="http://theli.is-a-geek.org/blog/static/dpgconv"
license=('GPL2')
depends=('mpeg_stat' 'mplayer' 'python-imaging')
source=(http://theli.is-a-geek.org/files/dpgconv/dpgconv-$pkgver.py.bz2)

build() {

install -m755 -D $srcdir/dpgconv-$pkgver.py $pkgdir/usr/bin/dpgconverter

}
md5sums=('fa61ceb4ebb241e98fc005aed86406e5')
