# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=tmw-git
pkgver=20090718
pkgrel=1
pkgdesc="GIT version of The Mana World (TMW) - a serious effort to create an innovative free and open source MMORPG."
arch=('i686' 'x86_64')
url="http://themanaworld.org/"
license=('GPL')
depends=('curl' 'guichan' 'enet' 'libgl' 'libxml2' 'physfs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
makedepends=('git')
optdepends=('tmwmusic: game music')
provides=('tmw')
conflicts=('tmw' 'tmw-svn')
source=()
md5sums=()

_gitroot=git://gitorious.org/tmw/mainline.git
_gitname=tmw

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/$_gitname-build
  cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build
  cd ${srcdir}/$_gitname-build

   cd ${srcdir}/tmw
   autoreconf -i
   ./configure --prefix=/usr  #--without-opengl

   make || return 1
   make DESTDIR=${pkgdir} install
}
