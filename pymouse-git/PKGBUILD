# Contributor: Hylix <hylixx@gmail.com>
pkgname=pymouse-git
pkgver=20111104
pkgrel=1
pkgdesc="Cross-platform mouse control with Python"
url="http://github.com/pepijndevos/PyMouse/"
license="GPL"
arch=('any')
depends=('python2' 'python-xlib')
makedepends=()
conflicts=('pymouse')
provides=('pymouse')
source=()
md5sums=()

_gitroot="git://github.com/pepijndevos/PyMouse"
_gitname="PyMouse"

build() {
    msg "Connecting to github.com GIT server...."

    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd $srcdir/$_gitname
    python2 setup.py install --root=${pkgdir} --prefix=/usr || return 1
 }
