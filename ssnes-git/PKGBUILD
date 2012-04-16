#Contributor <Themaister> <maister@archlinux.us>

pkgname=ssnes-git
pkgver=20120416
pkgrel=1
pkgdesc="Simple frontend for the libretro API."

url="http://github.com/Themaister/SSNES"
arch=('i686' 'x86_64')

license=('GPL')
depends=('sdl>=1.2.10')
optdepends=('libretro-super-git: A collection of many libretro implementations.')
makedepends=('git')

_gitroot="git://github.com/Themaister/SSNES.git"
_gitname="ssnes"

build() 
{
   cd $srcdir

   msg "Cloning SSNES from GIT"
   if [ -d $_gitname ]; then
      cd $_gitname
      git pull || return 1
   else
      git clone $_gitroot $_gitname || return 1
      cd $_gitname
   fi

   ./configure --prefix=/usr
   make || return 1
}

package()
{
   mkdir -p $pkgdir/etc
   mkdir -p $pkgdir/usr/bin
   mkdir -p $pkgdir/usr/share/man/man1
   cd $srcdir/$_gitname
   make install DESTDIR=$pkgdir || return 1
}


