# Maintainer: Jeremy Pope <jpope@jpope.org> PGP-Key: E00B4261
pkgname=choqok-yourls
pkgver=1.4.2.ge970602
pkgrel=1
pkgdesc='GIT version of Choqok with patch for the yourls plugin: https://bugs.kde.org/show_bug.cgi?id=265219'
url='http://choqok.gnufolks.org'
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdelibs' 'qjson' 'qoauth' 'qca-ossl')
makedepends=('git' 'cmake' 'automoc4' 'docbook-xsl')
conflicts=('choqok' 'choqok-git' 'choqok-pumpio')
provides=('choqok')
install="${pkgname}.install"
source=('git://anongit.kde.org/choqok'
        'yourls.diff')
md5sums=('SKIP'
         'ac03c9b5d2c471747e080c94ca47cbb7')

_gitroot='git://anongit.kde.org/choqok'
_gitname='choqok'

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed -e 's|-|.|g' -e 's|^v||'
}

build() {
    cd ${srcdir}
    msg 'GIT checkout done or server timeout'

    msg 'Patching file'

    cd ${srcdir}/${_gitname}
    git checkout -b yourls
    patch -p1 < ../../yourls.diff

    msg 'Starting make...'

    rm -rf ${srcdir}/build
    mkdir -p ${srcdir}/build
    cd ${srcdir}/build

    cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ../${_gitname}

    make

    cd ${srcdir}/${_gitname}
    git checkout master && git branch -d yourls
}

package() {
    cd ${srcdir}/build
    make DESTDIR=$pkgdir install
}
