# Maintainer: Dmytro Kostiuchenko (edio@gmx.us)
pkgname=plasma-globalmenu-mod
_pkgname=Plasma-GlobalMenu
pkgver=0.21
pkgrel=2
pkgdesc="Provides GTK support for Xbar (global menu in KDE). Patched version wich supports icons and some other usefull features"
arch=('any')
url="http://kde-apps.org/content/show.php/?content=129006"
license=('GPL')
groups=('kde')
depends=('kdebase-workspace' 'bespin-svn' 'gnome-globalmenu')
makedepends=('cmake' 'automoc4')
optdepends=()
provides=('plasma-globalmenu')
conflicts=('plasma-globalmenu')
replaces=()
backup=()
options=()
install=globalmenu.install
changelog=
_id="129006"
source=(http://kde-apps.org/CONTENT/content-files/$_id-$_pkgname-$pkgver.tar.bz2
	http://kxstudio.sourceforge.net/tmp/plasma-globalmenu_goodies.diff)
noextract=()
md5sums=('7f0117957e75078d0aa67ddf9b6bf4c5'
         '977250f271c978fadbbc063276c41615')


build() {
  cd "$srcdir"
  patch -i plasma-globalmenu_goodies.diff -u -p0
  cd "$_pkgname/src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname/src"

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
