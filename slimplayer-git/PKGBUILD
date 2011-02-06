#Contributor <Themaister> <maister@archlinux.us>

pkgname=slimplayer-git
pkgver=20101219
pkgrel=1
pkgdesc="Simple and Lightweight Media Player."

url="http://github.com/Themaister/SLIMPlayer"
arch=('i686' 'x86_64')

license=('GPL')
depends=('glfw' 'nvidia-cg-toolkit' 'alsa-lib' 'ffmpeg' 'libass')
makedepends=('git' 'gcc>=4.5')

_gitroot="git://github.com/Themaister/SLIMPlayer.git"
_gitname="SLIMPlayer"

build() 
{
   cd $srcdir
   msg "Connection to GIT server ..."

   if [ -d $_gitname ]; then
      cd $_gitname
      git pull
   else
      git clone $_gitroot
      cd $_gitname
   fi

   msg "Git checkout done."

	make
}

package()
{
   mkdir -p $pkgdir/usr/bin
   cd $srcdir/$_gitname
	make DESTDIR=$pkgdir PREFIX=/usr install
}

