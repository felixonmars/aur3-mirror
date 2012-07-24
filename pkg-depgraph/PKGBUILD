# Maintainer: Limao Luo <luolimao@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=pkg-depgraph
pkgver=0.2
pkgrel=2
pkgdesc="A simple program to generate a dot dependency graph for a package"
arch=('i686' 'x86_64')
url="http://bbs.archlinux.org/viewtopic.php?pid=511391#p511391"
license=('GPL')
depends=('pacman')
makedepends=('chicken-regex')
source=(pkg-depgraph.scm)
md5sums=('79978c37808771afb5fbc65921a8bc82')

build() {
    cd $srcdir
    csc -static-libs -O2 $pkgname.scm
    install -Dm 755 pkg-depgraph $pkgdir/usr/bin/pkg-depgraph
}

# vim:set ts=2 sw=2 et:
