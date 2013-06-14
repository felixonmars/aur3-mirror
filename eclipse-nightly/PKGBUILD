# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>
# Contributor: Roman Komkov <r.komkov@gmail.com>

pkgname=eclipse-nightly
_date=20130605
_time=2000
pkgver=4.3_${_date}
pkgrel=1
pkgdesc="An IDE for Java and other languages. Nightly version (updates weekly)."
arch=('i686' 'x86_64')
url="http://eclipse.org"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst')
install=${pkgname}.install
makedepends=('zip')
conflicts=('xulrunner' 'eclipse')
provides=('eclipse' 'eclipse=4.3')
license=("EPL/1.1")

source=("http://download.eclipse.org/eclipse/downloads/drops4/I${_date}-${_time}/eclipse-SDK-I${_date}-${_time}-linux-gtk-$CARCH.tar.gz"
	 'eclipse.sh' 'eclipse.desktop' 'eclipse.svg')

[ "$CARCH" = "x86_64" ] && source[0]="http://download.eclipse.org/eclipse/downloads/drops4/I${_date}-${_time}/eclipse-SDK-I${_date}-${_time}-linux-gtk-$CARCH.tar.gz"
[ "$CARCH" = "x86_64" ] && md5sums[0]='166d8aa0f22f9284e69def648643a302'

md5sums=('8dba840856c5ca38b3c08ebac9a47cb8'
         '7ea99a30fbaf06ec29261541b8eb1e23'
         'ba8a37e30a7ebd69774cec87c69e8c44'
         '4df4cfe4a09135ceb35d1572d2248a52')
sha1sums=('99e055f2ebd603b86884e60447937dca9de8d51a'
          '3e4ef8cf2e5468e1debe6ba026344b8de3bd9942'
          'd73a07cd04ba95c371477d006412a50abf11a51a'
          'da76fb1db1032682f54aba580d998cfc7d32dacc')

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
  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" "$pkgdir"/usr/share/eclipse/plugins/org.apache.ant_1.8.4.v201303080030/bin/runant.py
}
