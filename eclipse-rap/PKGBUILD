# Maintainer: Cravix < dr dot neemous at gmail dot com >
# Based on the eclipse PKGBUILD by Ionut Biru <ibiru@archlinux.org>

pkgname=eclipse-rap
pkgver=4.2.1
pkgrel=1
_date=201209141800
pkgdesc="Eclipse for RCP and RAP (RWT) developers"
arch=('i686' 'x86_64')
url="http://eclipse.org"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst')
install=eclipse.install
makedepends=('zip')
conflicts=('xulrunner' 'eclipse')
provides=('eclipse=4.2.1')
license=("EPL/1.1")
# If you want to download it manually, visit
# http://www.eclipse.org/downloads/packages/eclipse-rcp-and-rap-developers/indigosr1
source=("ftp://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/juno/SR1/eclipse-rcp-juno-SR1-linux-gtk.tar.gz"
	 'eclipse.sh' 'eclipse.desktop' 'eclipse.svg')
md5sums=('d9082e3002aea6e00c1d1d735861a7b7'
         '7ea99a30fbaf06ec29261541b8eb1e23'
         'ba2cf02c48e6e35bfe3685401c26bb5b'
         '77cff7543ccf7e177cb6667f5a20ce19')
[ "$CARCH" = "x86_64" ] && {
	source[0]="ftp://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/juno/SR1/eclipse-rcp-juno-SR1-linux-gtk-x86_64.tar.gz"
	md5sums[0]='2cf23308f883411366d2d9f015ecc367'
}

package() {
  # install eclipse
  install -m755 -d "$pkgdir/usr/share"
  mv eclipse "$pkgdir/usr/share/"

  # install misc
  install -d $pkgdir/usr/bin $pkgdir/usr/share/applications \
    $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,256x256}/apps
  install -m755 eclipse.sh "$pkgdir/usr/bin/eclipse"
  install -m644 eclipse.desktop "$pkgdir/usr/share/applications/"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/eclipse.png"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/eclipse.png"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/eclipse.png"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/eclipse.png"

  # install icon
  install -Dm644 "$srcdir"/eclipse.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/eclipse.svg
  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" "$pkgdir"/usr/share/eclipse/plugins/org.apache.ant_1.8.3.v20120321-1730/bin/runant.py
}
