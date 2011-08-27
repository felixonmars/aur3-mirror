# Maintainer: Anton Komolov <anton.komolov@gmail.com>
pkgname=wpa_supplicant-libeap
pkgver=0.6.10
pkgrel=1
pkgdesc="WiMAX opensource supplicant: building the libeap.so library"
arch=('i686')
url="http://hostap.epitest.fi/"
license=('GPL2')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('libeap')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://hostap.epitest.fi/releases/wpa_supplicant-0.6.10.tar.gz'
        'http://www.linuxwimax.org/Download?action=AttachFile&do=get&target=wpa_supplicant-0.6.10-generate-libeap-peer.patch')
noextract=()
md5sums=('8985b1030d753e5f74f8acfc34e591bb'
         '99f5bd53d851e12d49f75fc90bce7a81')

build() {
  cd "$srcdir/wpa_supplicant-$pkgver"
  patch -p1 < "../Download?action=AttachFile&do=get&target=wpa_supplicant-0.6.10-generate-libeap-peer.patch"
  make -C src/eap_peer
}

package() {
  cd "$srcdir/wpa_supplicant-$pkgver"
  make DESTDIR="$pkgdir/" -C src/eap_peer install
}

# vim:set ts=2 sw=2 et:
