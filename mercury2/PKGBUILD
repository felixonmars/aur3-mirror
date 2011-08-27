# Maintainer: Mauro Santos <registosites@hotmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>

pkgname=mercury2
_pkgname=mercury
pkgver=rc8a
pkgrel=2
pkgdesc="Java Based MSN client."
license=('custom')
arch=('i686' 'x86_64')
url="http://mercury.im"
conflicts=('mercury')
depends=('java-runtime' 'libxss' 'libxt')
makedepends=('unzip')

_arch='x86'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'
source=("http://files.mercury.im/2.0/release/$pkgver/core.zip"
		"http://ftp.rnl.ist.utl.pt/pub/eclipse/eclipse/downloads/drops/R-3.6.1-201009090800/swt-3.6.1-gtk-linux-$_arch.zip"
        mercurylogo.png
        mercury.desktop
        license.txt)
md5sums=('9b1cda5b5ebdd4547cef6c7f507d7f8f'
		 'fec1434126f946c060326b4e0d9ea279'
         '88b740b196eab09fe5027561ce6fb9ff'
         'ce2fb47982e564f0783d905f53341a6c'
         '6ce0e815d63db6ac55a28e8d52c3f8da')
[ "$CARCH" = "x86_64" ] && md5sums[1]='ad23e5a60ece4b2a157a1203f44e2900'

noextract=('core.zip' "swt-3.6.1-gtk-linux-$_arch.zip")

build() {
	echo $CARCH
    # Extract mercury
    mkdir -p "${pkgdir}/usr/share/mercury"
    cd "${pkgdir}/usr/share/mercury/"
    unzip -o "${startdir}/src/core.zip"

    # Remove things we don't need
    rm ${pkgdir}/usr/share/mercury/startup/startup_windows*
    # Make sure permissions are ok
    chmod +x ${pkgdir}/usr/share/mercury/startup/*

    # Install license
    install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/mercury/LICENSE"

    # Install icon
    install -D -m644 "${srcdir}/mercurylogo.png" "${pkgdir}/usr/share/pixmaps/mercurylogo.png"

    # Install desktop file
    install -D -m644 "${srcdir}/mercury.desktop" "${pkgdir}/usr/share/applications/mercury.desktop"

    # Make link in /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/share/mercury/startup/startup_linux.sh "${pkgdir}/usr/bin/mercury"

    # Unzip and copy swt.jar
    cd "${srcdir}"
    unzip "swt-3.6.1-gtk-linux-$_arch.zip"
    install -D -m644 "${srcdir}/swt.jar" "${pkgdir}/usr/share/mercury/lib"
}
