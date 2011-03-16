# Contributor: Jan Moeller <kowalsk84@googlemail.com>
pkgname=pdf_presenter_console
pkgver=2.0
pkgrel=3
pkgdesc="Presentation viewer for PDF files including Keyjnote like multi-monitor support."
arch=('i686' 'x86_64')
url="http://westhoffswelt.de/projects/pdf_presenter_console.html"
license=('GPL')
depends=('poppler-glib')
makedepends=('cmake>=2.6' 'vala>=0.11')
source=(http://westhoffswelt.de/data/projects/pdf_presenter_console/$pkgname-$pkgver.tar.gz)
md5sums=('b5f3c63b711eb4d8dad509562a5d5b21')

build() {
  cd "Pdf-Presenter-Console-$pkgver"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr/" ../
  make
  make DESTDIR="$pkgdir" install
}

