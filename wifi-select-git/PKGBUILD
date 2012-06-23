# Maintainer: Periklis Ntanasis <pntanasis@gmail.com>

pkgname="wifi-select-git"
pkgver=20120623
pkgrel=1
pkgdesc="Tool for selecting wifi networks in console."
arch=('any')
url="https://github.com/sphynx/wifi-select/"
license=('GPL2')
depends=('netcfg' 'dialog' 'wireless_tools')
makedepends=('git')
conflicts=('wifi-select')
provides=('wifi-select')

_gitroot="git://github.com/sphynx/wifi-select.git"
_gitname="wifi-select"

build() {
	
  cd "$srcdir"
  msg "Connecting to GIT server...."
  
  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  
  sed -i "s/network.subr/network/" "$srcdir/$_gitname/wifi-select"
}

package() {
  install -D "$srcdir/$_gitname/wifi-select" "$pkgdir/usr/bin/wifi-select"
  install -Dm644 "$srcdir/$_gitname/parse-iwlist.awk" "$pkgdir/usr/lib/network/parse-iwlist.awk"
}
