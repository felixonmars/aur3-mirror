# Maintainer: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban

pkgname=firefox-aurora-nightly
pkgver=14.0a2
pkgrel=1
pkgdesc="Firefox Aurora channel - Nightly build"
url=http://www.mozilla.org/projects/firefox/
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=(desktop-file-utils libxt mime-types nss shared-mime-info)
makedepends=(wget)
_baseurl=http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora
_filename=firefox-${pkgver}.en-US.linux-${CARCH}
source=(firefox-aurora.desktop
	firefox-aurora-safe.desktop
	"${_baseurl}/${_filename}.tar.bz2")
_md5=$(wget -qO- ${_baseurl}/${_filename}.checksums | awk -F' ' '$2 == "md5" && $4 == "'"${_filename}.tar.bz2"'" { print $1 } ')
md5sums=('663176661ce817e40b4217c5e107df42'
	'1fbf95734ceb475ac2ac6ab085fc1961'
	${_md5})
package()
{
  
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  mv firefox firefox-aurora
  mv firefox-aurora "${pkgdir}"/opt/
  ln -s /opt/firefox-aurora/firefox "${pkgdir}"/usr/bin/firefox-aurora
  install -m644 "${startdir}"/{firefox-aurora.desktop,firefox-aurora-safe.desktop} "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/firefox-aurora/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/firefox-aurora-icon.png
}

