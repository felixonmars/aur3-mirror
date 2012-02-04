pkgname=xf86-video-via-git
pkgver=20070131
pkgrel=1
pkgdesc="X.org drivers for VIA chipset based videocards from GIT repository"
arch=(i686 x86_64)
url="http://www.freedesktop.org/"
depends=('unichrome-dri' 'libgl')
makedepends=('pkgconfig' 'xorg-server>=1.1.1' 'xf86driproto')
options=('nolibtool')
provides=('xf86-video-via')
replaces=('xf86-video-via')
conflicts=('openchrome' 'openchrome-svn' 'xf86-video-via')
groups=('xorg-video-drivers')
source=()
md5sums=()
_gitroot="git://anongit.freedesktop.org/xorg/driver/xf86-video-via"
_gitname="xf86-video-via"

build() {
  cd $startdir/src
  msg "Connecting to git.freedesktop.org GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git-pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-dri \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
