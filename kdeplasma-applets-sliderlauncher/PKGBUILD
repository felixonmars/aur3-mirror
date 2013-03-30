# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: ShadowKyore <shadowkyogre@gmail.com>

pkgname=kdeplasma-applets-sliderlauncher
pkgver=0.1r16beta
_pkgver=0.1-r16beta
pkgrel=1
pkgdesc="A compact launcher plasmoid that allows one to store lots of launchers in a small amount of space"
arch=(i686 x86_64)
url=http://www.kde-look.org/content/show.php/Slidelauncher?content=112619
license=('GPL')
depends=(kdebase-workspace)
makedepends=(automoc4 cmake kdelibs)
source=(http://slidelauncher.googlecode.com/files/sliderlauncher-$_pkgver.tar.bz2)
sha256sums=('3286cd5a44d5eaa9a875d844d3d965f6de4f4faf862996341e199e5703e823c0')
sha512sums=('2b461bf6d2aeb4cfcc81cb2e0c8b21e42c7e38de1a048254b7363c6d57c87e20d0b8b3d9a4f13fd770ce09ab43c06e5ce22b80a8c6993f907df4ded7dec09085')

build() {
    install -d $pkgname-build/
    cd $pkgname-build/
    cmake ../sliderlauncher-$_pkgver/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    make -C $pkgname-build DESTDIR="$pkgdir" install
}
