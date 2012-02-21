# Maintainer: Tobias Neumann <mail at tobias dash neumann dot eu>

pkgname=firefox-requestpolicy
pkgver=0.5.24
pkgrel=1
pkgdesc="plugin for firefox that gives control over cross-site requests"
arch=('any')
url="https://www.requestpolicy.com/"
license=('GPL' 'LGPL')
depends=('firefox>=4.0' 'firefox<=12.0a1')
makedepends=('unzip')
source=(https://www.requestpolicy.com/releases/requestpolicy-$pkgver.xpi)
md5sums=('27e84e43e5c9ab0151e2cff0565eb6c1')

build() {
    cd $srcdir
    local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
    local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
    install -d $dstdir
    cp -R * $dstdir
    rm $dstdir/*.xpi
}
