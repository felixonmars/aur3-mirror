pkgname=pidgin-plus-git
pkgver=20100513
pkgrel=1
pkgdesc="A Pidgin plugin which parses the Plus! tags in the buddy list."
arch=('i686' 'x86_64')
url="http://polpoinodroidi.com/2009/10/01/pidgin-plus-con-gradienti"
license=('GPL')
depends=('pidgin')
provides=('pidgin-plus')
conflicts=('pidgin-plus')
makedepends=('pkgconfig' 'git')
source=()

_gitroot="git://github.com/frasten/pidgin-plus"
_gitname="pidgin-plus"

build() {
cd $startdir/src/

  cd $startdir/src
  msg "Connecting to git.cairographics.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

 cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
 cd $startdir/src/$_gitname-build

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	
	rm -rf ${startdir}/src/${_gitname}-build
} 
