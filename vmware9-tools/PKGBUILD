#Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>

pkgname=vmware9-tools
pkgver=9.2.4.1945795
_wsver=9.0.4
pkgrel=1
pkgdesc="Tools for guest operating systems (VMware 9.x)"
arch=('i686' 'x86_64')
url="http://kb.vmware.com/kb/340"
license=('custom:vmware')

_PV=$(echo ${pkgver} | cut -d . -f 1-3)
_MINOR=$(echo ${pkgver} | cut -d . -f 3)
_BUILD=$(echo ${pkgver} | cut -d . -f 4)
_BASE_URI="http://softwareupdate.vmware.com/cds/vmw-desktop/ws/${_wsver}/${_BUILD}/linux/packages/"

depends=()
makedepends=('libxslt')

if [ "$CARCH" = "i686" ]; then
	sha256sums=('efe881c0aaff88b064cecf6d250ed4e6ba7fcfc56849174bbfb7b8c306f846f2'
            '9dfa2e35031d1fdf3a091fb5f19b8db3be90c1cc8bec7d2940635f63643e9a5d'
            'c95c3645ac79ff32c26ee05da08e1cd077d4f6600336f4869090464578cb1b30'
            '1eef7837b1bfdff5af2b4ba80f48a3a2ea062a4806ab4828c3a22f7de315b484'
            'f3b514bbf6c757afb8555f2766cf6bb370056f22dc7922661cf21fbf539c589e'
            '0aa62874ea7595ab5120104eef00baf5710ea5b7686660c9bba58d38c17d060b'
            '6da856f4438c271d1082d1bd247ea587a6cb90d7e45130f97f55d948af69ed94'
            '4ee8796c9b4cdad00e9ed51f5a3e986f69b306f28675b7a0672522f5abcaa8f3')
elif [ "$CARCH" = "x86_64" ]; then
	sha256sums=('4909d1f249a447a45c4ada85568c85e8bec987f8a974cafab9e504adeb2536ea'
            '1dcdb9f21b6199830326f3b3271b8b3682227edc9956d183f489c27fd187dd7a'
            '2a0fb6e1fd42f960afb571e9b33c4b2757faed25b5d1b8c62957b18067645948'
            '24b13ffc71bc2b02aa8fed367503723f40c394a0a7955db4925d23051666ca5d'
            '87132d34dffd98c3effbc65beae0ffa858aa62e20185fe5742e824432a541570'
            'acc80d832404dfabe42e4312f53b53cd9acb23b584dee35c757c254e63ccbc4d'
            '6da856f4438c271d1082d1bd247ea587a6cb90d7e45130f97f55d948af69ed94'
            '4ee8796c9b4cdad00e9ed51f5a3e986f69b306f28675b7a0672522f5abcaa8f3')
fi

_VMWARE_GUEST="freebsd linux netware solaris windows winPre2k"

_VM_INSTALL_DIR="/opt/vmware"

source=()
for guest in ${_VMWARE_GUEST} ; do
	if [ "$CARCH" = "i686" ]; then
		source+=("${_BASE_URI}vmware-tools-${guest}-${_PV}-${_BUILD}.i386.component.tar")
	elif [ "$CARCH" = "x86_64" ]; then
		source+=("${_BASE_URI}vmware-tools-${guest}-${_PV}-${_BUILD}.${CARCH}.component.tar")
	fi
done ; unset guest

source+=('list-bundle-components.xsl'
	'list-component-files.xsl')

vmware-bundle_extract-component() {
	local component=${1:?} dest=${2:-.}
	local -i offset=${3}
	local -i component_manifestOffset=$(od -An -j$((offset+9)) -N4 -tu4 "${component}")
	local -i component_manifestSize=$(od -An -j$((offset+13)) -N4 -tu4 "${component}")
	local -i component_dataOffset=$(od -An -j$((offset+17)) -N4 -tu4 "${component}")
	local -i component_dataSize=$(od -An -j$((offset+21)) -N8 -tu8 "${component}")
	tail -c+$((offset+component_manifestOffset+1)) "${component}" 2> /dev/null |
		head -c$((component_manifestSize)) | xsltproc "${srcdir}"/list-component-files.xsl - |
		while read -r file_offset file_compressedSize file_uncompressedSize file_path ; do
			if [[ ${file_path} ]] ; then
				echo -n '.'
				file_path="${dest}/${file_path}"
				mkdir -p "$(dirname "${file_path}")" || return 1
				tail -c+$((offset+component_dataOffset+file_offset+1)) "${component}" 2> /dev/null |
					head -c$((file_compressedSize)) | gzip -cd > "${file_path}" || return 1
			fi
		done
	echo
}

build() {
	cd "$srcdir"
	local arch
	if [ "$CARCH" = "i686" ] ; then arch='i386'
	elif [ "$CARCH" = "x86_64" ] ; then arch='x86_64'
	fi
	local guest ; for guest in ${_VMWARE_GUEST} ; do
		local component="vmware-tools-${guest}-${_PV}-${_BUILD}.${arch}.component"
		echo "Extracting '${component}'"
		vmware-bundle_extract-component "${component}"
	done
}

package() {
	cd "$srcdir"
	install -d "$pkgdir/${_VM_INSTALL_DIR}"/lib/vmware/isoimages
	local guest ; for guest in ${_VMWARE_GUEST} ; do
		cp -dr --no-preserve=ownership "${guest}".iso{,.sig} "$pkgdir/${_VM_INSTALL_DIR}"/lib/vmware/isoimages
	done
}
