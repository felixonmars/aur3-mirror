# Contributor: Sloonz <sloonz+aur@gmail.com>

pkgname=libetc-experimental-git
pkgver=20100530
pkgrel=1
pkgdesc="Automatically translate ~/.* to ~/.config/* [with experimental patches]"
arch=(i686 x86_64)
url="http://ordiluc.net/fs/libetc/"
license=(GPL3)
depends=()
conflicts=(libetc libetc-experimental)
makedepends=('make')
install=libetc.install
source=()
md5sums=()

_gitroot="http://github.com/sloonz/libetc.git"
_gitname="libetc"

build() {
  cd ${startdir}/src
  
  if [[ -d ${startdir}/src/$_gitname ]] ; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
  fi
  
  rm -rf ${startdir}/src/${_gitname}-build &&
  cp -r ${startdir}/src/$_gitname ${startdir}/src/${_gitname}-build || return 1
  
  cd ${startdir}/src/${_gitname}-build

  CFLAGS="$CFLAGS -DXAUTH_HACK" make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
