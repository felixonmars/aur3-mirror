# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=gtksozluk
pkgver=2.3
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="English->Turkish & Turkish->English dictionary."
license="GPL"
url="http://www.linuxprogramlama.com/index.php?p=gtksozluk2"
source=("http://www.linuxprogramlama.com/downloads/$pkgname-$pkgver.src.tar.gz"
        "http://www.dincercelik.com/gtksozluk2/ingtur-ing"
        "http://www.dincercelik.com/gtksozluk2/ingtur-tur")
md5sums=("df2d16a3d18fc565bd5e121cdde012b3"
         "3ca91abfb96a37aab50e181f86a4a0e0"
         "7049516744fc53da630fd27dd4382d79")
depends=("m4" "intltool")
makedepends=("make")

build() {
	cd "$srcdir/gtksozluk2"
	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=$pkgdir install
	install -D -m644 "$srcdir/ingtur-ing" "$pkgdir/usr/local/share/gtksozluk2/ingtur-ing"
	install -D -m644 "$srcdir/ingtur-tur" "$pkgdir/usr/local/share/gtksozluk2/ingtur-tur"
}
