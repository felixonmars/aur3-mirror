# Maintainer: Shingetsu Kurai <andrey.kudryavtsev@gmail.com>
pkgname=sharpview-git
_gitname=code
#fairly weird, yes, but hell, let it call itself what it wants, it seems like it won't change much
pkgver=0.17.caefde8
pkgrel=1
pkgdesc="Minimalistic, easily extendible python-based browser. Intended for educational and experimental purpose."
arch=(any)
url="https://sourceforge.net/p/sharpview/"
license=('GPL3')
depends=(pywebkitgtk python2 pygtk)
makedepends=('git')
provides=(sharpview)
conflicts=(sharpview)

branch="master"
source=("git://git.code.sf.net/p/sharpview/code#branch=$branch")
md5sums=('SKIP')


build() {
  msg "Nothing to be done for build..."
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p {"$pkgdir/usr/bin","$pkgdir/usr/share/sharpview"}
  cp sharpview $pkgdir/usr/bin
  cp -r {cman,toolbar,browser,bar,main.py,README} $pkgdir/usr/share/sharpview
}
pkgver() {
  cd "$srcdir"/git
  echo "0.$(git rev-list --count $branch).$(git describe --always)"
}

# vim:set ts=2 sw=2 et:
