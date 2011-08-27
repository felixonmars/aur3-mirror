# Maintainer: TDY <tdy@gmx.com>
# Contributor: Max Nemeth <max.nemeth@gmail.com>

pkgname=tmv
pkgver=1.1.3
pkgrel=5
pkgdesc="Transform+MoVe files and directories via pathname manipulation"
arch=('i686' 'x86_64')
url="http://tmv.sourceforge.net/"
license=('GPL')
depends=('bash')
source=(http://downloads.sourceforge.net/tmv/tmv-$pkgver.tar.gz)
md5sums=('e09406d030d7a762fe7d850062daf780')

build() {
  cd "$srcdir/tmv-$pkgver"
  sed -i '93,95 d; $ a\/bin/true' install
  ./install --prefix="$pkgdir/usr" || return 1
}
