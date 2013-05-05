#Maintainer: Shaumux <shaumya "at" gmail {dot} com>


pkgname=vmware-workstation
pkgver=9.0.2.1031769
pkgrel=3
pkgdesc="Emulate a complete PC on your PC without the usual performance overhead of most emulators"
arch=('i686' 'x86_64')
url="http://www.vmware.com/products/workstation/overview.html"
license=('custom:vmware')
conflicts=('vmware-player')
options=('!strip' '!libtool' 'emptydirs')
install=${pkgname}.install

_PN="VMware-Workstation"
_PV=$(echo ${pkgver} | cut -d . -f 1-3)
_MINOR=$(echo ${pkgver} | cut -d . -f 3)
_BUILD=$(echo ${pkgver} | cut -d . -f 4)
_P="${_PN}-${_PV}-${_BUILD}"

provides=("vmware-player=5.0.$_MINOR")
optdepends=('cups' 'dbus' 'vmware-tools' )
makedepends=('libxslt')

if [ "$CARCH" = "i686" ]; then
    sha256sums=('f23efa3db418790cffa38a90639edd0f5e0834fa98c69a3146489cc3774a71c7'
		'6da856f4438c271d1082d1bd247ea587a6cb90d7e45130f97f55d948af69ed94'
		'4ee8796c9b4cdad00e9ed51f5a3e986f69b306f28675b7a0672522f5abcaa8f3'
		'2a0572a5fae7f6d96ff7e42b1e225f70e2ffa704a2b113e4451c449e05a28390'
		'435baf3c56e0901d85b59c5632e2e0e37e9540562d2bf9b1314cea15b09d2c46'
		'e64ee39ccdf5ec0f1eff1650ab1eb456773b089742951dd32e4db23d5fe9b8e0'
		'ac2af51a9d9586d66eb3b4e86ae00ee0ec2d36647de1cd956e574102793fff53'
		'7fab745b05e9a0861e6b896da6101f391a99db41f6060c0c1423ef972cc35759'
		'5accef764615659d51a0bed181766df40718848ba8fa37263301db58121914e1'
		'0d04cfb8d70c982d57b6729fe71bb45831300114c4beceb578706c6e96972e3a'
		'671d558224423e2dcbfda35fa49f24e40185efc0cb34b3facefd72dbe7150420'
		'8f4c555d72869b3a2f117ec4cbf7ea5a7ea5a0fd02c09fadc6de9eb06ddfa976')
    source=("https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${_PV}/${_BUILD}/linux/core/${_P}.i386.bundle.tar"
	'list-bundle-components.xsl'
	'list-component-files.xsl'
	'vmware-authd'
	'vmware-authentication.service'
	'vmware-usb.service'
	'vmware-vmblock.service'
	'vmware-vmci.service'
	'vmware-vmmon.service'
	'vmware-vmnet.service'
	'vmware-vmsock.service'
	'vmware.target')
    depends=('openssl098' 'librsvg' 'libpng12' 'curl' 'fuse' 'libsm' 'hicolor-icon-theme' 'desktop-file-utils' 'at-spi2-core' 'startup-notification' 'libglade' 'gtkmm' 'glibc')
