# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte__gmail>

pkgname=nhopkg
pkgver=0.5.1
pkgrel=1
pkgdesc="A universal package manager using .nho (binary) and .src.nho (source) packages"
arch=('any')
url="http://nhopkg.sourceforge.net/"
license=('GPL3')
depends=('bzip2' 'coreutils' 'findutils' 'grep' 'mlocate' 'shared-mime-info'
         'tar' 'wget')
makedepends=('gettext' 'pkgconfig>=0.9')
install=nhopkg.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('246c8cbf6193f90bfeaefb80a827c3a4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure	--prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
