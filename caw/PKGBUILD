# $Id: PKGBUILD,v 1.5 2008/11/01 10:59:40 allan Exp $
# Maintainer: Donald Ephraim Curtis <dcurtis@gmail.com>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

pkgname=caw
pkgver=0.9
pkgrel=1
pkgdesc="Lightweight infobar / panel / taskbar written in Python using the XCB library and Cairo"
arch=('i686' 'x86_64')
url="http://github.com/decurtis/caw"
license=('GPL')
depends=('python>=2.6' 'xcb-util' 'cairo' 'xpyb' 'pango')
makedepends=('python')
optdepends=('python-pyalsaaudio')
md5sums=('f1f9a2ed80be72ab36e748833618daba')

_gitroot="git://github.com/decurtis/caw.git"
_gitname="caw"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting build..."
  cd $_gitname
  python setup.py install --root=${pkgdir} || return 1
} 

