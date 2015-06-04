# Maintainer alex korobtsov <korobcoff@gmail.com>
pkgname=psi-git
pkgver=0.16_dev_20150603
pkgrel=1
pkgdesc="A jabber client. GIT version"
arch=('i686' 'x86_64')
url="http://psi-im.org/"
license=('GPL2')
depends=('qt4' 'enchant' 'libxss' 'openssl' 'dbus' 'zlib')
makedepends=('git' 'qconf-git')
conflicts=(psi)
source=(git+https://github.com/psi-im/psi.git)
md5sums=('SKIP') 
pkgver() {
echo  0.16_dev_$(date +"%Y%m%d")
}

_gitroot=https://github.com/psi-im/
_gitname=psi

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."


  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"
  git submodule init
  git submodule update
  
  # BUILD HERE


  qconf

 ./configure --prefix=/usr \
  --qtdir=/usr/lib/qt4
make

}

package() {
  cd $srcdir/psi-build

  make INSTALL_ROOT="$pkgdir" install
}
