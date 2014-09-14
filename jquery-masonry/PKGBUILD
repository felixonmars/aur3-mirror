# Maintainer: Leo von Klenze <aur@leo.von-klenze.de>
pkgname=jquery-masonry
pkgver=3.1.5
pkgrel=1
pkgdesc="Masonry is a JavaScript grid layout library. It works by placing elements in optimal position based on available vertical space, sort of like a mason fitting stones in a wall. "
arch=(i686 x86_64)
depends=('jquery')
url="http://masonry.desandro.com/"
license=('MIT')

source=("http://masonry.desandro.com/masonry.pkgd.min.js")
md5sums=('4718bbecd682b9701ec534a0a582aab9')

package() {
    mkdir -p $pkgdir/usr/share/jquery/masonry
    cd $srcdir
    cp masonry.pkgd.min.js $pkgdir/usr/share/jquery/masonry
}

