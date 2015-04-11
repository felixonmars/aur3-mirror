# Maintainer: Luca Béla Palkovics <luca.bela.palkovics@gmail.com>

pkgrel=1
pkgver=20150405
pkgname=('gtox-git')
pkgdesc="a GTK-based tox-client"
url="https://github.com/KoKuToru/gTox.git"
license='GPL3'
arch=('i686' 'x86_64')
depends=('gtkmm3' 'libnotifymm' 'libconfig' 'libsodium' 'libvpx' 'opus' 'sqlite' 'gettext' 'libcanberra' 'desktop-file-utils' 'gtk-update-icon-cache' 'gstreamermm')
makedepends=('check' 'git' 'cmake' 'librsvg')
source=(.AURINFO "${pkgname%-git}::git+https://github.com/KoKuToru/gTox.git")
sha256sums=('SKIP' 'SKIP')
provides=('gtox')
conflicts=('gtox')
install="gTox.install"

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
    cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr .. 
    make
}

package()
{
	cd ${pkgname%-git}
	cd build
	make install
}
