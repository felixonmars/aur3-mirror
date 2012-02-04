# Contributor: Dmitriy Morozov <archlinux@foxcub.org> 
pkgname=lunatic-python
pkgver=1.0
pkgrel=3
pkgdesc="Bidirectional Lua-Python bridge."
url="http://labix.org/lunatic-python"
arch=('i686' 'x86_64')
license="GPL" 
depends=('python2') 
source=(http://labix.org/download/$pkgname/$pkgname-$pkgver.tar.bz2 setup.patch lua5.1.patch python.patch)

build() 
{ 
    cd $startdir/src/$pkgname-$pkgver
    patch setup.py < $startdir/src/setup.patch
    patch -p1 < $startdir/src/lua5.1.patch
    patch -p1 < $startdir/src/python.patch
    python2 setup.py build
    python2 setup.py install --prefix=$startdir/pkg/usr

    mkdir -p $startdir/pkg/usr/share/lua/5.1/
    cp $startdir/src/$pkgname-$pkgver/python.lua $startdir/pkg/usr/share/lua/5.1/
}
md5sums=('4044274f14e57f26384e2f9cfc348f30'
         '89a5c14cb21eff582654d42cb7080c69'
         'f5a7d850814546e9d290f5bfcb9b9adc'
         'ea95d65a63c938dba58c3a5e64c7e340')
