# Maintainer: Jeremy Pope <jpope@jpope.org> PGP-Key: E00B4261
pkgname=choqok-pumpio
pkgver=1.4.71.g811e046
pkgrel=1
pkgdesc="A Twitter/StatusNet/Pump.io client for KDE 4. Temporary version while pump.io support is being added."
url="http://choqok.gnufolks.org"
license=("GPL")
arch=('i686' 'x86_64')
depends=('kdelibs' 'qjson' 'qoauth' 'qca-ossl')
makedepends=('git' 'cmake' 'automoc4' 'docbook-xsl')
conflicts=('choqok' 'choqok-git' 'choqok-yourls')
provides=('choqok')
install="${pkgname}.install"
source=('git://anongit.kde.org/clones/choqok/scarpino/choqok-pumpio.git')
md5sums=('SKIP')
_gitroot="git://anongit.kde.org/clones/choqok/scarpino/choqok-pumpio.git"
_gitname="choqok-pumpio"

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed -e 's|-|.|g' -e 's|^v||'
}
build() {
    cd ${srcdir}
    msg "Connecting to GIT server...."

    msg "Starting make..."

    rm -rf ${srcdir}/build
    mkdir -p ${srcdir}/build
    cd ${srcdir}/build

    cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ../${_gitname}

    make
}

package() {
    cd ${srcdir}/build
    make DESTDIR=$pkgdir install
}
