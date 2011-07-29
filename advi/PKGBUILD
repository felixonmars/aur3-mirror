# Contributor: Skal pascal <dot> grosse <at> gmail <dot> com
# Contributor: danibspi danibspi <at> gmail <dot> com

pkgname=advi
pkgver=1.9
pkgrel=4
pkgdesc="Unix-platform DVI previewer and a programmable presenter for slides written in LaTeX."
arch=(i686 x86_64)
url="http://gallium.inria.fr/advi/"
license=('LGPL')
depends=('freetype2' 'libtiff' 'libxpm' 'libxinerama' 'libpng' 'libungif' 'tetex')
makedepends=('camlimages' 'ocaml' 'ocaml-findlib')
source=(http://gallium.inria.fr/advi/$pkgname-$pkgver.tar.gz)
install=advi.install
md5sums=('a636ee6ce45ab9332a06f57094c42bc3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    ./configure --prefix=/usr
   
    make || return 1
    
    make DESTDIR="$pkgdir" install
}
