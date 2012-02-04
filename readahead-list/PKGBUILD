# Contributor: exmethix <florian_aust@t-online.de>
# Contributor: whaevr <whaevr(at)archlinux(dot)us>

pkgname=readahead-list
pkgver=0.20050517.0220
pkgrel=2
pkgdesc="readahead-list allows users to load files into the page cache before they are needed, to accelerate program loading"
arch=("i686" "x86_64")
install=readahead.install
url="http://freshmeat.net/projects/readahead-list/"
license=('GPL')
depends=("gcc-libs")
source=(https://launchpad.net/ubuntu/jaunty/+source/${pkgname}/1:${pkgver}-1ubuntu5/+files/${pkgname}_${pkgver}.orig.tar.gz
https://launchpad.net/ubuntu/jaunty/+source/${pkgname}/1:${pkgver}-1ubuntu5/+files/${pkgname}_${pkgver}-1ubuntu5.diff.gz
readahead-list-desktop
readahead-watch-desktop)
md5sums=('a67ec6f8805ff67d3ff97570fa5be5ae'
         'e6fe46a225b68ce4fd91bb117151f58c'
         '969ad8fec93b7552ee9d5bb32d336bc5'
         '69f61172747338d6712413916408efc2')

build() {
mkdir ${pkgdir}/etc/
mkdir ${pkgdir}/etc/readahead
touch ${pkgdir}/etc/readahead/boot
touch ${pkgdir}/etc/readahead/desktop
mkdir -p ${pkgdir}/etc/rc.d/
cp readahead-list-desktop ${pkgdir}/etc/rc.d/
cp readahead-watch-desktop ${pkgdir}/etc/rc.d/
patch -p1 < ${pkgname}_${pkgver}-1ubuntu5.diff

cd "$srcdir/$pkgname-$pkgver"

for pat in ../debian/patches/*.patch; do
patch -p1 < $pat
done

./configure --prefix=/usr --mandir=/usr/share/man
make || return 1
make DESTDIR="$pkgdir/" install
}
