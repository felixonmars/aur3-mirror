# Maintainer: Christoph Haag <haagch at studi.informatik.uni-stuttgart.de>

pkgname=libglu-git
pkgver=9.0.0.r2.g0692115
pkgrel=1
pkgdesc="GL utility library for mesa builds from git after 2012-08-31"
arch=('i686' 'x86_64')
url="http://mesa.freedesktop.org/"
license=('LGPL')
provides=('libglu' 'glu')
depends=('libgl' 'gcc-libs')
makedepends=('mesa')
conflicts=('libglu' 'glu')
options=(!libtool)
source=('git://cgit.freedesktop.org/mesa/glu/')

pkgver() {
        cd "${srcdir}/glu"

        if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
                echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
        else
                echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
        fi
}


build() {
  cd "${srcdir}/glu"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/glu"
  make DESTDIR="${pkgdir}" install
}
md5sums=('SKIP')
