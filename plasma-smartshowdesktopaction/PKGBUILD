# Maintainer: Pafrapé <pafrape@free.fr>

pkgname=plasma-smartshowdesktopaction
_pkgname=SmartShowDesktopAction
pkgver=0.5
pkgrel=1
pkgdesc="smart Show Desktop mouse is an mouse action that shows & hides the desktop. It is smarter than Plasma's built in."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/smart+Show+Desktop+mouse+action?content=156037"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
source=(http://www.forceway.com/files/"$_pkgname-$pkgver".tar.gz)
md5sums=('55fc782c8e6307793c050404d811ea86')
install=smartshowdesktopaction.install

build() {
  cd "$srcdir/$_pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix)
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}