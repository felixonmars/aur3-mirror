# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Adam Vogt <vogt.adam@gmail.com>
pkgname=xmobar-gmail-darcs
pkgver=20111225
pkgrel=2
pkgdesc="A minimal status bar for the XMonad Window Manager. With GMail monitor."
arch=('i686' 'x86_64')
url="http://code.haskell.org/~arossato/xmobar/"
license=('custom:BSD3')
makedepends=('ghc>=6.12' 'haskell-x11-xft' 'haskell-hinotify' 'haskell-stm' 'haskell-parsec' 'darcs')
optdepends=('iw: for Wireless plugin')
conflicts=('xmobar')
depends=('wireless_tools')
source=(monitor_gmail.dpatch)
md5sums=('420c2cce606219c947713daa51385a8b')

_darcstrunk="http://code.haskell.org"
_darcsmod="xmobar"

build() {
  cd ${srcdir}

  msg "Checking for previous build"
  # get the sources
  if [[ -d "${srcdir}/$_darcsmod/_darcs" ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
  fi

  msg "Applying patches"
  cd "${srcdir}/$_darcsmod"
  darcs apply "${srcdir}/monitor_gmail.dpatch"

  runghc Setup configure --flags="with_iwlib with_xft with_inotify with_gmail" --prefix="${pkgdir}/usr" || return 1
  runghc Setup build || return 1
  runghc Setup install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_darcsmod/BSD3"
}
