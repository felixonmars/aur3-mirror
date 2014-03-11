# Maintainer: Magnus Mueller <mamuelle@informatik.hu-berlin.de>

pkgname=concuerror-git
pkgver=0.r827.c2404cd
pkgrel=1
pkgdesc="Concuerror is a systematic testing tool for concurrent Erlang programs"
arch=('i686' 'x86_64')
url="https://github.com/mariachris/Concuerror"
license=('BSD')
depends=('erlang')
makedepends=('git' 'make')
provides=('concuerror')
source=("$pkgname"::'git://github.com/mariachris/Concuerror.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  # build concuerror first, to set the right ebin directory
  make concuerror EBIN=/usr/lib/$pkgname/ebin
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{"lib/$pkgname",bin}
  for subdir in ebin doc;
  do
      cp -r $srcdir/$pkgname/$subdir $pkgdir/usr/lib/$pkgname
  done
  install -Dm755 concuerror $pkgdir/usr/bin
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
