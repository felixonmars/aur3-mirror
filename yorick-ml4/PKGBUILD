# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-ml4
pkgver=20140916
pkgrel=1
pkgdesc="yorick I/O to matlab4 data format"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.maumae.net/yorick/doc/plugins.php"
groups=('science' 'yorick-all')
depends=('yorick' 'yorick-yutils-git')
makedepends=('yorick')

_gitroot="git://github.com/frigaut/yorick-ml4.git"
_gitname="yorick-ml4"

build() {
  cd ${srcdir}
  msg "Connecting to git repo..."
  if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting script install..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  yorick -batch make.i
  make
}

package() {
  cd ${srcdir}/$_gitname-build
  make DESTDIR=${pkgdir} install
}
