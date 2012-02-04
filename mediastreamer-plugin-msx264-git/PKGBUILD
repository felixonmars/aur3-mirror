pkgname=mediastreamer-plugin-msx264-git
pkgver=20101017
pkgrel=1
pkgdesc="msx264 - a GPL plugin to bring video H264 encoding/decoding capabilities to mediastreamer2 applications."
arch=(i686 x86_64)
url="http://www.linphone.org/"
license=('GPL2')
depends=('mediastreamer-git' 'x264')
conflict=('linphone-plugin-msx264')
options=('!libtool')

_gitroot="git://git.linphone.org/msx264.git"
_gitname="msx264"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
