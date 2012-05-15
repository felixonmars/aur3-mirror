# Contributor: Chen Zhiqiang <chenzhiqiang@gmx.com>

pkgname=opendesktop-fonts-oxos
pkgver=1.6.0
pkgrel=1
pkgdesc='Chinese TrueType Fonts from opendesktop.org.tw'
arch=('any')
url='http://www.opendesktop.org.tw/'
license=('custom:Arphic Public License')
depends=('fontconfig' 'xorg-font-utils')
#makedepends=('rpmextract')
install=opendesktop-fonts.install
provides=('ttf-fireflysung' 'opendesktop-fonts')
replaces=('ttf-fireflysung' 'opendesktop-fonts')
source=('http://opensource.nchc.org.tw/odp/oxos/releases/2/i386/os/Packages/opendesktop-fonts-1.6.0-1.ox2.noarch.rpm')
md5sums=('112cfb49b6acf733f8f35f713c62dd31')

package() {
  cd ${srcdir}/usr/share/fonts/opendesktop/TrueType
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m 644 *.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m 644 *.ttc ${pkgdir}/usr/share/fonts/TTF
  cd ${srcdir}/usr/share/doc/opendesktop-fonts-1.6.0
  install -D -m644 COPYRIGHT ${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT
}
