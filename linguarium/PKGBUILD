# Maintainer: Massimiliano Vassalli <vassalli.max@gmail.com>
pkgname=linguarium
pkgver=1.0.5
pkgrel=1
pkgdesc="Dizionario di lingue antiche: latino, etrusco, osco"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/Linguarium?content=143699"
license=('custom')
depends=('gambas2-runtime>=1.9.48' 'gambas2-gb-db>=1.9.48' 'gambas2-gb-qt>=1.9.48' 'gambas2-gb-form>=1.90.1' 'gambas2-gb-db-form>=1.90.1' 'gambas2-gb-db-sqlite3>=1.9.48' 'gambas2-gb-qt-opengl>=1.9.48' 'gambas2-gb-opengl>=1.9.48' 'gambas2-gb-qt-ext>=1.9.48' 'gambas2-gb-qt-kde>=1.9.48')
source=(http://kde-apps.org/CONTENT/content-files/143699-linguarium_1.0.5-1_all.deb)
md5sums=('0e4c7ff8826a0ee8f818e12d9fdaf1bb')

build() {
  cd "$srcdir"
  ar x 143699-linguarium_1.0.5-1_all.deb || return 1
  tar xzf data.tar.gz || return 1
  mv usr/ $pkgdir
}
