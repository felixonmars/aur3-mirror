# Maintainer: Benjamin Althues <benjamin@babab.nl>

pkgname=gitto-git
pkgver=20130523
pkgrel=2
pkgdesc="Keep track of your git repositories"
depends=('guile>=2.0.9' 'git')
arch=('any')
url="http://ryuslash.org/projects/gitto.html"
license=("GPL3")
source=('git://github.com/ryuslash/gitto.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/gitto
    git log -1 --pretty=format:%cd --date=short | sed s/-//g
}

build() {
    cd "$srcdir"/gitto
    make
}

package() {
    cd "$srcdir"/gitto
    make DESTDIR="$pkgdir" install
}
