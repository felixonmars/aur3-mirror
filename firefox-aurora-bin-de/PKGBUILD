# Maintainer: Sascha Biermmanns email via https://privacybox.de/saschakb.msg
# based on the PKGBUILD from: L42y <423300@gmail.com>
# Contributor: aeosynth <james.r.campos@gmail.com>
pkgname=firefox-aurora-bin-de
pkgdesc='Aurora channel is where users can test the latest features and innovations in Firefox web browser'
url='http://www.mozilla.org/projects/firefox'
pkgver=8.0a2
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=('firefox-aurora.desktop' 'firefox-aurora-safe.desktop')
sha1sums=('879ef74d3d1d558851c95a8fd2aef2a496f1a0d8'
          '4cb4e97c195d70f1e1b801829b03f5636289797f')
depends=('desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')

_fxsrc="firefox-${pkgver}.de.linux-${CARCH}.tar.bz2"
_fxurl="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n/${_fxsrc}"

package() {
  msg "Downloading..."
  wget -N ${_fxurl}
  msg "Extracting..."
  bsdtar -x -f ${_fxsrc}
  msg "Packaging..."

  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/${pkgname}"

  ln -s /opt/${pkgname}/firefox "${pkgdir}/usr/bin/firefox-aurora"
  install -m644 "${srcdir}"/{firefox-aurora.desktop,firefox-aurora-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
}
