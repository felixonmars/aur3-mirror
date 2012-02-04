# Maintainer: Ananda Samaddar <ananda@samaddar.co.uk>
pkgname=deadbeef-fb-git
pkgver=20110609
pkgrel=1
pkgdesc="File Browser plugin for the Deadbeef Music Player"
url="http://sourceforge.net/projects/deadbeef-fb/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('deadbeef')
makedepends=('autoconf' 'autogen' 'automake' 'git' 'intltool' )

 
_gitname=deadbeef-fb
_gitroot=git://deadbeef-fb.git.sourceforge.net/gitroot/${_gitname}/${_gitname}
 
build() {
  cd $srcdir
  msg "Connecting to GIT server...."
  rm  -rf $srcdir/$_gitname-build
 
  if [ -d $_gitname ]; then
   cd $_gitname
   git pull
    else
   git clone $_gitroot
     fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
 
  cd $srcdir/${_gitname}
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}