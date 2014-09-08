# Maintainer: Fabian Schuh <mail@xeroc.org>
pkgname="bitsharesx-gui-git"
pkgver="20140824"
pkgrel=1
pkgdesc="BitSharesX GUI"
url="http://www.bitshares-x.info"
arch=('x86_64' 'i686')
license=('unlicense')
depends=('boost')
makedepends=('git' 'cmake' 'clang' 'make' 'nodejs')

_gitroot="git://github.com/dacsunlimited/bitsharesx.git"
_gitname="bitsharesx"
build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "Starting build..."
  #rm -rf "$srcdir/$_gitname"
  cd "$srcdir/$_gitname"
  git submodule init
  git submodule update
  export CC=clang CXX=clang++
  cmake .
  make
  cmake -DINCLUDE_QT_WALLET=ON .
  cd programs/web_wallet
  npm install lineman
  npm install
  cd -
  make forcebuildweb
  make BitSharesX
}
package() {
  mkdir -p "$pkgdir/usr/local/bin/" "$pkgdir/usr/local/share/icons/BitSharesX.png" "$pkgdir/usr/local/share/applications/"
  install -Dm755 "$srcdir/$_gitname/programs/qt_wallet/bin/BitSharesX"     "$pkgdir/usr/local/bin/"
  install -Dm644 "$srcdir/$_gitname/programs/qt_wallet/images/qtapp80.png" "$pkgdir/usr/local/share/icons/BitSharesX.png"
  install -Dm644 "$srcdir/$_gitname/programs/qt_wallet/BitSharesX.desktop" "$pkgdir/usr/local/share/applications/"
}
# vim:set ts=2 sw=2 et:
