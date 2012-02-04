# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Kurt J. Bosch <kjb-temp-2009 at alpenjodel dot de>

_lang=pl
pkgname=openoffice-${_lang}-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Polish language pack for OpenOffice.org - Repackaged from upstream"
arch=('any')
url="http://openoffice.org/"
license=('LGPL3')
depends=('openoffice-base-bin')
makedepends=(
	'coreutils' 'findutils' 'rpmextract'
#	'binutils' 'tar' # _debunpack()
)
options=(!strip docs)

_url="http://download.services.openoffice.org/files"

# RPMS directory name is same as in openoffice-base-bin (stable 3.3.0)
_pkgver="3.3.0rc10"
_dirs=( "${srcdir}"/OOO330_m20_native_packed-1_${_lang}.9567 )

source=("${_url}"/extended/${_pkgver}/OOo_${_pkgver}_20110118_Linux_x86_langpack-rpm_${_lang}.tar.gz)

md5sums=('9b7703b23cbdd62d21562c74c0105fb3')

#_debunpack() { ar -p "$1" data.tar.gz | tar -xz; }

package() {
	cd "${pkgdir}"
	# unpack RPMs and DEBs
	local dir file
	for dir in "${_dirs[@]}"; do
		for file in $( cd "${dir}" && find -type f \( -name '*.rpm' -o -name '*.deb' \) ); do
			msg2 "Extracting ${file#./}"
			case $file
			in *.rpm ) rpmextract.sh "${dir}/${file}"
			;; *.deb ) _debunpack    "${dir}/${file}"
			esac
		done
	done
	local base=opt
	# link license files
	local file i=0
	for file in $( find "${base}" -type f -name 'THIRDPARTY*LICENSE*.html' ); do
		mkdir -p usr/share/licenses/${pkgname}
		ln -sT /${file} usr/share/licenses/${pkgname}/THIRDPARTY-$((++i)).html
		license+=( "custom:THIRDPARTY-$i" )
	done
}
