# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: Aaron Hurt <ahurt@anbcs.com>

pkgname=thunderbird-branded-bin
pkgver=3.1.9
pkgrel=1
pkgdesc="Standalone Mail/News reader - Branded binary version"
arch=('i686')
url="http://www.mozilla.org/projects/thunderbird"
license=('MPL' 'GPL2' 'LGPL2.1')
depends=('gtk2' 'gcc-libs' 'mozilla-common' 'nss' 'libxt' 'shared-mime-info' 'alsa-lib' 'dbus-glib' 'hunspell' 'sqlite3>=3.7.4')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=${pkgver}")
conflicts=(thunderbird)
install=${pkgname}.install
source=(ftp://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}/linux-i686/en-US/thunderbird-${pkgver}.tar.bz2
        thunderbird.desktop)
md5sums=(`wget ${source/li*}/MD5SUMS -qO - | grep en-US | grep bz | cut -d " " -f1`
         'da7d555a512cdd60a49dd495b5e09bfb')

package() {
  # fix moz lib path
  sh "sed -i 's|/usr/local/lib/thunderbird-${pkgver}|/usr/lib/thunderbird|' thunderbird/thunderbird"

  # create dirs
  install -dm755 "${pkgdir}"/usr/{bin,lib/thunderbird,share/{applications,pixmaps}}

  # install the moz bin to bin path
  install -m755 thunderbird/thunderbird "${pkgdir}/usr/bin"

  # copy over the moz package content
  cp -a thunderbird/* "${pkgdir}/usr/lib/thunderbird"

  # install icon and desktop files
  install -m644 thunderbird/chrome/icons/default/default48.png "${pkgdir}/usr/share/pixmaps/thunderbird.png"
  install -m644 thunderbird.desktop "${pkgdir}/usr/share/applications"
}