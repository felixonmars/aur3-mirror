pkgname=oxygen-appmenu
pkgver=4.7.2
pkgrel=1
pkgdesc="An oxygen style for kwin displaying application menu in titlebar (via menu button)"
url="http://kde-look.org/content/show.php?content=141254"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace>=4.7.0')
makedepends=('cmake' 'automoc4')
optdepends=('appmenu-gtk2: support for GTK+ 2 apps'
            'appmenu-gtk3: support for GTK+ 3 apps'
            'appmenu-qt: support for Qt apps'
            'libreoffice-extension-menubar: support for LibreOffice')
source=(http://kde-look.org/CONTENT/content-files/141254-$pkgname-$pkgver.tgz)
md5sums=('d8eb98316a7fc14c35447214e35f091f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
