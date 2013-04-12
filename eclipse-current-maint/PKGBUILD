# $Id: PKGBUILD 167250 2012-09-29 11:01:30Z ibiru $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgname=eclipse-current-maint
_realname=eclipse
pkgver=4.2.2
_date=201302041200
_pkgbuild=R-${pkgver}-${_date}
pkgrel=2
pkgdesc="An IDE for Java and other languages"
arch=('i686' 'x86_64')
url="http://eclipse.org"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst')
install=${_realname}.install
makedepends=('zip')
conflicts=('xulrunner')
license=("EPL/1.1")
conflicts=('eclipse')
provides=('eclipse')
replaces=('eclipse')
source=("http://download.eclipse.org/eclipse/downloads/drops4/${_pkgbuild}/${_realname}-SDK-${pkgver}-linux-gtk.tar.gz"
	 'eclipse.sh' 'eclipse.desktop' 'eclipse.svg')
md5sums=('daa539af97a5cf4fb8ae1d7675b9625b'
         '7ea99a30fbaf06ec29261541b8eb1e23'
         'ba2cf02c48e6e35bfe3685401c26bb5b'
         '77cff7543ccf7e177cb6667f5a20ce19')
[ "$CARCH" = "x86_64" ] && source[0]="http://download.eclipse.org/eclipse/downloads/drops4/${_pkgbuild}/${_realname}-SDK-${pkgver}-linux-gtk-$CARCH.tar.gz"
[ "$CARCH" = "x86_64" ] && md5sums[0]='902102ec85539f4c9342b2c1c4c67f64'

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
