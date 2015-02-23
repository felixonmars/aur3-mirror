#

_pkgname=moltaqa-lib
pkgname=$_pkgname-bin
pkgver=1.0b1
pkgrel=1
pkgdesc="Moltaqa Library is an Arabic and Islamic Library written in C++. It can help reading and searching in thousnds of islamic books. It uses HTML/CSS to display books pages, and CLucene as search engine backend."
arch=('i686')
license=('Proprietary')
url="http://www.ahlalhdeeth.com/vb/showthread.php?t=312875"
depends=('qt4' 'qtwebkit')
conflicts=('moltaqa-lib')
provides=('moltaqa-lib')
source=("http://sourceforge.net/projects/albahhet/files/moltaqa/${_pkgname}-${pkgver}.rpm")
sha256sums=('8f3ad73c648fd9f5c518dac5157da4fb9334b63893a53a0fe554f4bb07050b9a')

package() {
  mv usr/ "$pkgdir/"
}
