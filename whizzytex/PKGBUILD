# Contributor: Skal pascal <dot> grosse <at> gmail <dot> com

pkgname=whizzytex
pkgver=1.3.3
pkgrel=1
pkgdesc="Minor mode for (X)emacs for incremental viewing of LaTeX documents."
arch=(i686 x86_64)
url="http://cristal.inria.fr/whizzytex/"
license=('GPL2')
depends=('emacs' 'tetex' 'advi')
makedepends=()
source=(http://cristal.inria.fr/whizzytex/$pkgname-$pkgver.tgz)
md5sums=('70888cc9e6d32dfe29ac306654201557')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    function myinitex {
    	     latex -ini "$*"
    }   

    ./configure -initex myinitex -prefix /usr -emacsdir '!' || return 1
   
    make config.force || return 1

    make all || return 1
    
    make DESTDIR="$pkgdir" install
}
