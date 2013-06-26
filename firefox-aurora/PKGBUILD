# Maintainer: Agustin Ferrario "py_crash < agustin dot ferrario at hotmail dot com dot ar >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath

pkgname=firefox-aurora
pkgver=24.0a2
pkgrel=2
pkgdesc="Firefox Aurora channel - Nightly build"
url=http://www.mozilla.org/en_US/firefox/aurora/
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=('gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme' 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
optdepends=()
makedepends=('wget')
install=$pkgname.install

_baseurl=http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora
_filename=firefox-${pkgver}.en-US.linux-${CARCH}

source=(firefox-aurora.desktop
	firefox-aurora-safe.desktop
	"${_baseurl}/${_filename}.tar.bz2")

sha512sums=('1c0eef1129625ecfb70809dbb9ab764054d1680f05b7807f503145b5889bc42babb268cb4e2b7b102f90c50cc249114f773d91992e9ac41b5a6966e3b5c95675'
            '749bc9bb180909c7319a1576e9df1e4cb06488b33b8dd61b8f1a63e4df9208cb9bb6d0c4ecef3fbe388f78368aef4562ae1dbfda1dbbfa649aa9d247c4903610')
    
[[ "$CARCH" == "i686" ]] && sha512sums+=('624349678ef57cf344926aad37699712cdc3ea75ea6b45c51389584e1aaf53ad1a576977e5e53f29c76c12505b8e46d83d47144feb3a81dea3cfe7df9a131ae2')
[[ "$CARCH" == "x86_64" ]] && sha512sums+=('03fed89a8bee3c895f0ce00969cedd2265981cb6dbc316b0729040fee4d2e12559c5bd718d52f19451873d9fe542ff8b0b2cdcae976928f588f65f03dc4e4403')
             
package()
{
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  mv firefox firefox-aurora
  mv firefox-aurora "${pkgdir}"/opt/
  ln -s /opt/firefox-aurora/firefox "${pkgdir}"/usr/bin/firefox-aurora
  install -m644 "${startdir}"/{firefox-aurora.desktop,firefox-aurora-safe.desktop} "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/firefox-aurora/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/firefox-aurora-icon.png
}

