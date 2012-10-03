# Maintainer: b.w@gmx.tm
pkgname=buildcounter
pkgver=34
pkgrel=1
pkgdesc="Automatic build counter for your C/C++ projects and makefiles"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Ragnara/buildcounter"
license=('custom:ISC')
groups=()
depends=('glibc')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://bitbucket.org/Ragnara/buildcounter/get/77c5b4a2ce9c.tar.bz2)
noextract=()
md5sums=('4cf476035a3434d17190de6b8cdde897')

build() 
{
    [ -d "$srcdir/$pkgname-$pkgver" ] || mv "$srcdir/Ragnara-buildcounter-77c5b4a2ce9c" "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    make -e CC=gcc buildcounter
    make manpage
}

package() 
{
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/" 
    mkdir -p "$pkgdir/usr/share/licenses/buildcounter/"
    mkdir -p "$pkgdir/usr/share/man/man1/"
    cp buildcounter "$pkgdir/usr/bin/"
    cp LICENSE "$pkgdir/usr/share/licenses/buildcounter/"
    cp buildcounter.1.gz "$pkgdir/usr/share/man/man1/"
}
