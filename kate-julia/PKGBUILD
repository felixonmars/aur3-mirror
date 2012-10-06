# Contributer: giacomogiorgianni@gmail.com 

pkgname=kate-julia
pkgver=1
pkgrel=1
pkgdesc="Plugin Syntax highlighting for Julia language for kate editor"
arch=('any')
url="http://julialang.org"
license=('GPL')
categories=()
depends=('kdebase-katepart')
makedepends=()
options=(!emptydirs)
source=("http://opendesktop.org/CONTENT/content-files/154531-julia-katepart-syntax.tar.gz")
md5sums=('8d0080aea469bf3a5b155dbaf977bc38')

build() {
install -dm 755 $pkgdir/usr/share/apps/katepart/syntax
cp $srcdir/julia.xml $pkgdir/usr/share/apps/katepart/syntax
}
