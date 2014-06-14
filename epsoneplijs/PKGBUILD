# Contributor: TheGrudge <andi.clemens@gmx.net>
# Maintainer: Louie Chen <louie23@gmail.com>

pkgname=epsoneplijs
pkgver=0.4.1
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Epson EPL-5x00L/EPL-6x00L Printer Driver for ghostscript"
license=("custom")
url="http://sourceforge.net/projects/epsonepl/"
depends=('cups' 'ghostscript' 'libusb' 'foomatic-filters')
source=(http://nchc.dl.sourceforge.net/sourceforge/epsonepl/$pkgname-$pkgver.tgz
LICENSE
)
md5sums=('0840e15c6a96584138d9a1045c16997d'
'13d64edc89b1551e4c88be3b21d4a39a')

build() {
cd "$srcdir/$pkgname-$pkgver"
./configure --prefix=/usr --with-libusb
make || return 1
}

package() {
mkdir -p "$pkgdir/usr/bin"
cd "$srcdir/$pkgname-$pkgver"
make prefix="$pkgdir/usr" install

# install ppd
mkdir -p "$pkgdir/usr/share/foomatic/db/source/driver/"
cp "$srcdir"/"$pkgname-$pkgver"/foomatic/driver/*.* "$pkgdir/usr/share/foomatic/db/source/driver/"
mkdir -p "$pkgdir/usr/share/foomatic/db/source/opt/"
cp "$srcdir"/"$pkgname-$pkgver"/foomatic/opt/*.* "$pkgdir/usr/share/foomatic/db/source/opt/"
mkdir -p "$pkgdir/usr/share/foomatic/db/source/printer/"
cp "$srcdir"/"$pkgname-$pkgver"/foomatic/printer/*.* "$pkgdir/usr/share/foomatic/db/source/printer/"
mkdir -p "$pkgdir/usr/share/foomatic/db/source/PPD/Epson/"
cp "$srcdir"/"$pkgname-$pkgver"/foomatic_PPDs/Epson-EPL-*-cups.ppd.gz "$pkgdir/usr/share/foomatic/db/source/PPD/Epson/"
mkdir -p "$pkgdir/usr/share/cups/model/"
cp -av "$srcdir"/"$pkgname-$pkgver"/foomatic_PPDs/Epson-EPL-*-cups.ppd.gz "$pkgdir/usr/share/cups/model/"

# install license
cd "$srcdir"
install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
