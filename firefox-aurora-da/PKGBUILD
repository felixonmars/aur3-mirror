# Maintainer: kemuel <filip_a_kemuel.dk>
# Contributor: strg "kbks_a_o2.pl >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath, py_crash , ravicious

pkgname=firefox-aurora-da
pkgver=latest
pkgrel=2
pkgdesc="Firefox Developer Edition (Danish l10n)"
url=http://www.mozilla.org/en_US/firefox/aurora/
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=('gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
optdepends=()
makedepends=('wget' 'lynx')
provides=(firefox-aurora)
conflicts=(firefox-aurora firefox)
install=$pkgname.install
_url_prefix=http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n/
_installfile=$(lynx -dump "${_url_prefix}" | grep -o http.*da.linux-${CARCH}.tar.bz2 | tail -1)
_checksumfile=$(lynx -dump "${_url_prefix}" | grep -o http.*da.linux-${CARCH}.checksums | tail -1)
_filename=$(basename ${_installfile})
source=(firefox.desktop
	"${_installfile}")
_md5=$(wget -qO- ${_checksumfile} | awk -F' ' '$2 == "md5" && $4 == "'"${_filename}"'" { print $1 } ')
md5sums=('518940579c8374e4c05740477cd7ccfe'
         ${_md5})
package()
{
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  mv firefox firefox-aurora
  mv firefox-aurora "${pkgdir}"/opt/
  ln -s /opt/firefox-aurora/firefox "${pkgdir}"/usr/bin/firefox-aurora
  install -m644 "${startdir}"/firefox.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/firefox-aurora/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/firefox-beta.png
}

