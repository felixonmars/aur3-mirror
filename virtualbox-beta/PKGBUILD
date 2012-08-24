# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# work around the AUR.
pkgname=virtualbox-beta
pkgdesc="Powerful x86 virtualization for enterprise as well as home use"
pkgbase=virtualbox-beta
true && pkgname=('virtualbox-beta'
                 'virtualbox-source-beta'
		 'virtualbox-additions-beta'
		 'virtualbox-ext-oracle-beta')
pkgver=4.2.0_RC2
pkgrel=1
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL' 'custom')
makedepends=('libstdc++5' 'bin86' 'dev86' 'iasl' 'libxslt' 'libxml2' 'libxcursor' 'qt' 'libidl2' 'sdl_ttf' 'alsa-lib' 'libpulse' 'libxtst'
'xalan-c' 'sdl' 'libxmu' 'curl' 'python2' 'linux-headers' 'mesa' 'libxrandr' 'libxinerama' 'libvncserver' 'jdk7-openjdk' 'gsoap' 'vde2')
#'xorg-server-devel' 'xf86driproto' 'libxcomposite')
[[ $CARCH == "x86_64" ]] && makedepends=("${makedepends[@]}" 'gcc-multilib' 'lib32-glibc')

source=(http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2
        http://download.virtualbox.org/virtualbox/${pkgver}/Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack
	http://download.virtualbox.org/virtualbox/${pkgver}/VBoxGuestAdditions_${pkgver}.iso
        UserManual-$pkgver.pdf::http://download.virtualbox.org/virtualbox/${pkgver}/UserManual.pdf
        PUEL 10-vboxdrv.rules vboxdrv-reference.patch LocalConfig.kmk
        change_default_driver_dir.patch vboxservice.conf
        vboxservice.rc vboxservice.service vboxweb.conf vboxweb.rc
        vboxweb.service)

_kernver="$(uname -m)" || true

sha256sums=('9de6e2fd201bf4af4d97315909ce5df526c84fc08717a2f2b1cad6d8441fee1c'
            '77ca5f08d423651d798d029907a918d32b1051e8a17dc88bb8befc1c411a7311'
	    'b3ee7ccb3d56ccf8a36de18c25e2925fa91ee1832af9d4844527482e9fb24084'
            'f3824154a0e18fdf979d457ba4609db1c305246276f91820abc69a0673d54f97'
            '50658c653cde4dc43ba73a64c72761d2e996fd8e360fc682aa2844e1ad5b045f'
            'eb66ca54f9b3bc09c7c5bfa0212e943dd9ca5bc7f754b24c6d0a6d92528c0de5'
            '148695f534f29b397128e83df9319617818fdb51bcaacb7484d2fb0b3e651833'
            '85be15d043753e9c02d7effe32d3fe5d4e73fe5140fea5ee7181aab9624fc9d7'
            '732c1546a2976814d89aa84cbcbb91a0637eb9418e62ace7819bce51b1766d65'
            '1ff4abe90fb8bae65fc5f9d86e2ddda64b78cd05cb136ada09267b108a46d601'
            '0e022a9458e3145968c9a499fb2665bdea8004f22dd60e5791dc732b0501e8b9'
            'f05995d1ef8c4271e4582adf877310db074a546e55debb0befcc54aff6d55a48'
            '303779465a110f7665795a1e240a2f802a0fa9e7105eabe85579a625372334b7'
            '656905de981ffa24f6f921c920538854a235225053f44baedacc07b46ca0cf56'
            'e6e875ef186578b53106d7f6af48e426cdaf1b4e86834f01696b8ef1c685787f')

build() {
    cd "VirtualBox-$pkgver"

    patch -Np1 -i "$srcdir/vboxdrv-reference.patch"
    patch -Np1 -i "$srcdir/change_default_driver_dir.patch"

    cp "$srcdir/LocalConfig.kmk" .

    ./configure --disable-docs \
        --enable-webservice \
        --enable-vde \
        --enable-vnc \
        --nofatal \
        --with-linux=/usr/src/linux-${_kernver}
    source ./env.sh
    kmk all
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "out/linux.$BUILD_PLATFORM_ARCH/release/bin/vboxshell.py"
    # build rdesktop-vrdp (broken from LocalConfig.kmk)
    cd src/VBox/RDP/client
    cp "$srcdir/LocalConfig.kmk" .
    kmk all
}

