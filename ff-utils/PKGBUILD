# This is an example PKGBUILD file. Use this as a start to creating your 
#own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is 
#unknown,
# then please put 'unknown'.

# Maintainer: Cedric de Wijs <cedric.dewijs@telfort.nl>
pkgname=ff-utils
pkgver=2.4.21
pkgrel=1
pkgdesc="Linux Force Feedback Library"
arch=('i686')
url="http://sourceforge.net/projects/libff/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('ff-utils')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/libff/files/ffutils/2.4.21/ff-utils.tar.bz2/download")
#source=($pkgname-$pkgver.tar.gz)
noextract=()
#md5sums=() #generate with 'makepkg -g'
md5sums=('37f5197aa38362cac1364d3d9f409912')

build() {
  cd "$srcdir/$pkgname"

  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir $pkgdir/bin
  cp evtest ffcfstress ffmvforce ffset fftest inputattach jscal jstest $pkgdir/bin
  #make DESTDIR="$pkgdir/" install
}
