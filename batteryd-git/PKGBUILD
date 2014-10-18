#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=batteryd-git
pkgver=1
pkgrel=1
pkgdesc="A small battery daemon for Archlinux"
arch=("any")
url=("https://github.com/shibumi/batteryd")
license=("GPLv3")
depends=("libnotify")
makedepends=("git" "gcc")
source=("git+http://github.com/shibumi/batteryd" "batteryd.install" "batteryd.service")
md5sums=("SKIP" "4fd10263484b33b5d2a63eb10dab4d75" "49be3a743b1f4f6100d6533079898a0c")
install="batteryd.install"

pkgver() {
  cd batteryd
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/batteryd
  make
}

package() {
    
  mkdir -p "${pkgdir}/etc/systemd/system/" 
  
  install -D -m644 "${srcdir}/batteryd/batteryd.service" \
    "${pkgdir}/lib/systemd/system/batteryd.service"
  
  install -D -m644 "${srcdir}/batteryd/LICENSE" \
    "${pkgdir}/usr/share/licenses/batteryd/LICENSE"

  cd ${srcdir}/batteryd
  make DESTDIR="$pkgdir" install
}
