# Maintainer: Matthias Dietrich <matthias.dietrich[at]wood-it[dot]de>
pkgname=xmobar-spapi
pkgver=0.20.1
pkgrel=1
pkgdesc="A minimal status bar for the XMonad Window Manager."
arch=('i686' 'x86_64')
url="http://projects.haskell.org/xmobar/"
license=('custom:BSD3')
makedepends=(
  'ghc'
  'haskell-x11'
  'haskell-x11-xft'
  'haskell-mtl'
  'haskell-parsec'
  'haskell-stm'
  'haskell-utf8-string'
  'haskell-regex-compat'
  'haskell-dbus'
  'haskell-http'
  'git')
depends=('wireless_tools' 'gmp' 'libxml2' 'libxrandr' 'libxinerama' 'libxft')
optdepends=(
  'haskell-alsa-mixer: Enables Volume plugin.'
  'haskell-dbus: Control xmobar with DBUS.'
  'haskell-libmpd: Enables MPD plugin.'
  'haskell-hinotify: Support for inotify.'
  'haskell-timezone-olson: With haskell-timezone-series, enables DateZone plugin'
  'haskell-timezone-series: With haskell-timezone-olson, enables DateZone plugin')
conflicts=('xmobar' 'xmobar-darcs')
source=('http://hackage.haskell.org/packages/archive/xmobar/'$pkgver'/xmobar-'$pkgver'.tar.gz'
	'spaceAPI.patch')
md5sums=('cee66bfa9aa36d25329ffd5ac044aeaf'
	'0c47ef68b7c5dc230da43dca53ab6a9f')

build() {
    tar xvfz xmobar-$pkgver.tar.gz

    cd $srcdir

    patch -p1 < ../spaceAPI.patch

    cd xmobar-$pkgver

    # XMOBAR INSTALLATION
    # Several possible setup options are offered below. Choose whichever is
    # best for you. Uncomment and recomment as necessary.
    # See http://projects.haskell.org/xmobar/#optional-features for more information.

    # Default setup.
    runhaskell Setup configure --flags="with_xft with_iwlib with_dbus" --prefix=/usr

    # MPD Support. Must have `haskell-libmpd` installed.
    # runhaskell Setup configure --flags="with_xft with_iwlib with_mpd" --prefix=/usr

    # Alsa Support. Must have `haskell-alsa-mixer` installed.
    # Be warned, its dependencies can be troublesome.
    # runhaskell Setup configure --flags="with_xft with_iwlib with_alsa" --prefix=/usr
    
    # If you have _all_ of the optdepends installed, and want all extentions:
    # runhaskell Setup configure --flags="all_extensions" --prefix=/usr
    runhaskell Setup build
}

package() {
    cd "${srcdir}/xmobar-$pkgver"
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 license ${pkgdir}/usr/share/licenses/$pkgname/BSD3
}
