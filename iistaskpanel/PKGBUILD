
pkgname=iistaskpanel
pkgver=0.2.2
pkgrel=1
pkgdesc="Qt widget like to Windows XP panel for common tasks of a folder"
url="http://www.qt-apps.org/content/show.php/iisTaskPanel?content=79286"
depends=('qt4')
makedepends=('qt4')
arch=('x86_64' 'i686')
source=("http://qt-apps.org/CONTENT/content-files/79286-iistaskpanel-${pkgver}-src.zip")
md5sums=('5a63ee322d49c404854071592e536c29')
license=('LGPL')

build() {
  cd "$srcdir"/iistaskpanel-${pkgver}-src
  sed -i "s|SUBDIRS =  src \\\\|SUBDIRS = src|g" taskpanel.pro
  sed -i "s|tests|#tests|g" taskpanel.pro
  qmake-qt4
  make
}

package () {
  install -d "$pkgdir"/usr/include/iistaskpanel
  install -m644 "$srcdir"/iistaskpanel-${pkgver}-src/src/*.h "$pkgdir"/usr/include/iistaskpanel
  install -d "$pkgdir"/usr/lib
  cp -P "$srcdir"/iistaskpanel-${pkgver}-src/lib/libiistaskpanel* "$pkgdir"/usr/lib
}

