# Contributor: Adriano Foschi <adriano DOT src AT gmail DOT com>

pkgname=wayland-dri2proto-git
pkgver=20090921
pkgrel=1
pkgdesc="X11 DRI extension wire protocol patched for Wayland display server"
arch=(i686 x86_64)
license='custom'
depends=('xorg-util-macros')
provides=('dri2proto' 'dri2proto-git')
conflicts=('dri2proto' 'dri2proto-git')
url="http://xorg.freedesktop.org/"
arch=(i686 x86_64)
source=(dri2-page-flip.diff)

_gitroot="git://git.freedesktop.org/git/xorg/proto/dri2proto"
_gitname="dri2proto"

build() {

 msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/$_gitname
  
  patch -Np1 -i "${srcdir}/dri2-page-flip.diff" || return 1
  
  sh autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}


md5sums=('31f2163a2e4f8cc266de63a4979a694e')
