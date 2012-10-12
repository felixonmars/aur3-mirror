# Contributor: Abdallah Aly <l3thal8 @gmail .com>

pkgname=luasvn
pkgver=0.4.0
pkgrel=1
pkgdesc="provides a basic set of SVN functions for using some Subversion facilities from Lua"
arch=(i686 x86_64)
url="http://luaforge.net/projects/luasvn/"
license=('custom:LabLua')
depends=()
makedepends=()
source=(http://luaforge.net/frs/download.php/4131/$pkgname-$pkgver.tar.gz)
md5sums=(0a842b3414c99007b19982893566a238) #generate with 'makepkg -g'

build() {

cd "$srcdir/$pkgname-$pkgver/src/"
#steps here 

sed -i 's/apr\-1\.0/apr\-1/' makefile || return 1
sed -i 's/^LIBS=.*/LIBS=\-lsvn\_client\-1 \-lsvn\_repos\-1/' makefile || return 1
sed -i "1i\#include <apr_xlate.h>" luasvn.c || return 1

make || return 1
mkdir -p $pkgdir/usr/lib/lua/5.1 || return 1
cp svn.so $pkgdir/usr/lib/lua/5.1 || return 1


}

