# Maintainer: thotypous <matiasΘarchlinux-br·org>
# Contributor: Peter 'piie' Feuerer <peterΘpiie·net>
# Contributor: Sascha Pfau <MrPeacockΘgmail·com>
# Contributor: iggy <iggy.mfΘgmail·com>

pkgname="virtualbox_bin-2"
pkgver="2.2.4"
_build="47978"
pkgrel=1
pkgdesc="Powerful x86 virtualization (Personal Use Binaries Edition)"
url="http://www.virtualbox.org"
license=('custom:PUEL')
arch=('i686' 'x86_64')
install=('vbox.install')

md5sums=('cc24c081e53d03da1c009dc1a2eaa95d'
         '9576c4ee3c362f7bc30525a4f07ea3ed')

_architect='x86'
[ "$CARCH" = "x86_64" ] && _architect='amd64'
[ "$CARCH" = "x86_64" ] && md5sums[0]='08faf3b80f0816f74aadc4ae65465f0d'

source=("VirtualBox-${pkgver}-${_build}-Linux_${_architect}.run::http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}-${_build}-Linux_${_architect}.run"
        'vbox_build_module')

install=('vbox.install')
depends=('libstdc++5' 'libxcursor' 'libxmu' 'gcc' 'make')
optdepends=("qt: For VirtualBox GUI"
            "sdl: For VBoxSDL")
provides=("virtualbox=${pkgver}")
conflicts=('virtualbox-ose' 'virtualbox-modules' 'virtualbox_bin')

build() {
    # Check package
    sh "VirtualBox-${pkgver}-${_build}-Linux_${_architect}.run" --check || return 1

    # Unpack
    echo yes | sh "VirtualBox-${pkgver}-${_build}-Linux_${_architect}.run" --target "$srcdir" \
        --nox11 --noexec &>/dev/null || return 1

    mkdir -p \
        "$pkgdir/opt/virtualbox" \
        "$pkgdir/usr/bin" \
        "$pkgdir/etc/udev/rules.d" \
        "$pkgdir/etc/vbox" \
        "$pkgdir/usr/share/applications" \
        "$pkgdir/usr/share/pixmaps" || return 1

    cd "$pkgdir/opt/virtualbox"
    tar -jxf "$srcdir/VirtualBox.tar.bz2" || return 1

    # Mark set-user-ID-on-execution if release is marked as a hardened build.
    if egrep '^HARDENED="1"' "$srcdir/install.sh" &> /dev/null; then
        chmod 4511 "VirtualBox" "VBoxSDL" "VBoxHeadless"
        for _n in "VBoxVMM.so" "VBoxREM.so" "VBoxRT.so" "VBoxDDU.so" "VBoxXPCOM.so"; do
            ln -sf "/opt/virtualbox/${_n}" "components"
        done
        chmod go-w .
    fi

    # Replace VirtualBox built-in Qt by system Qt libraries.
    # Fixes problems with some KDE themes reported by users.
    rm "libQtCoreVBox.so.4" "libQtGuiVBox.so.4" "libQtNetworkVBox.so.4"
    ln -s "/usr/lib/libQtCore.so.4" "libQtCoreVBox.so.4"
    ln -s "/usr/lib/libQtGui.so.4" "libQtGuiVBox.so.4"
    ln -s "/usr/lib/libQtNetwork.so.4" "libQtNetworkVBox.so.4"

    # Install vbox_build_module
    install -D -m744 "$srcdir/vbox_build_module" "$pkgdir/usr/bin/vbox_build_module"

    # NOTE: Comment the following line if you want the SDK.
    rm -Rf "$pkgdir/opt/virtualbox/sdk"

    # Symlink the launchers
    for _app in "VirtualBox" "VBoxHeadless" "VBoxManage" "VBoxSDL" "VBoxSVC" "VBoxTunctl" "rdesktop-vrdp"; do
        ln -s "/opt/virtualbox/${_app}" "$pkgdir/usr/bin/${_app}"
    done

    # Symlink the desktop icon
    ln -s "/opt/virtualbox/VBox.png" "$pkgdir/usr/share/pixmaps/VBox.png"
    ln -s "/opt/virtualbox/VirtualBox.desktop" "$pkgdir/usr/share/applications/VirtualBox.desktop"

    # Replace some init scripts by simplified stuff
    sed -i -e 's,sudo /etc/init.d/vboxdrv setup,/usr/bin/vbox_build_module,g' "$pkgdir/opt/virtualbox/VBox.sh"
    sed -i -e 's,sudo /etc/init.d/virtualbox restart,modprobe vboxdrv,g' "$pkgdir/opt/virtualbox/VBox.sh"

    # Add udev rules
    echo 'KERNEL=="vboxdrv", NAME="vboxdrv", OWNER="root", GROUP="vboxusers", MODE="0660"' > \
        "$pkgdir/etc/udev/rules.d/10-vboxdrv.rules"
    echo 'SUBSYSTEM=="usb_device", GROUP="vboxusers", MODE="0664"' >> \
        "$pkgdir/etc/udev/rules.d/10-vboxdrv.rules"
    echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", GROUP="vboxusers", MODE="0664"' >> \
        "$pkgdir/etc/udev/rules.d/10-vboxdrv.rules"

    # Point the installation directory to vbox
    echo '# VirtualBox installation directory' > "$pkgdir/etc/vbox/vbox.cfg"
    echo 'INSTALL_DIR="/opt/virtualbox"'      >> "$pkgdir/etc/vbox/vbox.cfg"

    # Link the license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/virtualbox/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/PUEL"

    # Link the directory because rdesktop-vrdp has a hardcoded path
    ln -s "/opt/virtualbox" "$pkgdir/opt/VirtualBox-${pkgver}"
}

