# Maintainer: Bradley Pesicka <bradley.c.pesicka@gmail.com>
pkgname=bitwrk-git
pkgver=20131204.1.g18a0755
pkgrel=1
epoch=
pkgdesc="A Bitcoin-friendly, Anonymous Marketplace for Compute Power"
arch=('i686')
url="https://github.com/indyjo/bitwrk/"
license=('GPL3')
groups=()
depends=(
)
makedepends=(
  'go'
)
checkdepends=()
optdepends=()
provides=()
conflicts=(bitwrk)
replaces=()
backup=()
options=()
install=
changelog=
source=(
   "git://github.com/indyjo/bitwrk.git"
   "bitwrk.service"
   "bitwrk.conf.default"
)
noextract=()
sha512sums=(
  SKIP
  f3bd8dc5dd5931c715ab840b2e23c8c077ab7e7ec77fddd45216caf7ee70e282cfe0b3dde5d138ff72330d1ed84a1b065f8e693673d069bbede9acc7b4cc7ce1
  4feea833ed9b84158b5367713553b58d93a1fc2ac558e85c85a566148bf66fe7fc1ed9698d831dd6d9013639f1d5d89445a5a60dcbbcc5cc86bd38e3a60b3e39
)
pkgver() {
	cd bitwrk
	git describe --tags | sed "s/^v//; s/-/./g" 
}

prepare(){(
  set -x
  cd bitwrk

  # Patch the source to include the path where the resources are installed at
  sed -e '70i "/usr/share/bitwrk-client/",' -i bitwrk-client/client_resource.go
)}

build() {(
  set -x
 cd bitwrk

 export GOPATH=$PWD/gopath

 (
   cd bitwrk-client
   go build
 )
)}

check() {
 :;
}

package() {(
  set -x
  cd bitwrk

  mkdir -p "$pkgdir/usr/bin/"
  cp -v bitwrk-client/bitwrk-client "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/share/bitwrk-client/"
  cp -Rv bitwrk-client/resources/* "$pkgdir/usr/share/bitwrk-client/"

  mkdir -p "$pkgdir/etc/conf.d/"
  cp -v ../bitwrk.conf.default "$pkgdir/etc/conf.d/"

  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  cp -v ../bitwrk.service "$pkgdir/usr/lib/systemd/system"
)}

# vim:set ts=2 sw=2 et:
