# Maintainer: Benjamin Althues <benjamin@babab.nl>

pkgname=gitto-git
pkgver=20130523
pkgrel=1
pkgdesc="Keep track of your git repositories"
depends=('guile>=2.0.9')
arch=('any')
url="http://ryuslash.org/projects/gitto.html"
license=("GPL")

_gitroot=git://github.com/ryuslash/gitto.git
_gitname=master

build() {
    cd "$srcdir"

    if [ ! -d $pkgname ]; then
        git clone $_gitroot $pkgname;
        cd $pkgname
    else
        cd $pkgname
        git pull origin $_gitname
    fi

    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}
