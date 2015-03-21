# PKGBUILD template to install Espresso 
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>

pkgname=plumed
pkgver=2.1.2
pkgrel=1
pkgdesc="An open source plugin for free energy calculations in molecular systems which works together with some of the most popular molecular dynamics engines."
url="http://www.plumed-code.org/"
license=("GPL")
arch=(i686 x86_64)
depends=('lapack' 'libmatheval')
optdepends=()
makedepends=()
provides=('plumed')
install=$pkgname.install
source=( https://github.com/plumed/plumed2/archive/v${pkgver}.tar.gz)
sha1sums=('06082147fe7e2f44b46275ed0cf9b8c28f94510c')

package() {
msg2 "Create folder in /opt/plumed"
mkdir -p ${pkgdir}/opt/plumed
msg2 "Copy all extracted files to /opt/plumed"
cp -R ${srcdir}/plumed2-${pkgver}/* ${pkgdir}/opt/plumed
}

