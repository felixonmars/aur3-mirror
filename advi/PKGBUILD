# Contributor: Skal pascal <dot> grosse <at> gmail <dot> com
# Contributor: danibspi danibspi <at> gmail <dot> com

pkgname=advi
pkgver=1.10.1
pkgrel=1
pkgdesc="Unix-platform DVI previewer and a programmable presenter for slides written in LaTeX."
arch=(i686 x86_64)
url="http://gallium.inria.fr/advi/"
license=('LGPL')
depends=('freetype2' 'libtiff' 'libxpm' 'libxinerama' 'libpng' 'libungif' 'tetex')
makedepends=('camlimages' 'ocaml' 'ocaml-findlib')
source=(http://gallium.inria.fr/advi/$pkgname-$pkgver.tar.gz)
#install=advi.install
md5sums=('616483cc3cf1cba13d897152603b6008')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    ./configure --prefix=/usr
   
    # temp fix to remove doc building (currently broken, at least for me)
    sed -i "s/SUBDIRS = src tex doc/SUBDIRS = src tex #doc/" Makefile

    make || return 1
    
    make DESTDIR="$pkgdir" install
}

