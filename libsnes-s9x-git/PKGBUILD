# Contributor: Themaister <maister@archlinux.us>

pkgname=libsnes-s9x-git
pkgver=20110612
pkgrel=1
pkgdesc="A libsnes API compatible wrapper for the SNES emulator SNES9x."
arch=('i686' 'x86_64')
url="http://snes9x.com/"
license=('custom')
makedepends=('pkgconfig')
provides=('libsnes')
conflicts=('libsnes')
makedepends=('git')

_gitroot="git://github.com/Themaister/snes9x-libsnes.git"
_gitname="libsnes9x"

build() 
{
   cd $srcdir

   msg "Cloning libsnes-s9x from GIT"
   if [ -d $_gitname ]; then
      cd $_gitname
      git pull || return 1
   else
      git clone $_gitroot $_gitname || return 1
      cd $_gitname
   fi

   cd unix
   ./configure
   make
}

package()
{
   mkdir -p $pkgdir/usr/lib
   install -m755 $srcdir/$_gitname/unix/libsnes.so $pkgdir/usr/lib
}

