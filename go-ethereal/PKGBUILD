# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=go-ethereal
pkgver=20140508
pkgrel=1
pkgdesc="Ethereum Go GUI developer client"
arch=('any')
depends=('gmp' 'leveldb' 'qt5-base' 'qt5-quickcontrols')
makedepends=('git' 'go' 'mercurial')
url="https://github.com/ethereum/go-ethereum"
license=('MIT')
options=('!strip' '!emptydirs')
provides=('ethereal' 'go-ethereal')

build() {
  GOPATH="$srcdir" go get -fix -v -x github.com/ethereum/go-ethereum/ethereal
}

check() {
  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x github.com/ethereum/go-ethereum/ethereal || return 0
}

package() {
  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh

  msg 'Installing srclibs...'
  install -dm 755 $pkgdir/usr/share/ethereal/src
  for _lib in `find $srcdir/src -mindepth 1 -maxdepth 1 -printf '%f\n'`; do
    cp -dpr --no-preserve=ownership $srcdir/src/$_lib $pkgdir/usr/share/ethereal/src/$_lib
  done

  msg 'Installing pkglibs...'
  install -dm 755 $pkgdir/usr/share/ethereal/pkg
  for _pkg in `find $srcdir/pkg -mindepth 1 -maxdepth 1 -printf '%f\n'`; do
    cp -dpr --no-preserve=ownership $srcdir/pkg/$_pkg $pkgdir/usr/share/ethereal/pkg/$_pkg
  done

  msg 'Installing binaries...'
  for _bin in `find $srcdir/bin -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 $srcdir/bin/$_bin $pkgdir/usr/bin/$_bin
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .hg -exec rm -r '{}' +
  find "$pkgdir" -type f -name .hgignore -exec rm -r '{}' +
}
