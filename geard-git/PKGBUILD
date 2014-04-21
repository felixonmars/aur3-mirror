# Maintainer: Martin Honermeyer <maze@strahlungsfrei.de>

pkgname=geard-git
pkgver=r480.54ab016
pkgrel=1
pkgdesc="A client and daemon for installing and linking Docker containers into systemd across hosts"
arch=('x86_64' 'i686')
url="http://openshift.github.io/geard/index.html"
license=('apache')
depends=('systemd' 'docker>=0.7')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=(
  'git+https://github.com/openshift/geard.git'
  'hostname-patch.diff'
)
sha256sums=('SKIP' '7101ba13c83830f8d12970ec4cb79c0760856a774f514c9decfd75d03a76ec1b')

pkgver() {
  cd "$srcdir/geard"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  mkdir -p github.com && ln -s "$srcdir" github.com/openshift

  cd "$srcdir/geard"
  patch -p1 <../hostname-patch.diff
  GOPATH="$srcdir" contrib/build -n -l
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
  # systemd
  install -Dm644 "$srcdir/geard/contrib/geard.service" "$pkgdir/usr/lib/systemd/system/geard.service"
}

# vim:set ts=2 sw=2 et:
