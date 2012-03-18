# Contributor: Themaister <maister@archlinux.us>
pkgname=libsnes-super-git
pkgver=20120318
pkgrel=1
pkgdesc="A collection of libsnes implementations for SSNES."
arch=('i686' 'x86_64')
url="https://github.com/Themaister/libsnes-super"
license=('various')
provides=('libsnes')

_gitroot="git://github.com/Themaister/libsnes-super.git"
_gitname="libsnes-super"

build() 
{
   cd "$srcdir"
   if [ -d "$_gitname" ]; then
      cd "$_gitname"
      git pull "$_gitroot"
   else
      git clone "$_gitroot" "$_gitname"
      cd "$_gitname"
   fi
   
   ./libsnes-fetch.sh
   ./libsnes-build.sh
}

package()
{
   cd "$srcdir/$_gitname"
   ./libsnes-install.sh "$pkgdir/usr/lib/libsnes"
}

