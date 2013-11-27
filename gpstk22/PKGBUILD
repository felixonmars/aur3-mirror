pkgname=gpstk22
pkgver=2.2
pkgrel=1

pkgdesc="Algorithms and frameworks supporting the development of processing and analysis applications in navigation and global positioning."
url="http://sourceforge.net/projects/gpstk"
license=('LGPL')

depends=()
makedepends=()
optdepends=()
provides=("gpstk=${pkgver}")
#conflicts=('gpstk')
replaces=("gpstk<=${pkgver}")

arch=('x86_64')

source=(http://downloads.sourceforge.net/project/gpstk/gpstk/2.2/gpstk-2.2.linux.x86_64.tar.gz)
md5sums=('b59a85c3819bb8d20ded7ae6da6cf050')

build() {
cd $srcdir/gpstk-$pkgver.linux.x86_64
mkdir $pkgdir/usr

cp -r $srcdir/gpstk-$pkgver.linux.x86_64/bin $pkgdir/usr
cp -r $srcdir/gpstk-$pkgver.linux.x86_64/include $pkgdir/usr
cp -r $srcdir/gpstk-$pkgver.linux.x86_64/lib $pkgdir/usr

}
