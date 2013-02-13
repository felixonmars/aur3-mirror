# Maintainer: Sean Bartell <wingedtachikoma@gmail.com>
_hkgname=hprotoc
pkgname=$_hkgname
pkgver=2.0.14
pkgrel=1
pkgdesc="Parse Protocol Buffers files and generate Haskell code"
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/package/$_hkgname"
license=('BSD')
depends=('haskell-protocol-buffers' 'haskell-protocol-buffers-descriptor' 'haskell-utf8-string' 'haskell-parsec' 'haskell-mtl' 'haskell-haskell-src-exts')
makedepends=('alex' 'ghc')
install=$pkgname.install
source=(http://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz)
md5sums=('9542d1c249942a84a685f3031d90d30b')
sha256sums=('8417618b3198adb92143b061a0bf17dcffd1e4be490a98119f9baab078ae87cf')

build() {
  cd "$srcdir/$_hkgname-$pkgver"

  runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
    --prefix=/usr --docdir="/usr/share/doc/$pkgname" \
    --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register   --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/$_hkgname-$pkgver"

  install -D -m744 register.sh   "$pkgdir/usr/share/haskell/$pkgname/register.sh"
  install     -m744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
  install -d -m755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s "/usr/share/doc/$pkgname/html" "$pkgdir/usr/share/doc/ghc/html/libraries/$_hkgname"
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
