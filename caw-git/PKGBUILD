# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

_pkgname=caw
pkgname=caw-git
pkgver=r106.795e6d7
pkgrel=1
pkgdesc="Lightweight infobar / panel / taskbar written in Python2 using the XCB, Cairo, Pango (Git Version)"
arch=('i686' 'x86_64')
url="https://github.com/milkypostman/caw"
license=('GPL')
depends=('python2' 'xcb-util-wm' 'cairo' 'python2-xcffib>=0.2.3' 'pango')
optdepends=('xpyb: Replacement for python2-xcffib'
            'python2-pyalsaaudio:')
source=('git://github.com/milkypostman/caw.git'
    'caw_config.patch')
md5sums=('SKIP'
         '50a95200e76122ba2e34581e59632ac9')


pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -Np0 -i $srcdir/caw_config.patch
}

build() {
  cd $srcdir/$_pkgname
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname
  python2 setup.py install --root=${pkgdir}  --prefix=/usr
}
