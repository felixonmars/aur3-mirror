# Contributor: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=rfkill-git
pkgver=20090801
pkgrel=1
pkgdesc="Simple /dev/rfkill userspace tool (Git version)"
arch=(i686 x86_64)
url="http://git.sipsolutions.net/rfkill.git"
license=('custom')
depends=('glibc')
makedepends=('git')
source=()
md5sums=()

_gitroot="http://git.sipsolutions.net/rfkill.git"
_gitname="rfkill"

build() {

  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  # install license
  install -Dm644 ${srcdir}/$_gitname-build/COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING || return 1
}

