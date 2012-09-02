pkgname=linnya-git
pkgver=20120902
pkgrel=1
pkgdesc="Linnya Audio Player"
url="http://www.linnya.org"
arch=('i686' 'x86_64')
license=("GPLv3")
depends=('gtk3' 'sqlite3' 'gstreamer0.10' 'gstreamer0.10-base' \
         'gstreamer0.10-good' 'gstreamer0.10-good-plugins' \
         'curl')
makedepends=('git')
conflicts=(linnya)
replaces=()
backup=()
source=()
md5sums=('10a157b86d528bca2be6731c5eaff7b3')

_gitroot="git://github.com/herenvarno/linnya"
_gitname="linnya"

build() {
  cd $startdir/src
  msg "Connecting to github.com GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  	cd $_gitname && git pull origin
  	msg "The local files are updated."
  else
  	git clone $_gitroot --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  ./autogen
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  find $startdir/pkg -type f -name '*.la' -exec rm {} \;
} 
