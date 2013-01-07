# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgname=eclipse-automotive
pkgver=4.2.1
pkgrel=1
pkgdesc="An IDE for Java and other languages for Automotive Software Developers (includes Incubating components)"
arch=('any')
url="http://eclipse.org"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst')
install=${pkgname}.install
makedepends=('zip')
conflicts=('xulrunner')
license=("EPL/1.1")
source=("http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/SR1/eclipse-automotive-juno-SR1-incubation-linux-gtk.tar.gz&url=http://www.gtlib.gatech.edu/pub/eclipse/technology/epp/downloads/release/juno/SR1/eclipse-automotive-juno-SR1-incubation-linux-gtk.tar.gz&mirror_id=337" 'eclipse-automotive.sh' 'eclipse-automotive.desktop' 'eclipse-automotive.svg')
md5sums=('c6964b235ae7c1064f7e065c83ad558b' '7ea99a30fbaf06ec29261541b8eb1e23' 'ba2cf02c48e6e35bfe3685401c26bb5b' '77cff7543ccf7e177cb6667f5a20ce19')

[ "$CARCH" = "x86_64" ] && source[0]="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/juno/SR1/eclipse-automotive-juno-SR1-incubation-linux-gtk-x86_64.tar.gz&url=http://mirrors.med.harvard.edu/eclipse/technology/epp/downloads/release/juno/SR1/eclipse-automotive-juno-SR1-incubation-linux-gtk-x86_64.tar.gz&mirror_id=530"
[ "$CARCH" = "x86_64" ] && md5sums[0]="f62d476d5be0b73d20b9ddc00dc32882"

_date=201300106

package() {
  install -m755 -d "$pkgdir/usr/share"
  mv eclipse "$pkgdir/usr/share/"

  install -d $pkgdir/usr/bin $pkgdir/usr/share/applications $pkgdir/usr/share/icons/hicolor/{16x16,32x32,48x48,256x256}/apps
  install -m755 eclipse-automotive.sh "$pkgdir/usr/bin/eclipse"
  install -m644 eclipse-automotive.desktop "$pkgdir/usr/share/applications/"

  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/eclipse.png"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/eclipse.png"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/eclipse.png"
  ln -s /usr/share/eclipse/plugins/org.eclipse.sdk_$pkgver.v${_date}/eclipse256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/eclipse.png"

  install -Dm644 $srcdir/eclipse-automotive.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/eclipse-automotive.svg

  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" $pkgdir/usr/share/eclipse/plugins/org.apache.ant_1.8.3.v20120321-1730/bin/runant.py
}
