# Maintainer: Amr Hassan <amr.hassan@gmail.com>

pkgname=psmpc
pkgver=0.05
pkgrel=3
pkgdesc="A pretty simple MPD client"
arch=('x86_64' 'i686')
url="https://github.com/amrhassan/$pkgname/"
license=('MIT')
makedepends=('go' 'depman')
options=('!strip' '!emptydirs')
source=("https://github.com/amrhassan/$pkgname/archive/${pkgver}.tar.gz")
_gourl='github.com/amrhassan/psmpc'

build() {
  import_path=gopath/src/$_gourl/
  export GOPATH=`pwd`/gopath
  mkdir -p $import_path
  cp -r $pkgname-$pkgver/* $import_path
  cd $import_path

  depman install
  go build -o $pkgname
}

package() {
  cd gopath/src/$_gourl/

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 gui/ui.glade "$pkgdir/usr/share/psmpc/gui/ui.glade"
  install -Dm755 gui/icon.png "$pkgdir/usr/share/psmpc/gui/icon.png"
}

md5sums=('979c5241823fbf1abb110a543a79964c')
