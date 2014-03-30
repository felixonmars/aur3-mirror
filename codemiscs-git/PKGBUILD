# Contributor: Jonathan Arnold <jdarnold@buddydog.org

pkgname=codemiscs-git
pkgver=0.0.0
pkgrel=1
pkgdesc="functional shell made fun"
arch=('i686' 'x86_64')
url="http://code.google.com/p/codemiscs"
license=('GPL3')
depends=('')
makedepends=('git')
conflicts=('codemiscs')
provides=('codemiscs')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source="git+https://code.google.com/p/codemiscs"
md5sums=('SKIP')

_gitname="codemiscs"

pkgver() {
 cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    autoreconf -i
    ./configure --prefix=/usr/local
    make
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

