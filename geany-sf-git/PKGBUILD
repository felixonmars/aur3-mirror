# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=geany-sf-git
pkgver=20131207
pkgrel=1
pkgdesc="Fast and lightweight IDE (git version)"
arch=('x86_64' 'i686')
url="http://git.code.sf.net/p/geany"
license=('GPL2')
depends=('gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'automake' 'autoconf' 'intltool')
conflicts=('geany' 'geany-git')
provides=('geany')
source=("git://git.code.sf.net/p/geany/git.git")
md5sums=('SKIP')

_gitroot="git"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g' 
}

build() {
    cd "$srcdir/$_gitroot"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

