# Maintainer: Laszlo Papp <djszapi at archlinux dot us>

pkgname=parched-git
pkgver=20091219
pkgrel=2
pkgdesc="A Pacman package and PKGBUILD parser module"
arch=('i686' 'x86_64')
url="http://github.com/sebnow/parched"
license=('MIT')
depends=('git' 'python')
source=(LICENSE)
md5sums=('31eccf56949504b5ce33110068948cf2')

_gitroot="git://github.com/sebnow/parched.git"
_gitname="parched"

build() {
    cd "$srcdir"
    msg "Connecting to the parched git repository..."

    if [ -d "$srcdir/$_gitname" ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd $srcdir/$_gitname
	python setup.py build || return 1
	python setup.py install --root=$pkgdir --optimize=1 || return 1
	install -D -m644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