package_virtualbox-beta() {
    pkgdesc="Powerful x86 virtualization for enterprise as well as home use"
    depends=('virtualbox-modules' 'libxml2' 'libxcursor' 'libxinerama' 'sdl' 'libxmu' 'curl' 'libvncserver' 'libpng')
    optdepends=('qt: for VirtualBox GUI'
                'vde2: Virtual Distributed Ethernet support'
                'virtualbox-sdk: developer kit'
                'virtualbox-source: host kernel source modules for non-stock kernels'
                'net-tools: for host-only or bridged networking')

    backup=('etc/vbox/vbox.cfg' 'etc/conf.d/vboxweb')
    replaces=('virtualbox-ose')
    conflicts=('virtualbox-ose' 'virtualbox')
    install=virtualbox.install

    source "VirtualBox-$pkgver/env.sh"
    cd "VirtualBox-$pkgver/out/linux.$BUILD_PLATFORM_ARCH/release/bin"
    install -dm755 "$pkgdir"/usr/{bin,lib/virtualbox/components,lib/virtualbox/ExtensionPacks,share/virtualbox/nls,share/virtualbox/rdesktop-vrdp-keymaps}

    #doc
    install -m 0644 "$srcdir/UserManual-$pkgver.pdf" "$pkgdir/usr/share/virtualbox/UserManual.pdf"

    #Binaries and Wrapper with Launchers
    install -m 0755 VBox.sh "$pkgdir/usr/bin/VBox"

    for i in VBoxHeadless VBoxManage VBoxSDL VirtualBox vboxwebsrv VBoxBalloonCtrl; do
        ln -sf VBox "$pkgdir/usr/bin/$i"
        ln -sf VBox "$pkgdir/usr/bin/${i,,}"
    done
    install -m 0755 VBoxTunctl "$pkgdir/usr/bin"
    install -m 0755 rdesktop-vrdp "$pkgdir/usr/bin"

    #components
    install -m 0755 components/* -t "$pkgdir/usr/lib/virtualbox/components"

    #lib
    install -m 0755 *.so "$pkgdir/usr/lib/virtualbox"
    install -m 0644 *.gc *.r0  VBoxEFI*.fd "$pkgdir/usr/lib/virtualbox"

    #setuid root binaries
    install -m 4755 VBoxSDL VirtualBox VBoxHeadless VBoxNetDHCP VBoxNetAdpCtl -t "$pkgdir/usr/lib/virtualbox"
    #other binaries
    install -m 0755 VBoxManage VBoxSVC VBoxExtPackHelperApp VBoxXPCOMIPCD VBoxTestOGL VBoxBalloonCtrl vboxwebsrv webtest -t "$pkgdir/usr/lib/virtualbox"

    #language
    install -m 0755 nls/*.qm -t "$pkgdir/usr/share/virtualbox/nls"

    #rdesktop keymaps
    install -m 0644 rdesktop-vrdp-keymaps/* "$pkgdir/usr/share/virtualbox/rdesktop-vrdp-keymaps"

    #useless scripts
    install -m 0755 VBoxCreateUSBNode.sh VBoxSysInfo.sh -t "$pkgdir/usr/share/virtualbox"

    #icons
    install -D -m 0644 VBox.png "$pkgdir/usr/share/pixmaps/VBox.png"

    pushd icons
    for i in *; do
        install -d "$pkgdir/usr/share/icons/hicolor/$i/mimetypes"
        cp $i/* "$pkgdir/usr/share/icons/hicolor/$i/mimetypes"
    done
    popd

    #desktop
    install -D -m 0644 virtualbox.desktop "$pkgdir/usr/share/applications/virtualbox.desktop"
    install -D -m 0644 virtualbox.xml "$pkgdir/usr/share/mime/packages/virtualbox.xml"

    #install configuration
    mkdir -p "$pkgdir/etc/vbox"
    echo 'INSTALL_DIR=/usr/lib/virtualbox' > "$pkgdir/etc/vbox/vbox.cfg"

    #udev and licence
    install -D -m 0644 "$srcdir/VirtualBox-${pkgver}/COPYING" \
        "$pkgdir/usr/share/licenses/virtualbox/LICENSE"
    install -D -m 0644 "$srcdir/10-vboxdrv.rules" \
        "$pkgdir/usr/lib/udev/rules.d/10-vboxdrv.rules"

    # install rc.d script
    install -D -m755 "$srcdir/vboxweb.rc" "$pkgdir/etc/rc.d/vboxweb"
    # install systemd service
    install -D -m644 "$srcdir/vboxweb.service" \
        "$pkgdir/usr/lib/systemd/system/vboxweb.service"
    # install sample config
    install -D -m644 "$srcdir/vboxweb.conf" "$pkgdir/etc/conf.d/vboxweb"

}

package_virtualbox-source-beta() {
    pkgdesc="VirtualBox kernel modules source"
    depends=(dkms gcc make)
    provides=(virtualbox-modules)
    optdepends=('linux-headers'
                'linux-lts-headers')
    install=virtualbox-source.install
    conflicts=('virtualbox-source')

    install -dm755 "$pkgdir/var/lib/dkms/vboxhost/$pkgver"
    source "VirtualBox-$pkgver/env.sh"
    cd "VirtualBox-$pkgver/out/linux.$BUILD_PLATFORM_ARCH/release/bin"
    cp -r src "$pkgdir/var/lib/dkms/vboxhost/$pkgver/source"
}

package_virtualbox-additions-beta() {
    pkgdesc="The official all-in-one VirtualBox Guest Additions ISO/CD iamge"
    license=('custom:PUEL')
    conflicts=('virtualbox-additions')

    install -D -m 644 VBoxGuestAdditions_${pkgver}.iso \
      ${pkgdir}/usr/lib/virtualbox/additions/VBoxGuestAdditions.iso
}

package_virtualbox-ext-oracle-beta() {
    pkgdesc="Oracle VM VirtualBox Extension Pack"
    depends=('virtualbox-beta')
    conflicts=('virtualbox-ext-oracle')
    license=('custom:PUEL')
    options=('!strip')
    install=virtualbox-ext-oracle.install

    install -D -m 644 Oracle_VM_VirtualBox_Extension_Pack-${pkgver}.vbox-extpack ${pkgdir}/usr/share/virtualbox/extensions/Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack
    install -D -m 644 PUEL ${pkgdir}/usr/share/licenses/${pkgname}/PUEL
}