elif [ "$CARCH" = "x86_64" ]; then
    sha256sums=('53e175340086f8be2a9cf6c272fe1f8721aa06ed227a2c880a23323c4c491ee3'
		'6da856f4438c271d1082d1bd247ea587a6cb90d7e45130f97f55d948af69ed94'
		'4ee8796c9b4cdad00e9ed51f5a3e986f69b306f28675b7a0672522f5abcaa8f3'
		'2a0572a5fae7f6d96ff7e42b1e225f70e2ffa704a2b113e4451c449e05a28390'
		'435baf3c56e0901d85b59c5632e2e0e37e9540562d2bf9b1314cea15b09d2c46'
		'e64ee39ccdf5ec0f1eff1650ab1eb456773b089742951dd32e4db23d5fe9b8e0'
		'ac2af51a9d9586d66eb3b4e86ae00ee0ec2d36647de1cd956e574102793fff53'
		'7fab745b05e9a0861e6b896da6101f391a99db41f6060c0c1423ef972cc35759'
		'5accef764615659d51a0bed181766df40718848ba8fa37263301db58121914e1'
		'0d04cfb8d70c982d57b6729fe71bb45831300114c4beceb578706c6e96972e3a'
		'671d558224423e2dcbfda35fa49f24e40185efc0cb34b3facefd72dbe7150420'
		'8f4c555d72869b3a2f117ec4cbf7ea5a7ea5a0fd02c09fadc6de9eb06ddfa976')
    source=("https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${_PV}/${_BUILD}/linux/core/${_P}.x86_64.bundle.tar"
	'list-bundle-components.xsl'
	'list-component-files.xsl'
	'vmware-authd'
	'vmware-authentication.service'
	'vmware-usb.service'
	'vmware-vmblock.service'
	'vmware-vmci.service'
	'vmware-vmmon.service'
	'vmware-vmnet.service'
	'vmware-vmsock.service'
	'vmware.target')
    depends=('openssl098' 'librsvg' 'libpng12' 'curl' 'fuse' 'libsm' 'hicolor-icon-theme' 'desktop-file-utils' 'lib32-glibc' 'at-spi2-core' 'startup-notification' 'libglade' 'gtkmm')
fi



vmware-bundle_extract-bundle-component() {
	local bundle=${1} component=${2} dest=${3:-${2}}
	local -i bundle_size=$(stat -L -c'%s' "${bundle}")
	local -i bundle_manifestOffset=$(od -An -j$((bundle_size-36)) -N4 -tu4 "${bundle}")
	local -i bundle_manifestSize=$(od -An -j$((bundle_size-40)) -N4 -tu4 "${bundle}")
	local -i bundle_dataOffset=$(od -An -j$((bundle_size-44)) -N4 -tu4 "${bundle}")
	local -i bundle_dataSize=$(od -An -j$((bundle_size-52)) -N8 -tu8 "${bundle}")
	tail -c+$((bundle_manifestOffset+1)) "${bundle}" 2> /dev/null | head -c$((bundle_manifestSize)) |
		xsltproc "${srcdir}"/list-bundle-components.xsl - |
		while read -r component_offset component_size component_name ; do
			if [[ ${component_name} == ${component} ]] ; then
				echo "Extracting '${component_name}' component from '$(basename "${bundle}")'"
				vmware-bundle_extract-component "${bundle}" "${dest}" $((bundle_dataOffset+component_offset))
			fi
		done
}

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

VM_INSTALL_DIR="/opt/vmware"
VM_DATA_STORE_DIR="/var/lib/vmware/Shared VMs"
VM_HOSTD_USER="root"

build() {
	mkdir -p ${srcdir}/work
  S=${srcdir}/work
	cd ${S}
	local bundle=${srcdir}/${_P}.${CARCH}.bundle
	local component; for component in \
		vmware-vmx \
		vmware-player-app \
		vmware-player-setup \
		vmware-workstation \
		vmware-network-editor \
		vmware-network-editor-ui \
		vmware-usbarbitrator \
		vmware-vprobe
	do
		vmware-bundle_extract-bundle-component "${bundle}" "${component}" "${S}"
	done
	
	vmware-bundle_extract-bundle-component "${bundle}" vmware-workstation-server
	vmware-bundle_extract-bundle-component "${bundle}" vmware-vix-core vmware-vix
	vmware-bundle_extract-bundle-component "${bundle}" vmware-vix-lib-Workstation900andvSphere510 vmware-vix
	vmware-bundle_extract-bundle-component "${bundle}" vmware-ovftool
		
	rm -f  bin/vmware-modconfig
	rm -rf lib/modules/binary
	rm -f vmware-workstation-server/bin/{openssl,configure-hostd.sh}
	find "${S}" -name '*.a' -delete
}

package() {
	
  S=${srcdir}/work
	msg "Preparing install"
	local major_minor=$(echo ${pkgver} | cut -d . -f 1-2)
	local major_minor_revision=$(echo ${pkgver} | cut -d . -f 1-3)
	local build=$(echo ${pkgver} | cut -d . -f4)

	# install the binaries
	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/bin || return 1
	install ${S}/bin/* ${pkgdir}/"${VM_INSTALL_DIR}"/bin || return 1
	
	# install the libraries
	#mkdir -p "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware || return 1
	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware
	cp -dr --no-preserve=ownership ${S}/lib/* ${pkgdir}/"${VM_INSTALL_DIR}"/lib/vmware
	mv ${pkgdir}/"${VM_INSTALL_DIR}"/lib/vmware/libvmware-netcfg.so ${pkgdir}/"${VM_INSTALL_DIR}"/lib/vmware/lib/libvmware-netcfg.so
	
	ln -s "${VM_INSTALL_DIR}"/lib/vmware/lib/libcrypto.so.0.9.8/libcrypto.so.0.9.8 "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/lib/libvmwarebase.so.0/libcrypto.so.0.9.8
	ln -s "${VM_INSTALL_DIR}"/lib/vmware/lib/libssl.so.0.9.8/libssl.so.0.9.8 "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/lib/libvmwarebase.so.0/libssl.so.0.9.8
	
	# install the ancillaries
	install -d "${pkgdir}"/usr/share
	cp -dr --no-preserve=ownership ${S}/share "${pkgdir}"/usr

	if [ "$(cups-config --serverbin)" ]; then
		install -d "${pkgdir}"/{etc/cups,"$(cups-config --serverbin)"/filter} || return 1
		install -m755 "${S}"/extras/thnucups "${pkgdir}"/"$(cups-config --serverbin)"/filter || return 1

		install ${S}/etc/cups/* "${pkgdir}"/etc/cups || return 1
	fi

	install -d "${pkgdir}"/etc/xdg
	cp -dr --no-preserve=ownership ${S}/etc/xdg/* ${pkgdir}/etc/xdg || return 1
	
	# install documentation
	install -d "${pkgdir}"/usr/share/man
	cp -dr --no-preserve=ownership ${S}/man ${pkgdir}/usr/share || return 1
	
	install -d "${pkgdir}"/usr/share/doc/${pkgname}
	cp -dr --no-preserve=ownership ${S}/doc/* ${pkgdir}/usr/share/doc/${pkgname} || return 1

	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/setup/
	cp -dr --no-preserve=ownership ${S}/vmware-config ${pkgdir}/"${VM_INSTALL_DIR}"/lib/vmware/setup/ || return 1
	
	# install vmware workstation server
	install -d "${pkgdir}${VM_INSTALL_DIR}"/sbin
	install -m755 ${S}/sbin/* "${pkgdir}${VM_INSTALL_DIR}"/sbin

	cd "${S}"/vmware-workstation-server

	# install binaries
	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/bin
	install -m755 bin/* "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/bin

	# install the libraries
	cp -dr --no-preserve=ownership lib/* "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/lib || return 1

	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/bin
	for tool in  vmware-{hostd,wssc-adminTool} ; do
		cat > "${srcdir}/${tool}" <<-EOF
			#!/usr/bin/env bash
			set -e

			. /etc/vmware/bootstrap

			exec "${VM_INSTALL_DIR}/lib/vmware/lib/wrapper-gtk24.sh" \\
				"${VM_INSTALL_DIR}/lib/vmware/lib" \\
				"${VM_INSTALL_DIR}/lib/vmware/bin/${tool}" \\
				"${VM_INSTALL_DIR}/lib/vmware/libconf" "\$@"
		EOF
		#dobin "${T}/${tool}"
		install -m755 "${srcdir}/${tool}" "${pkgdir}"/"${VM_INSTALL_DIR}"/bin
	done

	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/hostd
	cp -dr --no-preserve=ownership hostd/* "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/hostd || return 1

	# create the configuration
	install -d "${pkgdir}"/etc/vmware/hostd
	cp -dr --no-preserve=ownership config/etc/vmware/hostd/* "${pkgdir}"/etc/vmware/hostd || return 1
	cp -dr --no-preserve=ownership etc/vmware/hostd/* "${pkgdir}"/etc/vmware/hostd || return 1


	install -d "${pkgdir}"/etc/vmware/ssl
	cp -dr --no-preserve=ownership etc/vmware/ssl/* "${pkgdir}"/etc/vmware/ssl || return 1

	# pam
	install -d "${pkgdir}"/etc/pam.d
	install "${srcdir}"/vmware-authd "${pkgdir}"/etc/pam.d

	# create directory for shared virtual machines.
	install -d "$pkgdir"/"${VM_DATA_STORE_DIR}"
	install -d "$pkgdir"/var/log/vmware
	
	# install vmware-vix
	cd "${S}"/vmware-vix

	# install the binary
	#install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware/bin
	install bin/* "${pkgdir}"/"${VM_INSTALL_DIR}"/bin

	# install the libraries
	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware-vix
	cp -dr --no-preserve=ownership lib/* "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware-vix

	ln -s vmware-vix/libvixAllProducts.so "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/libbvixAllProducts.so

	# install headers
	install -d "${pkgdir}"/usr/include/vmware-vix
	install include/* "${pkgdir}"/usr/include/vmware-vix

	install -d "${pkgdir}"/usr/share/doc/${pkgname}/html
	cp -dr --no-preserve=ownership doc/* "${pkgdir}"/usr/share/doc/${pkgname}/html || return 1
	
	# install ovftool
	cd "${S}"

	install -d "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware-ovftool
	cp -dr --no-preserve=ownership vmware-ovftool/* "${pkgdir}"/"${VM_INSTALL_DIR}"/lib/vmware-ovftool

	chmod 0755 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware-ovftool/{ovftool,ovftool.bin}
	ln -s "${VM_INSTALL_DIR}"/lib/vmware-ovftool/ovftool "${pkgdir}${VM_INSTALL_DIR}"/bin/ovftool
	
	# create symlinks for the various tools
	local tool ; for tool in thnuclnt vmware vmplayer{,-daemon} \
			vmware-{acetool,enter-serial,gksu,fuseUI,modconfig{,-console},netcfg,tray,unity-helper} ; do
		ln -s appLoader "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/bin/"${tool}"
	done
	ln -sf "${VM_INSTALL_DIR}"/lib/vmware/bin/vmplayer "${pkgdir}${VM_INSTALL_DIR}"/bin/vmplayer
	ln -sf "${VM_INSTALL_DIR}"/lib/vmware/bin/vmware "${pkgdir}${VM_INSTALL_DIR}"/bin/vmware
	ln -s "${VM_INSTALL_DIR}"/lib/vmware/icu ${pkgdir}/etc/vmware/icu

	# fix permissions
	chmod 0755 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/bin/{appLoader,fusermount,launcher.sh,mkisofs,vmware-remotemks}
	chmod 0755 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/lib/{wrapper-gtk24.sh,libgksu2.so.0/gksu-run-helper}
	chmod 0755 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/setup/vmware-config
	chmod 4711 "${pkgdir}${VM_INSTALL_DIR}"/bin/vmware-mount
	chmod 4711 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/bin/vmware-vmx{,-debug,-stats}
	chmod 0755 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/bin/vmware-{hostd,wssc-adminTool}
	chmod 4711 "${pkgdir}${VM_INSTALL_DIR}"/sbin/vmware-authd
	chmod 1777 "${pkgdir}${VM_DATA_STORE_DIR}"
	chmod 0755 "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware-vix/setup/vmware-config
	
	# create the environment
	install -d "${pkgdir}"/etc/profile.d
	cat > "${pkgdir}"/etc/profile.d/vmware.sh <<-EOF
		export PATH="\$PATH:${VM_INSTALL_DIR}/bin"
		export ROOTPATH="'\$ROOTPATH:${VM_INSTALL_DIR}/bin"
	EOF
	
	cat > "${pkgdir}"/etc/profile.d/vmware.csh <<-EOF
		setenv PATH "\$PATH:${VM_INSTALL_DIR}/bin"
		setenv ROOTPATH "\$ROOTPATH:${VM_INSTALL_DIR}/bin"
	EOF
	
	chmod 0755 "${pkgdir}"/etc/profile.d/vmware.sh
	chmod 0755 "${pkgdir}"/etc/profile.d/vmware.csh
	
	#systemd files
	install -d ${pkgdir}/etc/systemd/system
	cp ${srcdir}/vmware-{authentication,usb,vmblock,vmci,vmmon,vmnet,vmsock}.service ${pkgdir}/etc/systemd/system
	cp ${srcdir}/vmware.target ${pkgdir}/etc/systemd/system
	
	# create the configuration

	cat > "${pkgdir}"/etc/vmware/bootstrap <<-EOF
		BINDIR='${VM_INSTALL_DIR}/bin'
		LIBDIR='${VM_INSTALL_DIR}/lib'
	EOF

	cat > "${pkgdir}"/etc/vmware/config <<-EOF
		bindir = "${VM_INSTALL_DIR}/bin"
		libdir = "${VM_INSTALL_DIR}/lib/vmware"
		initscriptdir = "/etc/init.d"
		authd.fullpath = "${VM_INSTALL_DIR}/sbin/vmware-authd"
		gksu.rootMethod = "su"
		VMCI_CONFED = "yes"
		VMBLOCK_CONFED = "yes"
		VSOCK_CONFED = "yes"
		NETWORKING = "yes"
		player.product.version = "${major_minor_revision}"
		product.version = "${major_minor_revision}"
		product.buildNumber = "${build}"
		product.name = "VMware Workstation"
		workstation.product.version = "${major_minor_revision}"
		vmware.fullpath = "${VM_INSTALL_DIR}/bin/vmware"
		vix.libdir = "${VM_INSTALL_DIR}/lib/vmware-vix"
		vix.config.version = "1"
		authd.client.port = "902"
		authd.proxy.nfc = "vmware-hostd:ha-nfc"
		authd.soapserver = "TRUE"
	EOF
	
	# fill in variable placeholders
	sed -e "s:@@LIBCONF_DIR@@:${VM_INSTALL_DIR}/lib/vmware/libconf:g" \
		-i "${pkgdir}${VM_INSTALL_DIR}"/lib/vmware/libconf/etc/{gtk-2.0/{gdk-pixbuf.loaders,gtk.immodules},pango/pango{.modules,rc}}
	sed -e "s:@@BINARY@@:${VM_INSTALL_DIR}/bin/vmware:g" \
		-e "/^Encoding/d" \
		-i "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	sed -e "s:@@BINARY@@:${VM_INSTALL_DIR}/bin/vmplayer:g" \
		-e "/^Encoding/d" \
		-i "${pkgdir}/usr/share/applications/vmware-player.desktop"
	sed -e "s:@@BINARY@@:${VM_INSTALL_DIR}/bin/vmware-netcfg:g" \
		-e "/^Encoding/d" \
		-i "${pkgdir}/usr/share/applications/vmware-netcfg.desktop"
		
	# Configuration for vmware-workstation-server
	local hostdUser="${VM_HOSTD_USER:-root}"
	sed -e "/ACEDataUser/s:root:${hostdUser}:g" \
		-i "${pkgdir}/etc/vmware/hostd/authorization.xml" || return 1

	# Shared VMs Path: [standard].
	sed -e "s:##{DS_NAME}##:standard:g" \
		-e "s:##{DS_PATH}##:${VM_DATA_STORE_DIR}:g" \
		-i "${pkgdir}/etc/vmware/hostd/datastores.xml" || return 1

	sed -e "s:##{HTTP_PORT}##:-1:g" \
		-e "s:##{HTTPS_PORT}##:443:g" \
		-e "s:##{PIPE_PREFIX}##:/var/run/vmware/:g" \
		-i "${pkgdir}/etc/vmware/hostd/proxy.xml" || return 1

	# See vmware-workstation-server.py for more details.
	sed -e "s:##{BUILD_CFGDIR}##:/etc/vmware/hostd/:g" \
		-e "s:##{CFGALTDIR}##:/etc/vmware/hostd/:g" \
		-e "s:##{CFGDIR}##:/etc/vmware/:g" \
		-e "s:##{ENABLE_AUTH}##:true:g" \
		-e "s:##{HOSTDMODE}##:ws:g" \
		-e "s:##{HOSTD_CFGDIR}##:/etc/vmware/hostd/:g" \
		-e "s:##{HOSTD_MOCKUP}##:false:g" \
		-e "s:##{LIBDIR}##:${VM_INSTALL_DIR}/lib/vmware:g" \
		-e "s:##{LIBDIR_INSTALLED}##:${VM_INSTALL_DIR}/lib/vmware/:g" \
		-e "s:##{LOGDIR}##:/var/log/vmware/:g" \
		-e "s:##{LOGLEVEL}##:verbose:g" \
		-e "s:##{MOCKUP}##:mockup-host-config.xml:g" \
		-e "s:##{PLUGINDIR}##:./:g" \
		-e "s:##{SHLIB_PREFIX}##:lib:g" \
		-e "s:##{SHLIB_SUFFIX}##:.so:g" \
		-e "s:##{USE_BLKLISTSVC}##:false:g" \
		-e "s:##{USE_CBRCSVC}##:false:g" \
		-e "s:##{USE_CIMSVC}##:false:g" \
		-e "s:##{USE_DIRECTORYSVC}##:false:g" \
		-e "s:##{USE_DIRECTORYSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_DYNAMIC_PLUGIN_LOADING}##:false:g" \
		-e "s:##{USE_DYNAMO}##:false:g" \
		-e "s:##{USE_DYNSVC}##:false:g" \
		-e "s:##{USE_GUESTSVC}##:false:g" \
		-e "s:##{USE_HBRSVC}##:false:g" \
		-e "s:##{USE_HBRSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_HOSTSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_HTTPNFCSVC}##:false:g" \
		-e "s:##{USE_HTTPNFCSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_LICENSESVC_MOCKUP}##:false:g" \
		-e "s:##{USE_NFCSVC}##:true:g" \
		-e "s:##{USE_NFCSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_OVFMGRSVC}##:true:g" \
		-e "s:##{USE_PARTITIONSVC}##:false:g" \
		-e "s:##{USE_SECURESOAP}##:false:g" \
		-e "s:##{USE_SNMPSVC}##:false:g" \
		-e "s:##{USE_SOLO_MOCKUP}##:false:g" \
		-e "s:##{USE_STATSSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_VCSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_VDISKSVC}##:false:g" \
		-e "s:##{USE_VDISKSVC_MOCKUP}##:false:g" \
		-e "s:##{USE_VMSVC_MOCKUP}##:false:g" \
		-e "s:##{VM_INVENTORY}##:vmInventory.xml:g" \
		-e "s:##{VM_RESOURCES}##:vmResources.xml:g" \
		-e "s:##{WEBSERVER_PORT_ENTRY}##::g" \
		-e "s:##{WORKINGDIR}##:./:g" \
		-i "${pkgdir}/etc/vmware/hostd/config.xml" || return 1

	sed -e "s:##{ENV_LOCATION}##:/etc/vmware/hostd/env/:g" \
		-i "${pkgdir}/etc/vmware/hostd/environments.xml" || return 1

	# @@VICLIENT_URL@@=XXX
	sed -e "s:@@AUTHD_PORT@@:902:g" \
		-i "${pkgdir}${VM_INSTALL_DIR}/lib/vmware/hostd/docroot/client/clients.xml" || return 1
	
}