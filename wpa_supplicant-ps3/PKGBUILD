# Contributor: konni <konni@giev.de>

pkgname=wpa_supplicant-ps3
pkgver=0.6.4
pkgrel=1
pkgdesc="A utility providing key negotiation for WPA wireless networks - including some patches for PS3"
arch=(ppc)
makedepends=()
depends=('openssl' 'dbus')
license=('GPL')
groups=('base')
backup=('etc/wpa_supplicant.conf')
provides=("wpa_supplicant-ps3=$pkgver")
conflicts=('wpa_supplicant')
url="http://hostap.epitest.fi/wpa_supplicant"
source=(http://hostap.epitest.fi/releases/wpa_supplicant-$pkgver.tar.gz
         patch.makefile
         patch.config)
install='wpa_supplicant.install'
md5sums=('eb06a9a05d3916addf9451297a558aa2'
         'bfaaf79b33cdab17d5bf3e356970a9f8'
         '50970a0f5b37aabd19efdd782af10afd')
build() {
  cd $startdir/src/wpa_supplicant-$pkgver/wpa_supplicant
  cp defconfig .config
  patch -p0 .config < ../../../patch.config
  patch -p0 Makefile < ../../../patch.makefile
  make || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install || return 1
  install -D -m644 wpa_supplicant.conf $startdir/pkg/etc/wpa_supplicant.conf || return 1
  install -d -m755 $startdir/pkg/usr/man/man{5,8} || return 1
  install -m644 doc/docbook/wpa_supplicant.conf.5 $startdir/pkg/usr/man/man5 || return 1
  install -m644 doc/docbook/{wpa_background,wpa_cli,wpa_passphrase,wpa_supplicant}.8 $startdir/pkg/usr/man/man8 || return 1
}
