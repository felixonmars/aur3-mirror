# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=kolourmatica
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple colour space calculator."
arch=(i686 x86_64)
url="https://github.com/Arlen/Kolourmatica"
license=('GPL')
depends=('qt')
makedepends=('scons' 'eigen3')
install="$pkgname.install"
source=("$url/zipball/$pkgver"
        "$pkgname.desktop")
md5sums=('e5d1b1f47cdebc793f316a149b3c03dc'
         '48b9db38d9d7b8d538b1f2486c6e90ec')

build() {
  cd "$srcdir/Arlen"*

  # moc exec name fix
  sed -i 's/moc-qt4/moc/' SConstruct

  scons mode=release moc=on
}

package() {
  cd "$srcdir/Arlen"*

  # bin
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icons
  for _s in 32 64 128; do
    install -Dm644 logo/logo$_s.png \
      "$pkgdir/usr/share/icons/hicolor/${_s}x${_s}/apps/$pkgname.png"
  done
}

# vim:set ts=2 sw=2 et:
