# Maintainer: Maximilian Kindshofer <maximilian@kindshofer.net>
pkgname=woodhouse
pkgver=1.0.1
pkgrel=1
pkgdesc="Folder decluttering tool like hatzle"
arch=('any')
url="https://github.com/MaximilianKindshofer/Woodhouse"
license=('GPL')
depends=('python' 'python-pyside')
makedepends=('git')
provides=('woodhouse')
md5sums=('SKIP')

source=('woodhouse::git+https://github.com/MaximilianKindshofer/WoodhouseArch.git')

build() {
    cd "$pkgname"
}

package() {
    cd "$pkgname"

    install -D -m755 woodhouse ${pkgdir}/usr/bin/woodhouse
    mkdir -p ${pkgdir}/usr/lib/woodhouse
    cp woodhouse.py ${pkgdir}/usr/lib/woodhouse/woodhouse.py
    cp woodhouse_functions.py ${pkgdir}/usr/lib/woodhouse/woodhouse_functions.py
    mkdir -p ${pkgdir}/usr/share/pixmaps/woodhouse
    
    cp active.png ${pkgdir}/usr/share/pixmaps/woodhouse/active.png
    cp deactive.png ${pkgdir}/usr/share/pixmaps/woodhouse/deactive.png
    cp woodhouse.png ${pkgdir}/usr/share/pixmaps/woodhouse/woodhouse.png
    
    mkdir -p ${pkgdir}${HOME}/.woodhouse
    cp rules.conf ${pkgdir}${HOME}/.woodhouse/rules.conf
    chown $USER ${pkgdir}${HOME}/.woodhouse/rules.conf
}
