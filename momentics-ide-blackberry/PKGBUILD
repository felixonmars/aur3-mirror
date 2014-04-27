# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=momentics-ide-blackberry
_pkgver=2.0
_pkgdate=201310251201
pkgver=${_pkgver}_$_pkgdate
pkgrel=1
pkgdesc='QNX Momentics IDE for Blackberry 10 development'
arch=('i686' 'x86_64')
url="https://developer.blackberry.com/native/"
license=('custom')
options=(!strip)
depends=('libxtst' 'qt4')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-libxtst' 'lib32-qt4' 'lib32-xulrunner')
fi
source=("https://developer.blackberry.com/native/downloads/fetch/momentics-$_pkgver-$_pkgdate-linux.gtk.x86.bin"
        "$pkgname.desktop")
sha256sums=('1f3950b2ae02e76644ea5b9f29ac5bcba2ac262089f74fe1bf659af43a79fcef'
            'd1129ae38e1a4990479df8dc0768904bda75fd7680fc1e21bb3ff4711e8fed6b')
PKGEXT=".pkg.tar"

package() {
  # directories
  install -d "$pkgdir"/{usr/{bin,share/{pixmaps,applications}},opt/bbndk}
  # ide
  bsdtar -xf \$IA_PROJECT_DIR\$/rep/qnx-momentics-linux-x86.tar --no-same-owner -C "$pkgdir/opt/bbndk"
  ln -s /opt/bbndk/qde "$pkgdir"/usr/bin/qde
  # .desktop entry
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications
  ln -s /opt/bbndk/icon.xpm "$pkgdir"/usr/share/pixmaps/qde.xpm
  # license
  install -Dm644 \$USER_HOME\$/mysvn/mybuild/svn/licenses/BlackBerrySDKLicenseAgreement112712.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/BlackBerrySDKLicenseAgreement112712.txt
}
