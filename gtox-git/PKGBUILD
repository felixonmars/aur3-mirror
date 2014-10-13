# Maintainer: Luca Béla Palkovics <luca.bela.palkovics@gmail.com>

pkgrel=1
pkgver=20141012
pkgname=('gtox-git')
pkgdesc="a GTK-based tox-client"
url="https://github.com/KoKuToru/gTox.git"
license='GPL3'
arch=('i686' 'x86_64')
depends=('gtkmm3' 'libnotifymm' 'libconfig' 'libsodium' 'libvpx' 'opus')
makedepends=('check' 'git' 'cmake')
source=(.AURINFO "${pkgname%-git}::git+https://github.com/KoKuToru/gTox.git")
sha256sums=('SKIP' 'SKIP')
provides=('gtox')
conflicts=('gtox')

pkgver()
{
     cd ${pkgname%-git}
     git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build()
{
    cd ${pkgname%-git}
    mkdir build
    cd build
    cmake ..
    make
}

package()
{
	cd ${pkgname%-git}
	#maybe put this into cmakelists
	mkdir -p ${pkgdir}/usr/bin
	install -m 0755 build/gTox ${pkgdir}/usr/bin/gTox
	mkdir -p ${pkgdir}/usr/share/applications
	install -m 644 gTox.desktop ${pkgdir}/usr/share/applications/gTox.desktop
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	install -m 644 Icons/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/gTox.svg
}
