# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>
# Last Contributor: Dmitriy Morozov <archlinux@foxcub.org>
pkgname="lunatic-python-5.1"
_pkgrealname="lunatic-python"
pkgver=1.0
pkgrel=1
pkgdesc="Bidirectional Lua-Python bridge."
url="http://labix.org/lunatic-python"
arch=('i686' 'x86_64')
license=("GPL")
depends=('python2' 'lua51') 
source=(http://labix.org/download/lunatic-python/$_pkgrealname-$pkgver.tar.bz2 lua5.1.patch)
md5sums=('4044274f14e57f26384e2f9cfc348f30'
         '5394cb65fa0bfb3ff49b2b8071c99818')

build() {
    cd $srcdir/$_pkgrealname-$pkgver
    patch -p1 < $srcdir/lua5.1.patch
    python2 setup.py build
    python2 setup.py install --prefix=$pkgdir/usr
    mkdir -p $pkgdir/usr/share/lua/5.1/
    cp $srcdir/$_pkgrealname-$pkgver/python.lua $pkgdir/usr/share/lua/5.1/
}
