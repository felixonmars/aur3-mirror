# Maintainer: boenki <boenki at gmx dot de>

pkgname=liburlmatch-git
pkgver=0.r222.ge10add2
pkgrel=1
pkgdesc="Fast URL matcher library"
url="https://github.com/clbr/urlmatch"
license=('AGPL3')
arch=('i686' 'x86_64')
makedepends=('git')
options=(libtool staticlibs)
source=('git+https://github.com/clbr/urlmatch.git')
md5sums=('SKIP')


pkgver() {
  cd urlmatch

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
   echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
   echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

build() {
  cd urlmatch
  make
}

package() {
  cd urlmatch
  make DESTDIR=$pkgdir install
}
