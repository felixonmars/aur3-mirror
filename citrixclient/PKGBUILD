# Maintainer: vmalloc support@cyborg-connect.de
# Original Author  : Andrwe <lord-weber-andrwe (at) renona-studios (dot) org>

pkgname="citrixclient"
pkgver="13.1"
pkgrel="0"
pkgdesc="Provides XenApp(Citrix) for linux (x86_64 & i686) Receiver for Linux 13.1"
url="http://www.citrix.com"
arch=('i686' 'x86_64')
license=('CAL')
sha512sums=('f1c574aac9ebec878f28b6054b1aae19369d2815c2a49e454c5ff3ceb787662a4bba69c0ac5ebb753c1bebcbf1510be53820e80956abfc9e357890e3e4616d97'
            '26bc2cb3b9c0af223297e70e5658813e8c0da44a64a11f4c7fcf75f965be41eaf8e3e2cc9e51fa34f079325895a24c771e991625d85bd761bf1ae8b6bfcba42c')
source=('wfica.desktop' 'wfcmgr.desktop')
makedepends=('wget')

case ${CARCH} in
    i686 )
        depends=(
            'gtk2'
            'libx11'
            'libxaw'
            'libxext'
            'libxft'
            'libxmu'
            'libxp'
            'libxpm'
            'libxt'
            'libcanberra'
            'openmotif'
            'printproto'
            'xextproto'
            'alsa-lib'
            'glib2'
        )
        instdir="/usr/lib/ICAClient"
        ;;
    x86_64 )
        depends=(
            'gtk2'
            'libcanberra'
            'lib32-gcc-libs'
            'lib32-libjpeg-turbo'
            'lib32-libpng'
            'lib32-libvorbis'
            'lib32-libx11'
            'lib32-libxaw'
            'lib32-libxext'
            'lib32-libxft'
            'lib32-libxinerama'
            'lib32-libxmu'
            'lib32-libxp'
            'lib32-libxpm'
            'lib32-libxt'
            'lib32-openmotif'
            'printproto'
            'xextproto'
            'lib32-alsa-lib'
            'lib32-glib2'
            'lib32-gtk2'
            'nspluginwrapper'
        )
        instdir="/usr/lib32/ICAClient"
        ;;
esac

install=citrix-client.install

build() {
    # Source array is empty due to the dynamic nature, grabbing it and handling things here...
     sourcefile="$(wget -qO- 
'http://www.citrix.com/downloads/citrix-receiver/receivers-by-platform/receiver-for-linux-131.html' | awk -F 'rel=\"' '/linuxx86_13.1.0./ {print $2;exit;}'| awk -F'"' '{print $1}'| sed '/^$/d')" 
    cd "${srcdir}"
    wget -O linuxx86.tar.gz "${sourcefile}"
    tar zxf linuxx86.tar.gz
}    
package() {
    # Create folder structure
    mkdir -p "${pkgdir}${instdir}"
    mkdir -p "${pkgdir}/usr/bin/"

    # copy needed files
    cp -r ./linuxx86/linuxx86.cor/* "${pkgdir}${instdir}"/
    cp ./setupwfc "${pkgdir}${instdir}"/

    # Go to package directory
    cd "${pkgdir}${instdir}"/
    
    # Create symlinks for the Npica.ad binary
    ln -s ./nls/en/Npica.ad ./Npica.ad
    ln -s ./Npica.ad ./Npica

    # Copy EULA to program root directory
    cp ${srcdir}/linuxx86/linuxx86.cor/nls/en/eula.txt ./

    # Copy default configuration files to config directory of the program and setting them readable
    cp ./nls/en/{appsrv.ini,wfclient.ini,module.ini} ./config/
    chmod 666 ./config/{appsrv.ini,wfclient.ini,module.ini}
    chmod 777 ./config

    # Go ahead and do the different operations pursiant with the architecture...
    if [[ "${CARCH}" == "i686" ]]; then
        # Create the 32 bit client script
        echo -e "#!/bin/sh\n${instdir}/wfcmgr" > "${pkgdir}"/usr/bin/citrix-client.sh
        # Create executable wrapper for the binaries
        echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\n\${ICAROOT}/wfica -file \$1" > "${pkgdir}"/usr/bin/wfica
        echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\n\${ICAROOT}\n\${ICAROOT}/wfica -associate -fileparam \$1" > "${pkgdir}"/usr/bin/wfica_assoc
        chmod 755 ${pkgdir}/usr/bin/*
        # Remove 64 bits libraries - Jevv 06/03/12
        rm "${pkgdir}"/usr/lib/ICAClient/util/*.64
        rm "${pkgdir}"/usr/lib/ICAClient/util/*.64.so
    else
        # We're 64 bit - Create executable wrapper for the binaries
        echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\nexport GCONV_PATH=/usr/lib32/gconv/\n\${ICAROOT}/wfica -file \"\$1\"" > "${pkgdir}"/usr/bin/wfica
        echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\nexport GCONV_PATH=/usr/lib32/gconv/\n\${ICAROOT}/wfcmgr" > "${pkgdir}"/usr/bin/wfcmgr
        echo -e "#!/bin/sh\nexport ICAROOT=${instdir}\nexport GCONV_PATH=/usr/lib32/gconv/\n\${ICAROOT}/wfica -associate -fileparam \"\$1\"" > "${pkgdir}"/usr/bin/wfica_assoc
        chmod 755 ${pkgdir}/usr/bin/*
	# symlink to make desktop files work?
	mkdir - "${pkgdir}/usr/lib"
	ln -s /usr/lib32/ICAClient "${pkgdir}/usr/lib/ICAClient"
    fi
        # Copy Firefox plugin into plugin directory
    mkdir -p "${pkgdir}/usr/lib/mozilla/plugins"
        cp ./npica.so "${pkgdir}"/usr/lib/mozilla/plugins/
	cd "${srcdir}"
	install -Dm644 wfica.desktop "$pkgdir/usr/share/applications/wfica.desktop"
	install -Dm644 wfcmgr.desktop "$pkgdir/usr/share/applications/wfcmgr.desktop"
}
# vim:set ts=8 sts=2 sw=2 et:
