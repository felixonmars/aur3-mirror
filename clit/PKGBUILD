# Maintainer: gDD (usrgdd | gmail)
# Credits: cantabile

# ChangeLog:
# 2010-01-15:
#       I found libtom.org down, and 'github.com/libtom/libtommath'
#       is not a prefered way! so changed url to netbsd ftp.
#       pkgrel remains 4 since nothing changed but a url
# 0000-00-00
#       i forgot older changes

pkgname=clit
pkgver=1.8
pkgrel=4
pkgdesc="An extractor/converter for .LIT eBooks (Microsoft Reader's format)"
arch=('i686' 'x86_64')
url="http://www.convertlit.com/"
license=('GPL')
groups=()
depends=()
makedepends=('sed')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://www.convertlit.com/clit18src.zip \
        ftp://ftp.netbsd.org/pub/NetBSD/packages/distfiles/ltm-0.42.0.tar.bz2)
noextract=()
md5sums=('d691d4729485fe5d73e3f0937d8fb42e'
         '7380da904b020301be7045cb3a89039b')

build() {
    cd "$srcdir/libtommath-0.42.0"
    make
    cd ../lib/
    make
    cd ../clit18/
    sed -i 's|libtommath-0.30|libtommath-0.42.0|' Makefile
    make
}

package() {
    install -D -m755 "$srcdir/clit18/clit" "$pkgdir/usr/bin/clit"
}

