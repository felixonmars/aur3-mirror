# Contributor: Petteri Tolonen <pretzel[at]mbnet.fi>

pkgname=freedink-git
pkgver=20080907
pkgrel=1
pkgdesc="A free, portable and enhanced version of the Dink Smallwood game engine."
arch=('i686' 'x86_64')
url="http://www.freedink.org/"
license=('GPL')
conflicts=('freedink')
replaces=('freedink')
depends=('sdl_mixer' 'libzip' 'sdl_ttf' 'sdl_image' 'sdl_gfx')
makedepends=('git' 'automake' 'help2man')
_gitroot='git://git.savannah.gnu.org/freedink.git'
_gitname='freedink'
source=()
md5sums=()

build() {

   cd $startdir/src

   msg "Connecting to git.savannah.gnu.org GIT server...."

   if [ -d $startdir/src/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
   else
      git clone $_gitroot
      cd $_gitname
   fi

   sh ./bootstrap
   ./configure --prefix=/usr
   make || return 1
   make install DESTDIR=$pkgdir || return 1

}
