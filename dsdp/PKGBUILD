# Creator: Cristóvão D. Sousa <crisjss@gmail.com>
pkgname=dsdp
_name=DSDP
pkgver=5.8
pkgrel=1
pkgdesc="A free open source implementation of an interior-point method for semidefinite programming"
arch=('i686' 'x86_64')
url="http://www.mcs.anl.gov/hs/software/DSDP/"
license=('custom')
depends=("lapack" "blas")
optdepend=("atlas-lapack: touse optimised LAPACK and BLAS implementation (compile time)")
makedepends=()
source=("http://www.mcs.anl.gov/hs/software/$_name/$_name$pkgver.tar.gz"
        "make.include.patch")
md5sums=('37c15a3c6c3f13e31262f65ac4364b5e'
         '3baaffb3d90d4858c5f30dc761a36944')



build() {
  cd "$srcdir/$_name$pkgver"
  patch "$srcdir/$_name$pkgver/make.include" < "$srcdir/make.include.patch"
  export DSDPROOT="$srcdir/$_name$pkgver"
  make dsdpapi
}


# check() {
#   cd "$srcdir/$_name$pkgver/bin"
#   make test
# }

package() {
  cd "$srcdir/$_name$pkgver"
  
  #binaries
  install -d $pkgdir/usr/bin/
  install -Dm755 $srcdir/$_name$pkgver/bin/dsdp5 $pkgdir/usr/bin/
  
  #libraries
  install -d $pkgdir/usr/lib/
  install -Dm644 $srcdir/$_name$pkgver/lib/* $pkgdir/usr/lib/
  
  #includes
  install -d $pkgdir/usr/include/dsdp/
  install -Dm644 $srcdir/$_name$pkgver/include/*.h $pkgdir/usr/include/dsdp/
  
  #license
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -Dm644 $srcdir/$_name$pkgver/dsdp-license $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
