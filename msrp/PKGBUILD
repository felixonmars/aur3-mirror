# Contributor: mosra <mosra@centrum.cz>

pkgname=msrp
pkgver=0.9.4
pkgrel=2
pkgdesc="Meta search and replace tool for both filenames and files"
arch=('i686' 'x86_64')
url="http://agateau.wordpress.com/2010/03/10/msrp-a-useful-addition-to-your-toolbo/"
license=("unknown")
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
    "http://ftp.de.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
    "${pkgname}-${pkgver}-0001-git-support.diff"
    "${pkgname}-${pkgver}-0002-bzr-support.diff"
)
noextract=()
md5sums=('cc327c68f89bbf2466b167371fc34213'
         '9b7cf87f7b05b18cca527b353410b0be'
         '22c98a07639a8701c571226a42093c7c')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # patch for GIT and Bazaar support
    patch -p1 < "$srcdir/msrp-0.9.4-0001-git-support.diff"
    patch -p1 < "$srcdir/msrp-0.9.4-0002-bzr-support.diff"

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
}
