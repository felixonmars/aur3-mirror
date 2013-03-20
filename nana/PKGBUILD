# Maintainer: Brandon Invergo <brandon@invergo.net>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=nana
pkgver=2.5
pkgrel=2
pkgdesc="provides improved support for assertion checking, logging and performance measurement"
arch=(i686 x86_64)
url="http://savannah.gnu.org/projects/nana/"
license=('GPL')
depends=('bash')
#options=()
install=nana.install
source=(http://download.savannah.gnu.org/releases/nana/$pkgname-$pkgver.tar.gz 
        01_add-DESTDIR.diff
)
md5sums=(66c88aa0ad095b2e67673773135475f1 
         6c4a903206f21fea4c0488fa2fcfba08
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info || return 1
  patch -uN man/Makefile ../01_add-DESTDIR.diff || return 1
  make || return 1
}

package() {
  install -d "$pkgdir/usr/share/man/man1"
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install || return 1
  mv "$pkgdir/usr/libexec/nana-trace.gdb" "$pkgdir/usr/bin"
  mv "$pkgdir/usr/libexec/nanafilter" "$pkgdir/usr/bin"
  rm -rf "$pkgdir/usr/libexec"
}

