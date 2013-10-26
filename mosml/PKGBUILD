pkgname=mosml
pkgver=2.10
pkgrel=2
pkgdesc='Moscow ML is a light-weight implementation of Standard ML (SML)'
url="http://mosml.org"
license=('GPL')
arch=('i686' 'x86_64')

source=('https://github.com/kfl/mosml/archive/c25e10e2e2b02d1c1b88a065964a2616ccd8f40c.zip')
md5sums=('ed6f6c10e6830b8e27a910746fa8357a')

build() {
    cd mosml-c25e10e2e2b02d1c1b88a065964a2616ccd8f40c/src
    make PREFIX=/usr world
}

package() {
    cd mosml-c25e10e2e2b02d1c1b88a065964a2616ccd8f40c/src
    make PREFIX=/usr DESTDIR="$pkgdir" install

    # This isn't done by the Makefile
    cd ../man
    for manual in *.1; do
        install -Dm644 "$manual" "$pkgdir/usr/share/man/man1/$manual"
    done
}

