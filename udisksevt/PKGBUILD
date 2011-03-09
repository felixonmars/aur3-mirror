# Contributor: Vladimir Matveev <dpx.infinity at gmail point com>
#
# Note that in order to build this package you have to install haskell-dbus-core package,
# which depends on haskell-parsec-3.1 or above. Since haskell-parsec from extra repository
# won't upgrade to version 3 in foreseeable future you have to install it modified using
# cabal2arch as follows:
#   % cabal2arch http://hackage.haskell.org/packages/archive/parsec/3.1.0/parsec.cabal
# Then modify PKGBUILD like this:
#   pkgname=haskell-parsec -> pkgname=haskell-parsec3 (something like that)
#   ln -s /usr/share/doc.../html/libraries/parsec -> ln -s /usr/share/doc.../html/libraries/parsec3
# and haskell-parsec.install file:
#   HS_DIR=/usr/share/haskell/haskell-parsec -> HS_DIR=/usr/share/haskell/haskell-parsec3
# Then install package as usual - makepkg && pacman -U haskell-parsec3-whatever.pkg.tar.xz
# Now install haskell-dbus-core from AUR, modifying its PKGBUILD to depend on haskell-parsec3
# instead of haskell-parsec>=3.0 first. Then install haskell-dbus-client using your favourite
# program. DBus packages will bring some other dependencies though, but you can safely uninstall
# them after compiling, they are not run-time dependencies.

pkgname=udisksevt
pkgver=1.0
pkgrel=4
pkgdesc="UDisks events handler daemon"
arch=('i686' 'x86_64')
url="http://github.com/dpx-infinity/udisksevt"
license=('GPL')
depends=('udisks' 'polkit' 'consolekit' 'dbus' 'gmp')
makedepends=('git' 'ghc' 'haskell-dbus-core' 'haskell-dbus-client' 'haskell-text' 'haskell-stm')
conflicts=('udisksevt-git')
install=udisksevt.install
source=(https://github.com/downloads/dpx-infinity/udisksevt/$pkgname-$pkgver.tar.bz2)
md5sums=('0069d45a0eb2320c7cef021a76221410')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make configure || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m755 -D ./dist/build/udisksevt/udisksevt $pkgdir/usr/bin/udisksevt || return 1
  install -m644 -D ./udisksevt.conf $pkgdir/usr/share/$pkgname/udisksevt.conf.example || return 1
}

# vim:set ts=2 sw=2 et:
