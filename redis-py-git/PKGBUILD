# Contributor: Frank Smit <frank@61924.nl>
pkgname=redis-py-git
pkgver=20100305
pkgrel=2
pkgdesc='Redis Python Client'
arch=(any)
url='http://github.com/andymccurdy/redis-py'
license=('MIT')
depends=('python2' 'redis')
makedepends=('git' 'setuptools')
source=('LICENSE')
md5sums=('f6df3f49a749da1f9e12816eda900b61')

_gitroot='git://github.com/andymccurdy/redis-py.git'
_gitname='redis-py'

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    python2 setup.py install --root="$pkgdir" --prefix=/usr || return 1
    install -D -m644 $startdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
