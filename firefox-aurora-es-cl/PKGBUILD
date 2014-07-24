# Maintainer: Juan Ponce Riquelme, jmponce@gmail.com 

_name=firefox
_channel=aurora-es-cl
_milestone=32.0a2
pkgname="${_name}-${_channel}"
pkgver=32.0a2
pkgrel=1
pkgdesc="Firefox Aurora channel - Nightly build - Español (Chile)"
url="http://www.mozilla.org/en-US/firefox/aurora"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
install="${pkgname}.install"

_baseurl="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n"
_filename="${_name}-${_milestone}.es-CL.linux-${CARCH}"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep sha512 | cut -d " " -f1)"
source=("firefox-aurora.desktop"
	"firefox-aurora-safe.desktop"
	"${_baseurl}/${_filename}.tar.bz2")

sha512sums=('1c0eef1129625ecfb70809dbb9ab764054d1680f05b7807f503145b5889bc42babb268cb4e2b7b102f90c50cc249114f773d91992e9ac41b5a6966e3b5c95675'
            '749bc9bb180909c7319a1576e9df1e4cb06488b33b8dd61b8f1a63e4df9208cb9bb6d0c4ecef3fbe388f78368aef4562ae1dbfda1dbbfa649aa9d247c4903610'
            "${_sha512sum}")
pkgver() {
       cd "${_name}"
          echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
      }

package() {
  install -d "$pkgdir"/{usr/bin,opt}
  mv "${_name}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_name}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "firefox-aurora.desktop" "${pkgdir}/usr/share/applications/firefox-aurora.desktop"
  install -Dm644 "firefox-aurora-safe.desktop" "${pkgdir}/usr/share/applications/firefox-aurora-safe.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/browser/icons/mozicon128.png" \
  		 "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
} 
