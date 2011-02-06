pkgname=mediastreamer-plugin-msamr-git
pkgver=20101017
pkgrel=1
pkgdesc="A mediastreamer2 plugin adding support for AMR codec."
arch=(i686 x86_64)
url="http://www.linphone.org/"
license=('GPL2')
depends=('mediastreamer-git' 'opencore-amr')
options=('!libtool')

_gitroot="git://git.linphone.org/msamr.git"
_gitname="msamr"

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
