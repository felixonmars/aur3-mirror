# Contributor: Tyler Harper <tyler@cowboycoding.net>

pkgname=python-snooze-git
pkgver=20091121
pkgrel=1
pkgdesc="A generic RESTful API generator in python"
arch=(any)
url="http://phrick.org/projects/"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('snooze')
source=()
md5sums=()

_gitroot="git://github.com/knobe/snooze.git"
_gitname="snooze"

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

