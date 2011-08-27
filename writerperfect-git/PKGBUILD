pkgname=writerperfect-git
pkgver=20110822
pkgrel=1
pkgdesc="libwpd utilities for converting WordPerfect(tm) documents and Visio(tm) documents to odt and odg"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libwpd"
license=('LGPL')
provides=('writerperfect')
conflicts=('writerperfect')
depends=('libwpd>=0.6.1' 'libwpg>=0.2.0' 'libvisio' 'libgsf>=1.6.0')
makedepends=('git' 'libtool')
source=()
md5sums=()

_gitroot="git://libwpd.git.sourceforge.net/gitroot/libwpd/writerperfect"
_gitname="writerperfect"

build() {
  cd $startdir/src
  msg "Connecting to git.sourceforge.net GIT server...."
  if [ -d $startdir/src/$_gitname ] ; then
  cd $_gitname && git-pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build
  ./autogen.sh
  ./configure --prefix=/usr --with-libvisio
  make || return 1
}

package() {
  cd $startdir/src/$_gitname-build
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -type f -name '*.la' -exec rm {} \;
}