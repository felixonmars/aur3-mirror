# Maintainer: Guten Ye

pkgname="freedom-routes"
pkgver=1.0.0
pkgrel=4
pkgdesc="Internet Freedom - add local routes in vpn for accessing local websites using direct link"
arch=("i686" "x86_64")
url="https://github.com/GutenYe/freedom-routes"
license=("MIT")
depends=("iproute2")
makedepends=("git" "go")
source=()
source=( 
  "$pkgname-$pkgver.tar.gz::https://github.com/GutenYe/freedom-routes/archive/v$pkgver.tar.gz"
)
backup=("etc/freedom-routes")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # prepare build environment
  export GOPATH="$srcdir/go"
  mkdir -p "$srcdir/go/src/github.com/GutenYe"
  ln -sfT "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/GutenYe/freedom-routes"

  # prepare dependency 
  go get -v
  platform=$([ $CARCH == "i686" ] && echo "linux_386" || echo "linux_amd64")
  rm -r "$srcdir/go/pkg/$platform/github.com/GutenYe/freedom-routes"

  # begin build
  ./build.sh -d /usr/share/freedom-routes
}

package() {
  cd "$srcdir/$pkgname-$pkgver/dist"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/share/freedom-routes"
  cp freedom-routes "$pkgdir/usr/bin"
  cp freedom-routes.etc "$pkgdir/etc/freedom-routes"
  cp -r templates "$pkgdir/usr/share/freedom-routes"
}

# vim:set ts=2 sw=2 et:
md5sums=('090415b9ac9ba8426f903dd6dfef2dee')
