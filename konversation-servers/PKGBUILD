# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_basename_=konversation
pkgname=${_basename_}-servers
pkgver=0.1
pkgrel=1
pkgdesc="Reads the mIRC server list and imports it into your Konversation server list."
arch=("any")
url="http://konversation.kde.org/wiki/Server_List"
license=("GPL")
depends=("perl" "perl-config-tiny" "perl-file-homedir" "${_basename_}")
options=(!emptydirs)
source=(${pkgname})

package() {
	cd "${startdir}"

	# Application
	install -D ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}

sha1sums=('3f5363c2f7ce22b868af44d9921942b7ee19a465')
