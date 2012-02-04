#Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-video-omapfb-git
pkgver=20110324
pkgrel=1
pkgdesc="X.org OMAP FB video driver (git)"
arch=('arm' 'i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('glibc')
makedepends=('pkgconfig' 'xorg-server')
options=('!libtool')
groups=('xorg' 'xorg-video-drivers')
source=()
md5sums=()
provides=('xf86-video-omapfb' 'xf86-video-omapfb-git')
conflicts=('xf86-video-omapfb')
replaces=('xf86-video-omapfb')

_gitroot="http://git.pingu.fi/xf86-video-omapfb"
_gitname="xf86-video-omapfb"

build() {

 msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

cd $startdir/src/$_gitname

  sh autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

}
md5sums=()

