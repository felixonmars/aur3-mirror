# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=ktu
pkgver=0.0.3
pkgrel=1
pkgdesc="A tool to fetch and edit KDE's translations from SVN"
arch=('i686')
url="http://www.kde-apps.org/content/show.php?content=43429"
license=('GPL')
depends=('kdesdk' 'subversion' 'sqlite3' 'gettext')
source=(http://www.kde-apps.org/CONTENT/content-files/43429-$pkgname-$pkgver.tar.bz2)
md5sums=('d22bd0c3d1ffe0507a4225ba8c0bde87')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
