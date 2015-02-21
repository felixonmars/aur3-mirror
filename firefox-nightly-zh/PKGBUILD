# Maintainer: 4679kun <btchina@live.com>
#based on firefox-nightly PKGbuild and firefox-nighlty-fr

pkgname=firefox-nightly-zh
pkgdesc='Standalone web browser from mozilla.org, nightly build,Chinese'
url='http://nightly.mozilla.org/'
pkgver=38.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop')
sha512sums=('40b2eaea5d8c2dab7a12728b525d444299105bc06f8994ffc07c2b4d585d267f5b3b8e93dffd6546f3b55bfe5962553c207af51eb30462c2bcadaf6af792cbd6' 'df5989c67251edc0699468833650e7d62ebeb01549ce9954a812236f34b6094187f377959c295e132f7ea966d3a618cc96d3c83c7fd2ffaea38ccbd883367cd7')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite' 'dbus-glib')

package() {
  FX_BASE_SRC="firefox-${pkgver}.zh-CN.linux-${CARCH}"
  FX_TARBALL="${FX_BASE_SRC}.tar.bz2"
  FX_CHKSUM="${FX_BASE_SRC}.checksums"
  FX_GPG="${FX_BASE_SRC}.checksums.asc"
  FX_BASE_URI="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n/"
  FX_SRC_URI="${FX_BASE_URI}/${FX_TARBALL}"
  FX_CHKSUM_URI="${FX_BASE_URI}/${FX_CHKSUM}"
  FX_GPG_URI="${FX_BASE_URI}/${FX_GPG}"


  msg "Downloading..."
  curl -OR ${FX_SRC_URI}
  curl -OR ${FX_CHKSUM_URI}
  curl -OR ${FX_GPG_URI}
  msg "Verifying SHA512 checksum..."
  grep ${FX_TARBALL} ${FX_CHKSUM}|grep sha512 |sed 's/sha512\ [0-9]*\ //' > sha512
  sha512sum -c sha512
  # uncomment this line to enable GnuPG signature verification. You'll need Firefox's GnuPG release key.
  # Their current fingerprint is 9D03 193D 6BDC 541B D796  C4E4 7F4D 6645 1EBC AB3A shortid 0x1EBCAB3A
  #  msg "Verifying GnuPG signature..."
  #  gpg --verify ${FX_GPG}
  msg "Extracting..."
  bsdtar -x -f ${FX_TARBALL}
  msg "Packaging..."
  #  uncomment this line to remove these
  #  rm -rf firefox/{extensions,plugins,searchplugins}
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"

  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
}
