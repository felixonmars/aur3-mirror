# Contributor: k79 <sam.sinner@gmail.com>

pkgname=griv
pkgver=0.1.9
pkgrel=2
pkgdesc="griv is a serverless lan chat program, protocol is based on RivChat."
url=("http://sourceforge.net/projects/griv/")
source=(http://heanet.dl.sourceforge.net/sourceforge/griv/griv-0.1.9.tar.bz2)
depends=('gtk2' 'perl' 'intltool')
arch=('i686' 'x86_64')
license=('GPL')
md5sums=('9527e6e351779c144c8c8781a5980362')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}