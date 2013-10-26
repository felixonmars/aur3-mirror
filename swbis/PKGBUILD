# Maintainer: Brandon Invergo <brandon@invergo.net>
pkgname=swbis
pkgver=1.11
pkgrel=2
pkgdesc="A POSIX-compliant, distributed package management and administration system"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/swbis"
license=('GPL3')
depends=('zlib' 'bzip2' 'db' 'bash' 'gawk')
optdepends=('gnupg: package signing')
options=(!buildflags)
install=swbis.install
source=("http://ftpmirror.gnu.org/swbis/$pkgname-$pkgver.tar.gz"
        $pkgname-$pkgver-force-USE_XOPEN.patch
        $pkgname-$pkgver-fix-gawk-version-check.patch
        $pkgname-$pkgver-fix-gnupg-version-check.patch
        $pkgname-$pkgver-swign-use-sha2.patch)
md5sums=('ddf6a63ef4a0fa10b1ec940283751956'
         '5bd992d93e388d9e551af550f4a1041d'
         '803ccb49afe2b42945aa01dc258f0459'
         '9e3c1d12d2909eccc4e2169c23466e16'
         '2ecd063fd295936cb15cf74ab9eeece0')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver-force-USE_XOPEN.patch"
    patch -p1 -i "$srcdir/$pkgname-$pkgver-fix-gawk-version-check.patch"
    patch -p1 -i "$srcdir/$pkgname-$pkgver-fix-gnupg-version-check.patch"
    patch -p1 -i "$srcdir/$pkgname-$pkgver-swign-use-sha2.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    if test "$CARCH" == x86_64; then
        ./configure CFLAGS="-march=native -pipe -fstack-protector --param=ssp-buffer-size=4 -O1 -D_FILE_OFFSET_BITS=64" \
            LDFLAGS="-Wl,-O1,--sort-common,-z,relro,--hash-style=gnu" --prefix=/usr \
            --libexecdir='/usr/lib' --with-self-rpm
    else
	    ./configure CFLAGS="-march=native -fstack-protector -O1" \
            LDFLAGS="-Wl,-O1,--sort-common,-z,relro,--hash-style=gnu" \
            --prefix=/usr --libexecdir='/usr/lib' --with-self-rpm
    fi
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
