# Contributor: CYB3R <dima@golovin.in>
# Maintainer: CYB3R <dima@golovin.in>

pkgname=e2defrag-git
pkgver=20120707
pkgrel=1
pkgdesc="Offline defragmenter for ext2/3/4"
arch=('i686' 'x86_64')
url="http://github.com/ennoruijters/e2defrag/"
license=('GPL2')
depends=()
makedepends=('git' 'pkgconfig')
provides=('e2defrag')
conflicts=('e2defrag')
source=()
md5sums=()

_gitroot="git://github.com/ennoruijters/e2defrag.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

	make
}

package() {
	install -Dm755 $srcdir/$pkgname-$pkgver/e2defrag $pkgdir/sbin/e2defrag
}
