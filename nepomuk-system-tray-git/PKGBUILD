pkgname=nepomuk-system-tray-git
pkgver=20110122
pkgrel=1
pkgdesc='More enchanced system tray for Nepomuk'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kdebase-workspace>=4.6')
makedepends=('cmake' 'git')


_gitroot="git://anongit.kde.org/nepomuk-system-tray"
_gitname="nepomuk-system-tray"

build() {

cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  
  mkdir $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build

  cmake $startdir/src/$_gitname -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
 rm -r $srcdir/$_gitname-build
}