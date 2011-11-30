#Contributor <Themaister> <maister@archlinux.us>

pkgname=ssnes-phoenix-git
pkgver=20111130
pkgrel=1
pkgdesc="Simple launcher for SSNES."

url="http://github.com/Themaister/SSNES-Phoenix"
arch=('i686' 'x86_64')

license=('GPL')
depends=('gtk2' 'ssnes-git')

_gitroot="git://github.com/Themaister/SSNES-Phoenix.git"
_gitname="ssnes-phoenix"

build() 
{
   cd $srcdir

   msg "Cloning SSNES-Phoenix from GIT"
   if [ -d $_gitname ]; then
      cd $_gitname
      git pull || return 1
   else
      git clone $_gitroot $_gitname || return 1
      cd $_gitname
   fi

   make || return 1
}

package()
{
   mkdir -p $pkgdir/usr/bin
   cd $srcdir/$_gitname
   mkdir -p "$pkgdir/usr/bin"
   mkdir -p "$pkgdir/usr/share/icons"
   mkdir -p "$pkgdir/usr/share/applications"
   make install PREFIX=/usr DESTDIR="$pkgdir" || return 1
}


