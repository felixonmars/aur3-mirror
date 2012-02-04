# Maintainer : Rémy Oudompheng <remy@archlinux.org>

pkgname=pacweb-git
pkgver=20110703
pkgrel=1
pkgdesc="A web interface to pacman"
arch=('any')
url="http://projects.archlinux.org/users/remy/pacweb.git/"
license=('GPL')
depends=('python-jinja' 'pyalpm' 'python-distribute')
makedepends=('git')
source=("pacweb.sh")

_gitroot='git://projects.archlinux.org/users/remy/pacweb.git'
_gitname=pacweb

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  python setup.py build
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root=${pkgdir}
  install -D -m 755 ${srcdir}/pacweb.sh ${pkgdir}/usr/bin/pacweb
}

md5sums=('c6f57c734f0873f4720089b9d02ed5a2')
