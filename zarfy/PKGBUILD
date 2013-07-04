# Maintainer: alister.hood <gmail>
# Submitter: petris <petris at penguin dot net>
pkgname=zarfy
pkgver=0.1.0
pkgrel=2
pkgdesc="A nice GUI to RandR written in GTK"
url="http://sourceforge.net/projects/zarfy/"
license="GPL"
arch=('i686' 'x86_64')
depends=(libglade libxrandr)
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}-${pkgver}.tar.bz2")
md5sums=(c339b9631da00c869b4d65b94fb662c9)

build() {
cd "$srcdir/${pkgname}-${pkgver}"
LIBS="-lm -lX11" ./configure --disable-debug --prefix=/usr
make
}

package() {
cd "$srcdir/${pkgname}-${pkgver}"
install -m 755 -D src/zarfy "$pkgdir"/usr/bin/zarfy
for file in data/*; do
install -m 644 -D $file "$pkgdir"/usr/share/zarfy/`basename $file`
done
install -m 644 -D man/zarfy.1.gz "$pkgdir"/usr/share/man/man1/zarfy.1.gz
} 
