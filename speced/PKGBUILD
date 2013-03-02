# Contributor: <kontakt.zuf(at)gmail.com>
pkgname=speced
pkgver=0.3
pkgrel=3
pkgdesc="SpecEd allows you to work with visible light spectrum. It can compute CIE coordinate for any combination of spectral colors and convert it to sRGB."
url="http://malat.biz/view/Projects/SpecEd"
depends=('qt4>=4.3.0')
makedepends=('qt4>=4.3.0')
conflicts=('speced')
arch=('i686' 'x86_64')
replaces=('speced')
backup=()
source=("http://malat.biz/foswiki/pub/Projects/SpecEd/speced-src.tar.bz2" "speced_arch.patch")
md5sums=('1b2d2bde5ff7b8ab6d3eeae56d0439bc'
         '8227720de1e731bf4c5db372eec52025')
license=('GPL')

build() {
    cd $startdir/src/$pkgname
    #cd $srcdir/$srcdir
    patch -p1 -i $srcdir/speced_arch.patch
    qmake-qt4
    make || return 1
    mkdir -p "$pkgdir/usr/bin"
    cp $pkgname "$pkgdir/usr/bin"
}