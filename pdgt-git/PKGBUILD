#Maintainer: Clynamen <clynamen@gmail.com> 
pkgname=pdgt-git 
pkgver=20110715 
pkgrel=1 
pkgdesc="translator for desktop" 
arch=('any') 
license=('GPL') 
url='http://clynamen.wordpress.com/2011/07/15/pdgt/' 
depends=('python') 
makedepends=('git') 
noextract=() 

_gitroot="git://github.com/clynamen/pdgt.git"
_gitname="pdgt"
   
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
     echo `pwd`
     mkdir -p $pkgdir/usr/bin/
     cp pdgt/pdgt $pkgdir/usr/bin/ 
     chmod 755 $pkgdir/usr/bin/pdgt 
       }

