# Contributor: Tyler Harper <tyler@cowboycoding.net>

pkgname=python-ficcle-git
pkgver=20091121
pkgrel=1
pkgdesc="An action based command line api"
arch=(any)
url="http://phrick.org/projects/"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('ficcle')
source=()
md5sums=()

_gitroot="git://github.com/knobe/ficcle.git"
_gitname="ficcle"

build() {
    cd $startdir/src
    msg "Connecting to the $_gitname git repository..."
    git clone $_gitroot

    msg "GIT checkout done or server timeout"
    msg "Starting setup..."

    cd $_gitname
    python setup.py build || return 1
    python setup.py install --prefix=/usr --root="$pkgdir"

    
}

