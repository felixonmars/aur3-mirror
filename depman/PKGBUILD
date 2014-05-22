# Maintainer: Amr Hassan <amr.hassan@gmail.com>

pkgname=depman
pkgver=2.9.4
pkgrel=1
pkgdesc="Dependency management helper for Golang packages. Supports versioned dependencies using standard Golang imports."
arch=('x86_64' 'i686')
url="https://github.com/vube/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/vube/$pkgname/archive/$pkgver.tar.gz")
_gourl='github.com/vube/depman'

build() {
  import_path=gopath/src/$_gourl/
  export GOPATH=`pwd`/gopath
  mkdir -p $import_path
  cp -r $pkgname-$pkgver/* $import_path
  cd $import_path

  go build -o $pkgname
}

package() {
  cd gopath/src/$_gourl/

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('debcec3d03991b27872eec76473ab3c5')
