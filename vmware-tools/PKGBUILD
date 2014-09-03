#Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>


pkgname=vmware-tools
pkgver=9.6.2.1895310
_wsver=10.0.3
pkgrel=1
pkgdesc="Tools for guest operating systems"
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
	sha256sums=('a29cd4da7ab668d9399f87984ce69bdc8743f268371c08be313902763ca3966b'
            '13e68e79a45902c03d6a3fa9db32777c3f421af05bca1d24d8e90833f3018880'
            'ce39ae0665a17d5057501f2bdfdac62f2ae19e7f73f6f715f4a37cf6b76100b6'
            '6144a87c9f7f1edd69120ac1e0bef24d031edb23e235b6beeb6a0549b10f33a4'
            'ca588598569c67cfc39bcbc8a571ed0e186e89d35a065e6cb8a129299a04e967'
            'd62e19c20b93d1617f9aab9af1ed815b1f0ff483ac5e5ee5f972d6b566be4f11'
            '6da856f4438c271d1082d1bd247ea587a6cb90d7e45130f97f55d948af69ed94'
            '4ee8796c9b4cdad00e9ed51f5a3e986f69b306f28675b7a0672522f5abcaa8f3')
elif [ "$CARCH" = "x86_64" ]; then
	sha256sums=('79b6e5db2967ddd46f58dcf7b2186caa8a05ff8d46ec82adf4b51132d5a0bcf3'
            'a53a28338313767e81f0a7a00479ce82924fe1aa5e6c891302b2547b1d47ad1b'
            '83fce0c67fa8202d28ed90f2da38eafd5e77286517d13224493bdc4dd92d4308'
            'd0dfa2ca230c258db834a3d84d49b8fef9138a62e8b6569758fbfcddf94d0d7c'
            'f04405e322a6a30ca69cbf540d749d822d54b193061259e9fd940e3e61c4503b'
            'bc4a6192f5b66602179e5932dc31b1c1ab01cbb23153a3663a88eab9be784493'
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
