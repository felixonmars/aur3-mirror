# Maintainer: Laudivan Freire de Almeida, laudivan@gmail.com
# Sobradinho, Bahia, Brazil

_name=firefox
_channel=aurora-pt_br
_milestone=41.0a2
pkgname="${_name}-${_channel}"
pkgver=41.0a2
pkgrel=1
conflicts=('firefox')
pkgdesc="Firefox Aurora channel - Nightly build - Brazilian Portuguese"
url="http://www.mozilla.org/en-US/firefox/aurora"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 
	 'alsa-lib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell' 'gtkdialog')
install="${pkgname}.install"

_baseurl="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n"
_filename="${_name}-${_milestone}.pt-BR.linux-${CARCH}"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep sha512 | cut -d " " -f1)"
source=("${pkgname}.desktop"
	"${pkgname}-safe.desktop"
	"aur_prefs.js"
	"${_baseurl}/${_filename}.tar.bz2")

sha512sums=('25f258d7682be52cced476204f841d42f794a4ef1936a105259105b945741d0d7dbfc18e45a5bd4f564cec97ce30e97acaddca1a14f046a88500e5bca8e52877'
	    '279703549813c9867676635571c49f58bc57ca1692b650818d9aec9c97b7fa81cf5e3539a216d3810adf12f99421492abfc465d9de89d287a3e9525c0eb3b710'
	    'e507ba66502bd081b72d094ea96e08114f630f956bfba5c666237247c2c98a2351a715a61627a83f4e0c46ed1ef1a83f52a61315c447591f07252ed4dcdb536d'
            "${_sha512sum}")
pkgver() {
       cd "${_name}"
          echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
      }

package() {
  install -d "$pkgdir"/{usr/bin,usr/lib}
  mv "${_name}" "${pkgdir}/usr/lib/${_name}"
  ln -s "/usr/lib/${_name}/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
  install -Dm644 "${pkgname}-safe.desktop" "${pkgdir}/usr/share/applications/${_name}-safe.desktop"
  install -Dm644 "aur_prefs.js" "${pkgdir}/usr/lib/${_name}/defaults/pref/aur_prefs.js"
  install -Dm644 "${pkgdir}/usr/lib/${_name}/browser/icons/mozicon128.png" \
  		 "${pkgdir}/usr/share/pixmaps/${_name}-icon.png"
}
