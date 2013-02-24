# $Id: PKGBUILD 77036 2012-10-03 18:05:35Z ttopper $
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=pii3status
origpkgname=i3status
pkgver=2.6
pkgrel=1
pkgdesc="i3status fork - Generates status bar to use with dzen2 or xmobar, includes nice utf-8 graphs"
arch=('i686' 'x86_64')
url="http://i3.zekjur.net/i3status/"
license=('BSD')
groups=('i3')
depends=('wireless_tools' 'confuse' 'alsa-lib' 'yajl')
makedepends=('asciidoc')
backup=('etc/i3status.conf')
conflicts=i3status
install=i3status.install
options=('docs')
source=("http://i3.zekjur.net/i3status/$origpkgname-$pkgver.tar.bz2"
  i3status.conf
  0001-cpu_graph.patch
  0002-wifi_symbols.patch
  0003-battery.patch
  0004-volume_bar.patch )
md5sums=('98f649429d7845682846de36fb38f780'
  '8314abbc8b2b6b31f0d759f04036d42b'
  '25e9737d9d2468b5edc5d2866686ba43'
  '4a3be94e777063854396086f5a5e469c'
  '102bdf4b6f13e8090ed6a483ffa98aa4'
  'e898b78f8819498bd9e850287a5a7562')



build() {
  cd "${srcdir}/${origpkgname}-${pkgver}"
  
  patch -p1 < "${srcdir}/0001-cpu_graph.patch"
  patch -p1 < "${srcdir}/0002-wifi_symbols.patch"
  patch -p1 < "${srcdir}/0003-battery.patch"
  patch -p1 < "${srcdir}/0004-volume_bar.patch"
  make
}

package() {
  cd "${srcdir}/${origpkgname}-${pkgver}"
  
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${origpkgname}/LICENSE
  install -Dm644 "${srcdir}/i3status.conf" ${pkgdir}/etc/i3status.conf

  make clean
}

# vim:set ts=2 sw=2 et:

