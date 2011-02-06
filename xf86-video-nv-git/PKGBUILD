#Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>

pkgname=xf86-video-nv-git
pkgver=20080808
pkgrel=1
pkgdesc="X.org nv video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server-git')
options=('!libtool')
license=('custom')
groups=('xorg-video-drivers')
source=('nv-1.1.1-nv34-tweaks.patch')
md5sums=()
provides=('xf86-video-nv' 'xf86-video-nv-git')
replaces=('xf86-video-nv')
conflicts=('xf86-video-nv')

_gitroot="git://anongit.freedesktop.org/git/xorg/driver/xf86-video-nv"
_gitname="xf86-video-nv"

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

#patch -Np1 -i $startdir/src/nv-1.1.1-nv34-tweaks.patch || return 1

  sh autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
