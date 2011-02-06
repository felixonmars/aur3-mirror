pkgname=libeap
pkgver=1.5.1
pkgrel=1
pkgdesc="WiMAX EAP Library"
arch=('i686' 'x86_64')
url="http://linuxwimax.org"
license=('BSD')
depends=('openssl')
source=('http://linuxwimax.org/Download?action=AttachFile&do=get&target=wpa_supplicant-0.7.2-generate-libeap-peer.patch'
        'http://hostap.epitest.fi/releases/wpa_supplicant-0.7.3.tar.gz')
md5sums=('9a90a17b05029fbfeefa673b9a01724e'
         'f516f191384a9a546e3f5145c08addda')
build() {
  cd $srcdir
  mv "Download?action=AttachFile&do=get&target=wpa_supplicant-0.7.2-generate-libeap-peer.patch" wpa_supplicant-0.7.2-generate-libeap-peer.patch
  cd ${srcdir}/wpa_supplicant-0.7.3
  patch -p1 < ${srcdir}/wpa_supplicant-0.7.2-generate-libeap-peer.patch
  make -C src/eap_peer
  make -C src/eap_peer DESTDIR=${pkgdir} install
}
