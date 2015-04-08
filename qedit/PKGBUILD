# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: rtfreedman
# Contributor: SpepS <dreamspepser@yahoo.it>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Massimiliano Torromeo <Massimiliano.Torromeo@gmail.com>

pkgname=qedit
pkgver=2.7.0
pkgrel=1
pkgdesc="A multi-purpose text editor based on NEdit using Qt"
arch=(i686 x86_64)
url='http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=qedit'
license=(GPL2)
depends=(aspell qt4)
makedepends=(cmake)
options=(!emptydirs)
install=$pkgname.install
source=(http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz)
sha256sums=('f83d08ee885eb8d6d5fe03aad3abddb12fb376b96d1ac01607f68d41fb30f1e8')
sha512sums=('1b7c1124735d6a93809ead72f3d9d65df9ace53b516f4ac007b3f3fc5fd38689c0bd20a8b9d02d25a36dacce998ec7b39f8660007617a25e250285797e9b1c8e')

build() {
    install -d $pkgname-build/
    cd $pkgname-build/
    cmake ../$pkgname-$pkgver/ \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    make -C $pkgname-build DESTDIR="$pkgdir" install

    cd $pkgname-$pkgver/
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
