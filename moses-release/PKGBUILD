# Maintainer: Panos Kanavos <panoskanavos at gmail dot com>
pkgname=moses-release
pkgver=20121101
pkgrel=1
pkgdesc="State of the art Statistical Machine Translation System - RELEASE-0.91 branch"
arch=('i686' 'x86_64')
url="http://www.statmt.org/moses"
license=('LGPL')
groups=()
depends=('python' 'xmlrpc-c')
makedepends=('git' 'boost>=1.36' 'zlib' 'irstlm' 'xmlrpc-c')
optdepends=('giza-pp: for training models')
provides=()
conflicts=('moses-git')
replaces=()
backup=()
options=()
install='moses-release.install'
source=('moses.sh')
noextract=()
md5sums=('888ae605a7b0a816005d44923b523016')

_gitroot="git://github.com/moses-smt/mosesdecoder.git"
_gitname="mosesdecoder"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --branch "RELEASE-0.91"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd $srcdir/$_gitname

  ./bjam --prefix=$pkgdir/opt/moses debug-symbols=off \
	 --with-irstlm=/opt/irstlm \
	 --with-xmlrpc-c \
	 --install-scripts=$pkgdir/opt/moses/moses-scripts
}

package() {
  mkdir -p $pkgdir/etc/profile.d/
  install -m755 moses.sh $pkgdir/etc/profile.d/
  source $pkgdir/etc/profile.d/moses.sh
}
