#!/bin/bash

# Maintainer: Ferik <djferik at gmail.com>

_lang="it"
_source_dirs=( "${_lang}/RPMS" )
_install_prefix='opt'
_install_name='openoffice4'
_install_path=${_install_prefix}/${_install_name}

pkgname=openoffice-ita
_pkgname=openoffice
replaces=('openoffice-base-bin')
pkgver=4.0.0
pkgrel=1
pkgdesc="La suite libera e completa per l'ufficio."
url="http://www.openoffice.org/it/"
arch=('i686' 'x86_64')
license=('Apache')
depends=(
	'freetype2'
	'glibc>=2.5'
	'gtk2>=2.10.4'
	'hicolor-icon-theme'
	'desktop-file-utils' 
        'shared-mime-info'
)

makedepends=(
	'rpmextract'
)

optdepends=(
	'apr-util:           adds apr support'
	'jre:                adds java (Oracle) support'
	'gconf:              adds additional gnome support'
	'gstreamer0.10-base: + some gstr-plugins to support multimedia content, e.g. in impress'
	'mesa:               for the OGLTrans extension of impress'
	'mime-types:         provides /etc/mime.types'
	'nss:                adds support for signed files/macros'
	'python2:             adds python support'
	'raptor1:            adds rdf support'
	'sqlite:             adds sqlite support'
)

conflicts=('openoffice-base-bin-unstable', 'openoffice-beta-it')
backup=( ${_install_path}/program/sofficerc )
options=(!strip docs)
install=${pkgname}.install
source=("http://downloads.sourceforge.net/project/openofficeorg.mirror/4.0.0/binaries/it/")

case "$CARCH"
in i686 )
	source[0]+="Apache_OpenOffice_4.0.0_Linux_x86_install-rpm_${_lang}.tar.gz"
	sha256sums[0]='52218e338ac637703caf7c9c51cdb522e7b871c19a08b8de586398ce639f5589'
;; x86_64 )
	source[0]+="Apache_OpenOffice_4.0.0_Linux_x86-64_install-rpm_${_lang}.tar.gz"
	sha256sums[0]='80d2f34df925874b3333ce82b90b096a621ac9f274ee38cc410fd0fff2c9a5ca'
esac

_find_rpms() {
	local dir file
	for dir in "${_source_dirs[@]}"; do
		dir=${srcdir:-src}/${dir}
		( cd "${dir}" ) # check existing
		for file in $( find "${dir}" -type f -name '*.rpm' ); do
			if ! [[ $file == */desktop-integration/* && $file != *-freedesktop-menus-* ]] &&
			   ! [[ $file == */jre-* ]]; then
				echo "${file}"
			elif type -p msg2 >/dev/null; then
				msg2 "Skipping ${file##*/}" >&2
			else
				echo "Skipping ${file##*/}" >&2
			fi
		done
	done
}

_ln_s_t() {
	local dir=$1 prefix=$2
	shift 2
	mkdir -p "$dir"
	local file
	for file in "${@}"; do
		readlink -v -e "${file}" >/dev/null # check existing
		ln -s -T /"${file}" "${dir}/${prefix}${file##*/}"
	done
}

package() {
	cd "${pkgdir}"

	local file
	for file in $( _find_rpms ); do
		msg2 "Extracting ${file##*/}"
		rpmextract.sh "${file}"
	done
	msg2 "Completing package"

	[[ -h usr/bin/soffice ]] && rm -f usr/bin/soffice

	_ln_s_t usr/share/licenses/${_pkgname} '' \
		${_install_path}/program/LICENSE

	sed -i -re "1s;^#! *(/usr(/local)?)?/bin/(env +)?python(2[^ ]*)?( |$);#!/usr/bin/env python2 ;" $(
		find opt/openoffice4/program/python-core-2.7.5/lib -type f -name '*.py'
	)


	msg  "Note: For checking the package, you may run: namcap -e elfpaths,emptydir ${_pkgname}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
}

_list_rpm_depends() {
	local file
	for file in $( _find_rpms ); do
		r=$( rpmmeta -t requirename "${file}" | sed -re 's;(ooobasis|ooo-dev|ooodev|openoffice|rpmlib)[^ ]*;;g' )
		[[ $r ]] || continue
		echo ${file##*/} $r
	done
}

_find_license_files() {
	find pkg -ipath '*license*' -type f
}

_make_install_script() {
	cat <<EOF

#!/bin/bash

EOF

	for args in 'prein pre_install' 'postin post_install' 'preun pre_remove' 'postun post_remove'; do
		set -- $args
		echo "$2() {"
		echo "  local RPM_INSTALL_PREFIX='${_install_prefix}'"
		echo
		local file code
		for file in $( _find_rpms ); do
			code=$( rpmmeta -t $1 "${file}" )
			[[ $code ]] || continue
			echo "  ( ### ${file##*/} $1"
			echo "$code"
			echo "  )"
			echo
		done
		echo "}"
		echo
	done

cat <<EOF
pre_upgrade() {
  pre_install "\$1"
}
post_upgrade() {
  post_install "\$1"
}

EOF
}
