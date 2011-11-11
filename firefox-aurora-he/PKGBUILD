# Maintainer: Yoel Lion <yoel3ster at gmail dot com>
# based by L42y's PKGBUILD  <423300@gmail.com>
# Contributor: aeosynth <james.r.campos@gmail.com>
pkgname=firefox-aurora-he
pkgdesc='Aurora channel is where users can test the latest features and innovations in Firefox web browser - hebrew translation'
url='http://www.mozilla.org/projects/firefox'
pkgver=10.0a2
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=('firefox-aurora-he.desktop' 'firefox-aurora-he-safe.desktop')
sha1sums=('b2afd80755a311312dd97e000bac79cb87ff4cdd'
          '2a12daa7af9b03ca9297bae7a349fc7d7c006dba')
depends=('desktop-file-utils' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
makedepends=('wget')
_fxsrc="firefox-${pkgver}.he.linux-${CARCH}.tar.bz2"
_fxurl="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n/${_fxsrc}"

package() {
  msg "Downloading..."
  wget -N ${_fxurl}
  msg "Extracting..."
  bsdtar -x -f ${_fxsrc}
  msg "Packaging..."

  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/${pkgname}"

  ln -s /opt/${pkgname}/firefox "${pkgdir}/usr/bin/${pkgname}"
  install -m644 "${srcdir}"/{$pkgname.desktop,$pkgname-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
}
