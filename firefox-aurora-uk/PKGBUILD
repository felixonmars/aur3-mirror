# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>
# Contributors: jim945, L42y, aeosynth, Dan Serban

pkgname=firefox-aurora-uk
pkgver=latest
pkgrel=1
pkgdesc="Aurora channel"
url=http://www.mozilla.org/projects/firefox/
arch=(i686 x86_64)
license=(MPL GPL LGPL)
makedepends=(lynx)
depends=(desktop-file-utils libxt mime-types nss shared-mime-info)
source=(firefox-aurora.desktop
        firefox-aurora-safe.desktop)
md5sums=('c93a70dbe8e2668bae99952b248ae48c'
         '1fbf95734ceb475ac2ac6ab085fc1961')

_url_prefix="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n/"

package()
{
  _url=$(lynx -dump "${_url_prefix}" | grep -o http.*uk.linux-${CARCH}.tar.bz2 | tail -1)
  msg "Downloading..."
  wget ${_url}
  msg "Extracting..."
  bsdtar -xf $(basename ${_url})
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  mv firefox "${pkgdir}"/opt/firefox-aurora/
  ln -s /opt/firefox-aurora/firefox "${pkgdir}"/usr/bin/firefox-aurora
  install -m644 "${startdir}"/{firefox-aurora.desktop,firefox-aurora-safe.desktop} "${pkgdir}"/usr/share/applications/
  install -Dm644 "${pkgdir}/opt/firefox-aurora/browser/icons/mozicon128.png" \
  		 "${pkgdir}/usr/share/pixmaps/firefox-aurora-icon.png"
}

