# Maintainer: Gen2ly <dirk.r.gently@gmail.com>
pkgname=isomd5sum-git
pkgver=20090914
pkgrel=1
pkgdesc="Check ISO9660 application data for md5sum"
arch=('any')
url="http://git.fedoraproject.org/git/isomd5sum.git"
license=('GPL2')
depends=('python')
makedepends=('git')
source=()

_gitroot="git://git.fedorahosted.org/isomd5sum.git"
_gitname="isomd5sum"

build() {
  cd ${srcdir}
  msg "Connecting to git.fedorahosted.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot
  fi

  cd ${srcdir}/isomd5sum
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

md5sums=()
