# Maintainer: Nathan Fisher <nfisher.sr@gmx.com>

pkgname=dozenal-git
pkgver=r314.gbcc67cd
pkgrel=1
pkgdesc="Tools for dozenal (base 12) counting."
url="http://sourceforge.net/projects/dozenal/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
source=("git://git.code.sf.net/u/nfisher1226/dozenal")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/dozenal"
  echo "r$(git rev-list --count master).g$(git log -1 --format="%h")"
}

build() {
  cd "${srcdir}/dozenal/dozenal"
  make
}

package() {
  cd "${srcdir}/dozenal/dozenal"
  make prefix=${pkgdir}/usr install
}
