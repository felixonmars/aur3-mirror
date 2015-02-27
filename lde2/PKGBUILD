# Contributor: Zhuoyi Xu <xzy476386434@vip.qq.com>
pkgname=lde2
pkgver=2.0.1
pkgrel=1
pkgdesc="A Lightweight, Powerful Desktop Environment"
url="http://xuzhuoyi.github.io"
arch=('i686' 'x86_64' 'armv6h')
license="GPL2"
depends=('qt5-base' 'qt5-webkit' 'openbox' 'razorqt-lde' 'feh')
optdepends=()
makedepends=('git')
provides=('lde2')
conflicts=('lde2')
source=("git://github.com/xuzhuoyi/lde.git")
md5sums=('SKIP')

_gitname="lde"


pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always | sed 's/-/_/g')"
}


build() {
  cd "$srcdir/$_gitname/src"
  qmake-qt5 lde.pro
  make
}

package() {
  cd "$srcdir/$_gitname/src"
  install -d $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ $pkgdir/usr/share/xsessions/ $pkgdir/usr/share/wallpapers/ $pkgdir/usr/share/apps/kdm/sessions/
  install ../usr/bin/* $pkgdir/usr/bin/
  install ../share/*.desktop $pkgdir/usr/share/applications/
  install ../shell/startlde $pkgdir/usr/bin/
  install ../xsessions/LDE.desktop $pkgdir/usr/share/xsessions/
  install ../wallpapers/lde-default.png $pkgdir/usr/share/wallpapers/
  install ../xsessions/LDE.desktop $pkgdir/usr/share/apps/kdm/sessions/
}
