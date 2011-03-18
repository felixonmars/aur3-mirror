# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=akonadi-facebook-git
pkgver=20110318
pkgrel=1
pkgdesc="Facebook support for KDE PIM"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('libxslt' 'qjson')
makedepends=('pkgconfig' 'cmake' 'git')
 
_gitroot="git://anongit.kde.org/akonadi-facebook"
_gitname="akonadi-facebook"
 
build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  if [ ! -d ${srcdir}/$_gitname-build ]; then
	  mkdir $srcdir/$_gitname-build
  fi
  
  cd $srcdir/$_gitname-build
 
  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=debugfull -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
  rm -r $srcdir/$_gitname-build
}
