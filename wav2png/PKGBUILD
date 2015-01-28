# Maintainer: Alexander Werner <bundeswerner@gmail.com>
pkgname=wav2png
pkgver=r91.4032734
pkgver() {
    cd "$srcdir/$pkgname"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
pkgrel=1
pkgdesc="create waveform pngs out of audio files"
arch=('i686' 'x86_64')
url="https://github.com/beschulz/wav2png"
license=('GPL')
depends=('libsndfile' 'boost-libs' 'libpng')
makedepends=('boost' 'png++')
source=(git+https://github.com/beschulz/wav2png.git)
md5sums=('SKIP')

#prepare() {
#	cd "$srcdir/$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$srcdir/$pkgname/build"
	make
}

package() {
	cd "$srcdir/$pkgname/bin/Linux"
	install -d $pkgdir/usr/bin/
	install wav2png $pkgdir/usr/bin/
	

}
