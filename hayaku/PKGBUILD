# Contributor: Shaika-Dzari <shaikadzari@gmail.com>
pkgname=hayaku
pkgver=1.5.2
pkgrel=1
pkgdesc="Application launcher"
arch=('i686' 'x86_64')
url="http://www.4nakama.net/projet.php"
license=('GPL')
depends=('qt')
source=(http://www.4nakama.net/download/$pkgname-$pkgver.tar.bz2
		hayaku.desktop)
md5sums=('5f5b52add9163be64240eab3e8f0f499'
         '61f159ce7af2ceebf8e1e1a763fc0b4e')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  qmake -config release
  make || return 1

  # Executable
  install -Dm755 bin/hayaku $startdir/pkg/usr/bin/hayaku
  
  # .desktop file
  install -Dm644 $startdir/src/hayaku.desktop $startdir/pkg/usr/share/applications/hayaku.desktop

  # Icon
  install -Dm644 ui/hayaku.png $startdir/pkg/usr/share/pixmaps/hayaku.png
}

