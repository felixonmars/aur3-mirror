# Maintainer: Kevin Thomas <hamgom95 at gmail dot com>

pkgname=webtocon-git
_gitname=webtocon
pkgver=5.40b55b2
pkgrel=1
url='https://github.com/hamgom95/webtocon'
pkgdesc='Create screenshots of websites with xvfb and a browser'
license=('GPL')
arch=('i686' 'x86_64')
depends=('firefox' 'xorg-server-xvfb' 'python-pyvirtualdisplay' 'python' 'python3-blessings' 'python-selenium')
source=("git+https://github.com/hamgom95/webtocon.git")
md5sums=('SKIP')
pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "webtocon"
  install -d ${pkgdir}/usr/bin
  install -m755 ${srcdir}/$_gitname/webtocon ${pkgdir}/usr/bin
}
