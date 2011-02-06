# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Borislav Gerassimov <borislav_ba@hotmail.com>
# Contributor: Artem Sereda <overmind88@yandex.ru>

pkgname=qutim-icq
pkgver=0.2_alpha
pkgrel=1
pkgdesc="A free ICQ client using the QT toolkit"
arch=('i686' 'x86_64')
url="http://qutim.org/"
license=('GPL')
depends=('qt>=4.4') 
makedepends=('cmake>=2.6')
conflicts=('qutim')
source=($url/uploads/qutim_${pkgver}_source.tar.bz2 \
	qutim.desktop)
md5sums=('6045f1c52dcea4b693bbf637d3461fad'
         '22878318c6bb42ee4f867391118ed7b5')

build() {
  cd qutim

  cmake . \
	-DCMAKE_INSTALL_PREFIX=/usr \
	|| return 1

  make DESTDIR="$pkgdir" install || return 1

  cd plugins/icq

  qmake || return 1
  make  || return 1

  install -Dm644 ../libicq.so "$pkgdir"/usr/lib/qutim/libicq.so  

  install -Dm644 "$srcdir"/qutim/icons/qutim_64.png "$pkgdir"/usr/share/pixmaps/qutim.png
  install -Dm644 "$srcdir"/qutim.desktop "$pkgdir"/usr/share/applications/qutim.desktop
}
