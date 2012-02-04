#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=pymemphis
pkgver=20100920
pkgrel=1
pkgdesc="Provides Python bindings for libmemphis"
arch=('i686' 'x86_64')
url="http://gitorious.net/pymemphis"
license=('GPL2')
depends=('memphis' 'cairo' 'glib2')
makedepends=('git' 'autoconf')
options=('!libtool')
source="patch"
md5sums=('95332692cf1b64556bdf7e17b4e314ec')

_gitroot="git://gitorious.org/pymemphis/mainline.git"
_gitname="mainline"

build() 
{

 cd "$srcdir"

   msg "Connecting to GIT server...."

    if [ -d "$srcdir/$_gitname" ] ; then
 
    cd $_gitname && git pull origin
    
    msg "The local files are updated."
    
  else
  
    git clone $_gitroot
    
  fi

   msg "GIT checkout done or server timeout"

   rm -rf ${srcdir}/${_gitname}-build

   cp -Lr  ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
        
   cd ${srcdir}/${_gitname}-build

   patch -uNi $srcdir/patch

   ./autogen.sh --prefix=/usr PYTHON=/usr/bin/python2 

   make

   make DESTDIR=$pkgdir install
}



