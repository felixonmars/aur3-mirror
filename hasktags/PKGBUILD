# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=hasktags
pkgver=0.69.0
pkgrel=1
pkgdesc="Produces ctags tags and etags TAGS files for Haskell programs"
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-json' 'haskell-utf8-string')
url="https://github.com/MarcWeber/hasktags"
license=('custom:BSD3')
source=(https://hackage.haskell.org/package/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('08e200e30929e4a950307e61464db40d47a83debb4b19410cbaea8020b376aad')
options=('strip')
install=hasktags.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  runhaskell Setup configure \
              --prefix=/usr \
              --docdir=/usr/share/doc/hasktags \
              --enable-split-objs \
              --enable-shared \
              -O -p
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing...'
  install -Dm 744 register.sh "$pkgdir/usr/share/haskell/$pkgname/register.sh"
  install -Dm 744 unregister.sh "$pkgdir/usr/share/haskell/$pkgname/unregister.sh"
  install -dm 755 "$pkgdir/usr/share/doc/ghc/html/libraries"
  ln -s /usr/share/doc/$pkgname/html "$pkgdir/usr/share/doc/ghc/html/libraries/$pkgname"
  runhaskell Setup copy --destdir=$pkgdir
  rm -f "$pkgdir/usr/share/doc/$pkgname/LICENSE"
}
