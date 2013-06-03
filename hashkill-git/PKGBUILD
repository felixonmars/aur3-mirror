# Maintainer: Vasil Yonkov <bustervill at fastmail dot fm>
pkgname=hashkill-git
_gitname=hashkill
pkgver=414.7bea735
pkgrel=1
pkgdesc="An open-source password recovery tool"
arch=('i686' 'x86_64')
url="http://www.gat3way.eu/hashkill/"
license=('GPL')
depends=('json-c' 'libcl' 'openssl' 'zlib')
makedepends=('git')
optdepends=('nvidia-utils: OpenCL support for nVidia GPUs' \
            'catalyst-utils: OpenCL support for AMD GPUs')
provides=('hashkill')
conflicts=('hashkill')
source=('hashkill::git://github.com/gat3way/hashkill.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  if ( ( pacman -Q nvidia-utils 2>/dev/null >/dev/null ) || ( pacman -Q catalyst-utils 2>/dev/null >/dev/null ) )
    then
      cd $_gitname
      ./configure --prefix=/usr
      make
    else
      echo "===================================";
      echo "Need to install either nvidia-utils,";
      echo "or catalyst-utils to build.";
      echo "===================================";
  fi
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
