# Contributor: Ryan Coyner <rcoyner@gmail.com>
pkgname=waveutils
pkgver=1.19
pkgrel=1
pkgdesc="Programs for dealing with WAVE format audio files"
arch=('i686')
url="http://billposer.org/Software/waveutils.html"
license=('GPL')
depends=('glibc')
source=(http://billposer.org/Software/Downloads/$pkgname-$pkgver.tar.gz)
md5sums=('fe9de9f6df990015ebf503cb46440a3b')

build() { 
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
}
