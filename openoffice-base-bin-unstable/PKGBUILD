#!/bin/bash

# Maintainer: Kurt J. Bosch <kjb-temp-2009 at alpenjodel.de>

_lang='en-US'

_source_url="http://download.services.openoffice.org/files/extended/3.4beta"

# Source directories containing the RPMs to install
_source_dirs=( OOO340_m0_native_packed-3_${_lang}.9583 )

# Install path components as found in RPMs
_install_prefix='opt'
_install_name='ooo-dev3'
#_install_name='openoffice.org3'
_install_path=${_install_prefix}/${_install_name}

pkgname=openoffice-base-bin-unstable
pkgver=3.4beta_20110411
pkgrel=1
pkgdesc="OpenOffice.org - Prerelease repackaged from upstream"
arch=('i686' 'x86_64')
url="http://openoffice.org/"
license=('LGPL3' 'GPL2' custom:{THIRDPARTY,WordNet} ) # see below
# Some depends can be found in the README, some with namcap, some with _extract_depends() below
depends=(
	'freetype2'
	'glibc>=2.5'
	'gtk2>=2.10.4'
	'hicolor-icon-theme'
	'desktop-file-utils' 'shared-mime-info' # install script
)
makedepends=(
	'rpmextract'
)
optdepends=(
	'java-runtime: Additional functionality'
	'libgail-gnome: GNOME Assistive Technology'
	'mime-types: provides /etc/mime.types'
	'openoffice-de-bin-unstable: Language pack (example)'
)
#conflicts=( 'openoffice-base-bin' )
backup=( ${_install_path}/program/sofficerc )
options=(!strip docs)
install=openoffice-bin.install
# AUR is tricky
source=( "${_source_url}/" )
md5sums=( '00000000000000000000000000000000' )
case "$CARCH"
in i686 )
	source[0]+=OOo-Dev_${pkgver}_Linux_x86_install-rpm_${_lang}.tar.gz
	md5sums[0]=13cd34b1f28433efd2be27559bb202e6
;; x86_64 )
	source[0]+=OOo-Dev_${pkgver}_Linux_x86-64_install-rpm_${_lang}.tar.gz
	md5sums[0]=21fb5801b7c875e0ee96ae5425d894d7
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
	# unpack RPMs
	local file
	for file in $( _find_rpms ); do
		msg2 "Extracting ${file##*/}"
		rpmextract.sh "${file}"
	done
	msg2 "Completing package"
	# add licenses (found by find pkg -ipath '*license*')
	_ln_s_t usr/share/licenses/${pkgname} '' \
		${_install_path}/THIRDPARTYLICENSEREADME.html \
		${_install_path}/share/extensions/dict-en/WordNet_license.txt
	# link mozilla plugin
	_ln_s_t usr/lib/mozilla/plugins ${_install_name}- ${_install_path}/program/libnpsoplugin.so
	# link desktop files
	_ln_s_t usr/share/applications ${_install_name}- ${_install_path}/share/xdg/*.desktop
	# get desktop files to do something
	mkdir -p usr/bin
	install -m 755 -T <( cat <<EOF
#!/bin/bash
exec /${_install_path}/program/soffice "$@"
EOF
		) usr/bin/${_install_name}
}

## Functions for manual usage

# makepkg -o && source PKGBUILD && _list_rpm_depends
# Helper for finding external dependencies
_list_rpm_depends() {
	local file
	for file in $( _find_rpms ); do
		r=$( rpmmeta -t requirename "${file}" | sed -re 's;(ooobasis|ooo-dev|ooodev|openoffice|rpmlib)[^ ]*;;g' )
		[[ $r ]] || continue
		echo ${file##*/} $r
	done
}

# makepkg -o && source PKGBUILD && _find_license_files
# Helper for finding license files
_find_license_files() {
	find pkg -ipath '*license*' -type f
}

# makepkg -o && source PKGBUILD && _make_install_script >${install}.new
# Helper for porting install scripts
_make_install_script() {
	cat <<EOF
#!/bin/bash

# Inappropriate parts should be removed:
# - mime.type stuff is already provided by mime-types package
# - /etc/mailcap does not exist on ArchLinux normaly
# - Don't use 'which' because tools are already in depends

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
## arg 1:  the new package version
## arg 2:  the old package version
pre_upgrade() {
  pre_install "\$1"
}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
  post_install "\$1"
}

# vim:set ts=2 sw=2 et:
EOF
}
