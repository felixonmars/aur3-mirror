# Maintainer: Giuseppe Borzi <gborzi___AT___ieee___DOT___org>
pkgname=lapacke
pkgver=1.0.0.009
pkgrel=1
pkgdesc="Standard C language APIs for LAPACK"
arch=('i686' 'x86_64')
url="http://www.netlib.org/lapack"
license=('custom')
depends=('glibc' 'lapack')
source=($url/$pkgname.tgz missing.patch)
md5sums=('355f286f004ec0ccc9a6feac27c4ea0f' 'a41dcd281f079652c31ec4aeebac163e')

build() {
  cd "$srcdir/$pkgname"

  patch -Np0 -i "$srcdir/missing.patch"
  sed -i -e 's_../../$(LAPACKE)_$(LAPACKE)_' testing/interface/Makefile
  make CC=cc CFLAGS="$CFLAGS -fPIC" lapacke
  cc -shared -Wl,-soname,lib$pkgname.so.1 -o lib$pkgname.so.$pkgver \
    utils/*.o src/*.o -llapack
  ln -s lib$pkgname.so.$pkgver lib$pkgname.so.1
  ln -s lib$pkgname.so.1 lib$pkgname.so
  # Uncomment the following four lines to test the package
  #cd testing
  #LD_LIBRARY_PATH="../.." make CC=cc CFLAGS="-O0" LINKER=cc LIBS="" \
  #  LAPACKE="-L../.. -llapacke"
  #! grep -q FAILED interface/*.out
}

package() {
  cd "$srcdir/$pkgname"

  install -dm755 "$pkgdir/usr/lib"
  cp -d lib$pkgname* "$pkgdir/usr/lib"
  install -dm755 "$pkgdir/usr/include"
  cp include/*.h "$pkgdir/usr/include"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}

# vim:set ts=2 sw=2 et:
