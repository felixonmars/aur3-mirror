# Contributor: Georgios N. Tsalikis <aliverius@tsalikis.net>

pkgname=directfbgl-git
pkgver=20081018
pkgrel=1
pkgdesc="OpenGL extension to DirectFB"
arch=(i686 x86_64)
url="http://www.directfb.org"
license="LGPL2"
depends=('directfb>=1.3.0')
makedepends=('git')
provides=('directfbgl')
conflicts=('directfbgl')
source=()
md5sums=()

_gitroot="git://git.directfb.org/git/directfb/core/DirectFBGL.git"
_gitname="DirectFBGL"

build() {
  msg "Connecting to git.directfb.org GIT server...."

  if [[ -d $startdir/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin || return 1
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done"

  # Remove old -build
  rm -rf $startdir/src/$_gitname-build

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  msg "Starting make..."

  ./autogen.sh --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
