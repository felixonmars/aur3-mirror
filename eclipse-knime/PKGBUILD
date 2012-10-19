# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=eclipse-knime
pkgver=2.6.3
pkgrel=1
epoch=
pkgdesc="A user-friendly and comprehensive open-source data integration, processing, analysis, and exploration platform bundled with Eclipse and SDK."
arch=('x86_64')
url="http://www.knime.org"
license=('EPL' 'GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.knime.org/knime_downloads/linux/eclipse_knime_$pkgver.linux.gtk.x86_64.tar.gz)
noextract=()
md5sums=('bab27df848fc36dcc791703c6f8784c4')

build() {
  cd "$srcdir/eclipse_knime_$pkgver"
}

package() {
  cd "$srcdir/eclipse_knime_$pkgver"
  mkdir -p $pkgdir/usr/share/java/eclipse-knime/
  cp -av * $pkgdir/usr/share/java/eclipse-knime/
  mkdir -p $pkgdir/usr/bin
  cat << EOF > $pkgdir/usr/bin/knime
#!/bin/bash
cd /usr/share/java/eclipse-knime
./eclipse
EOF
  chmod 755 $pkgdir/usr/bin/knime
}
