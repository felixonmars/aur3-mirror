# Maintainer: thotypous <matiasΘarchlinux-br·org>
# Contributor: Peter 'piie' Feuerer <peterΘpiie·net>
# Contributor: Sascha Pfau <MrPeacockΘgmail·com>
# Contributor: iggy <iggy.mfΘgmail·com>

pkgname="virtualbox_bin-1"
pkgver="1.6.6"
pkgrel="1"
pkgdesc="Powerful x86 virtualization (Personal Use Binaries Edition)"
url="http://www.virtualbox.org"
license=('custom:PUEL')
backup=('etc/vbox/interfaces')
arch=('i686' 'x86_64')
install=('vbox.install')
md5sums=('cda1cabca237db7caab94e9eb2dc2456'
         'f30e78505cdebc925519e1146c22cc8a'
         '9576c4ee3c362f7bc30525a4f07ea3ed'
         '23d094a975174b7b599fb93bc0c43936')

_architect='x86'
[ "$CARCH" = "x86_64" ] && _architect='amd64'

source=('vbox.install'
        'vboxnet.patch'
        'vbox_build_module'
        'interfaces')

install=('vbox.install')
depends=('libstdc++5')
optdepends=("qt3: For VirtualBox GUI"
            "sdl: For VBoxSDL")
provides=("virtualbox=${pkgver}")
conflicts=('virtualbox-ose' 'virtualbox-modules' 'virtualbox_bin')
makedepends=('patch')

build() {
    cd "${SRCDEST}"

    # Bad news. We have to download the file inside build() because
    # the server appends a random number to it's filename, so makepkg
    # would download it, then would not be able to find it.
    msg "Downloading VirtualBox"
    wget -c -O "VirtualBox-${pkgver}-Linux_${_architect}.run" \
        "http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}-Linux_${_architect}.run" \
        || return 1

    ln -sf "${SRCDEST}/VirtualBox-${pkgver}-Linux_${_architect}.run" "${srcdir}" || return 1

    cd "$srcdir"
    msg "Creating the package"

    # Check package
    sh "VirtualBox-${pkgver}-Linux_${_architect}.run" --check || return 1

    # Unpack
    echo yes | sh "VirtualBox-${pkgver}-Linux_${_architect}.run" --target "$srcdir" \
        --nox11 --noexec &>/dev/null || return 1

    mkdir -p \
        "$pkgdir/opt/virtualbox" \
        "$pkgdir/usr/bin" \
        "$pkgdir/etc/udev/rules.d" \
        "$pkgdir/usr/share/applications" \
        "$pkgdir/usr/share/pixmaps" || return 1

    cd "$pkgdir/opt/virtualbox"
    tar -jxf "$srcdir/VirtualBox.tar.bz2"

    # Install vbox_build_module
    install -D -m744 "$srcdir/vbox_build_module" "$pkgdir/usr/bin/vbox_build_module"

    # NOTE: Comment the following line if you want the SDK.
    rm -Rf "$pkgdir/opt/virtualbox/sdk"

    # Symlink the launchers
    for app in "VBoxAddIF" "VBoxDeleteIF"; do
        ln -s "/opt/virtualbox/VBoxAddIF.sh" "$pkgdir/usr/bin/$app"
    done
    for app in "VirtualBox" "VBoxManage" "VBoxSDL" "VBoxVRDP" "VBoxHeadless"; do
        ln -s "/opt/virtualbox/VBox.sh" "$pkgdir/usr/bin/$app"
    done
    ln -s "/opt/virtualbox/VBoxTunctl" "$pkgdir/usr/bin/VBoxTunctl"

    # Symlink the desktop icon
    ln -s "/opt/virtualbox/VBox.png" "$pkgdir/usr/share/pixmaps/VBox.png"
    ln -s "/opt/virtualbox/VirtualBox.desktop" "$pkgdir/usr/share/applications/VirtualBox.desktop"

    # Replace some init scripts by simplified stuff
    sed -i -e 's,sudo /etc/init.d/vboxdrv setup,/usr/bin/vbox_build_module,g' "$pkgdir/opt/virtualbox/VBox.sh"
    sed -i -e 's,sudo /etc/init.d/virtualbox restart,modprobe vboxdrv,g' "$pkgdir/opt/virtualbox/VBox.sh"

    # Add udev rules
    echo 'KERNEL=="vboxdrv", NAME="vboxdrv", OWNER="root", GROUP="vboxusers", MODE="0660"' > \
        "$pkgdir/etc/udev/rules.d/60-vboxdrv.rules"

    # Install interfaces
    install -D -m644 "$srcdir/interfaces" "$pkgdir/etc/vbox/interfaces"

    # Point the installation directory to vbox
    echo '# VirtualBox installation directory' > "$pkgdir/etc/vbox/vbox.cfg"
    echo 'INSTALL_DIR="/opt/virtualbox"'      >> "$pkgdir/etc/vbox/vbox.cfg"

    # Patch the vboxnet initscript
    cd $srcdir
    patch < "vboxnet.patch" || return 1
    install -D -m755 "$srcdir/vboxnet.sh" "$pkgdir/etc/rc.d/vboxnet"

    # Link the license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/virtualbox/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/PUEL"
}

