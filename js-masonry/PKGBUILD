# Maintainer: Thomas Flucke
pkgname=js-masonry
pkgver=3.1.5
pkgrel=2
pkgdesc="Masonry is a JavaScript grid layout library. It works by placing elements in optimal 
position based on available vertical space, sort of like a mason fitting stones in a wall. "
arch=(any)
url="http://masonry.desandro.com/"
license=('MIT')

source=("http://masonry.desandro.com/masonry.pkgd.min.js")
md5sums=('4718bbecd682b9701ec534a0a582aab9')

package() {
    mkdir -p $pkgdir/usr/share/js-masonry
    cd $srcdir
    cp masonry.pkgd.min.js $pkgdir/usr/share/js-masonry
}

