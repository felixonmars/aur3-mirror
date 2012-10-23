# Maintainer: Panos Kanavos <panoskanavos at gmail dot com>
pkgname=mosesdecoder-git
pkgver=20121023
pkgrel=1
pkgdesc="State of the art Statistical Machine Translation decoder"
arch=('i686' 'x86_64')
url="http://www.statmt.org/moses"
license=('LGPL')
groups=()
depends=('python' 'bash' 'boost-libs')
makedepends=('git' 'boost>=1.36' 'zlib' 'irstlm')
optdepends=('giza-pp: for training models')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='mosesdecoder-git.install'
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/moses-smt/mosesdecoder.git"
_gitname="mosesdecoder"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd $srcdir/$_gitname

  ./bjam --prefix=$pkgdir/usr debug-symbols=off \
	 --with-irstlm=/opt/irstlm \
	 --install-scripts=$pkgdir/usr/moses-scripts
}
