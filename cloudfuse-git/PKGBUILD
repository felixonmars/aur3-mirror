# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cloudfuse-git
pkgver=20130211
pkgrel=1
epoch=
pkgdesc="Filesystem (fuse) implemented on Rackspace's Cloud Files"
arch=('i686' 'x86_64')
url="https://github.com/redbo/cloudfuse"
license=('GPL')
groups=()
depends=('fuse' 'curl' 'openssl' 'libxml2')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('cloufuse')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/redbo/cloudfuse.git
_gitname=cloudfuse


build() {
  cd "$srcdir"

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd "$srcdir/$_gitname-build/"
  ./configure --prefix=/usr 
  make 
}

package() {
  cd "$srcdir/$_gitname-build/"
  make DESTDIR=$pkgdir install
}


# vim:set ts=2 sw=2 et:
