# Maintainer: Panos Kanavos <panoskanavos at gmail dot com>
pkgname=mosesdecoder
pkgver=2.1.1
pkgrel=1
pkgdesc="State of the art Statistical Machine Translation system"
arch=('i686' 'x86_64')
url="http://www.statmt.org/moses"
license=('LGPL')
groups=()
depends=('python' 'xmlrpc-c' 'boost-libs')
makedepends=('boost>=1.36' 'zlib' 'irstlm' 'xmlrpc-c' 'git')
optdepends=('giza-pp: for training models')
provides=()
conflicts=('moses-git')
replaces=('moses-release')
backup=()
options=()
install='mosesdecoder.install'
source=('mosesdecoder::git+https://github.com/moses-smt/mosesdecoder.git#branch=RELEASE-2.1.1' 'mosesdecoder.sh')
noextract=()
md5sums=('SKIP' '888ae605a7b0a816005d44923b523016')

package() {
  cd "$pkgname"

  ./bjam --prefix=$pkgdir/opt/moses debug-symbols=off \
	 --with-irstlm=/opt/irstlm \
	 --with-xmlrpc-c \
	 --install-scripts=$pkgdir/opt/moses/moses-scripts

  mkdir -p $pkgdir/etc/profile.d/
  install -m755 $startdir/mosesdecoder.sh $pkgdir/etc/profile.d/
  source $pkgdir/etc/profile.d/mosesdecoder.sh
}

