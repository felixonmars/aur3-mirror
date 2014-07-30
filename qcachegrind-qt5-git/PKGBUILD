pkgname=qcachegrind-qt5-git
pkgver=4.13.95.r4.g3be5343
pkgrel=1

pkgdesc='Visualization of Performance Profiling Data (Qt5 version)'
url='http://kcachegrind.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL')

depends=('qt5-base')
makedepends=('git')
optdepends=('graphviz: For drawing call graphs')

provides=('qcachegrind')
conflicts=('qcachegrind')

source=('git://anongit.kde.org/kcachegrind')

md5sums=('SKIP')

pkgver() {
    cd kcachegrind
    git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
    cd kcachegrind
    qmake-qt5
    make
}

package() {
    cd kcachegrind
    install -Dm755 qcachegrind/qcachegrind "$pkgdir"/usr/bin/qcachegrind
    install -Dm755 cgview/cgview "$pkgdir"/usr/bin/cgview
    install -Dm644 qcachegrind/qcachegrind.desktop "$pkgdir"/usr/share/applications/qcachegrind.desktop
    install -Dm644 kcachegrind/hi32-app-kcachegrind.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/kcachegrind.png
    install -Dm644 kcachegrind/hi48-app-kcachegrind.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/kcachegrind.png
}
