# Maintainer: Blissfull <narthanaepa at gmail a-dot com>
# Based on thunderbird-nightly by Det <nimetonmaili at gmail a-dot com>
# Based on [extra]'s thunderbird

pkgname=thunderbird-miramar
pkgver=5.0b2pre
pkgrel=1
pkgdesc="Standalone Mail/News reader - Miramar build"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/projects/thunderbird"
depends=('gtk2' 'gcc-libs' 'mozilla-common' 'nss' 'libxt' 'shared-mime-info' 'alsa-lib' 'dbus-glib' 'hunspell' 'sqlite3>=3.7.4')
optdepends=('libcanberra: for sound support'
	    'yasm: for WebM support')
provides=("thunderbird=${pkgver}")
install=${pkgname}.install
source=(https://ftp.mozilla.org/pub/mozilla.org/thunderbird/nightly/latest-comm-miramar/thunderbird-${pkgver}.en-US.linux-${CARCH}.tar.bz2
        thunderbird-miramar.desktop)
sha512sums=(`wget ${source/ta*}checksums -qO - | grep bz | cut -d " " -f1`
            'a02ad428b39337ff536689c539536686d8eb33d8d161429e3d0db487071f517f7b0ece3e19ee76d8ef5d825fa17ae5a66e6d2d4bb9597d42949f04b4a3853187')

package() {
  sed -i 's|/usr/local/lib|/opt|' thunderbird/thunderbird

  install -dm755 "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -a thunderbird "${pkgdir}/opt/thunderbird-${pkgver}"

  ln -s /opt/thunderbird-${pkgver}/thunderbird "${pkgdir}/usr/bin/thunderbird-miramar"
  install -m644 thunderbird/chrome/icons/default/default48.png "${pkgdir}/usr/share/pixmaps/thunderbird-miramar.png"
  install -m644 thunderbird-miramar.desktop "${pkgdir}/usr/share/applications"
}