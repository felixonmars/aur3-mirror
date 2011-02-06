# Contributor: Nicolas Joseph <nicolas.joseph@valaide.org>

# Changed from Val(a)IDE PKGBUILD to build
# only ctags : Guillaume Royer <perso@guilro.com>

pkgname=ctags-vala-support
pkgver=5.8
pkgrel=1
valide_rel=0.7.0
pkgdesc="Ctags version distributed with Val(a)IDE, with Vala support"
arch=('i686' 'x86_64')
url="http://www.valaide.org/"
license=('GPL3')
depends=('vala')
options=(!emptydirs)
md5sums=('d9e7d36266af3bd4c3ca592a8955285e')
source=(http://valide.googlecode.com/files/valide-$valide_rel.tar.gz)

build() {
cd "$srcdir/valide-$valide_rel"
touch "data/valide.desktop"

./waf configure --prefix=/usr
./waf --target=ctags-vala || return 1
./waf --target=ctags-vala install --destdir="$pkgdir"
cd "$pkgdir/usr"
rm -r lib
cd share
rm -r applications icons mime pixmaps valide
cd man/man1
rm valide*
}

