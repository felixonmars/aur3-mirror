# Maintainer: ValHue <vhuelamo_at_gmail_dot_com>

pkgname=cinnamon-applet-libreoffice-quick-start
pkgver=1.0
pkgrel=1
pkgdesc="Quick-launch menu for Libre Office programs."
arch=('i686' 'x86_64')
url="http://cinnamon-spices.linuxmint.com/applets/view/110"
license=('GPL3')
depends=('cinnamon' 'libreoffice-'{base,writer,calc,draw,math,impress}'')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/TQJJ-I1AW-GT8P.zip")
md5sums=('b35f28dcde2e027fccac6b47488cc961')

package() {
    find libreOfficeQuickStart\@scollins -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/cinnamon/applets/{}" \;
}
