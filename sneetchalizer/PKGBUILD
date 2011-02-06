# Contributor: Joe Sapienza <joe@evilgold.net>
pkgname=sneetchalizer
pkgver=0.9.0
pkgrel=1
pkgdesc="The sneetchalizer is a Ruby script which converts between several different audio file formats and tries to preserve meta tags if they exist or create them if they don't.."
arch=(i686 x86_64)
url="http://badcomputer.org/unix/code/sneetchalizer/"
license=('GPL')
depends=(ruby)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://badcomputer.org/unix/code/sneetchalizer/src/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('3ee42409e596f0764542d16aefd9b0db')

build() {
    mkdir -p $startdir/pkg/usr/bin;
    mkdir -p $startdir/pkg/usr/share/man/man1;

    cd $startdir/src/$pkgname-$pkgver;
    cp sneetchalizer $startdir/pkg/usr/bin;
    cp sneetchalizer.1 $startdir/pkg/usr/share/man/man1;
}
