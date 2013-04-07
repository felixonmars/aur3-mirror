# Author: Gaute Hope <eg@gaute.vetsj.com>

pkgname=winwrangler
pkgver=0.2.4
pkgrel=2
pkgdesc="Small desktop daemon to perform advanced window manipulations not commonly found in window managers."
arch=('any')
url="https://launchpad.net/winwrangler"
license=('GPL3')
depends=('libwnck>=2.22' 'glib2>=2.15.6' 'gtk2' 'gtkhotkey')
source=(icon.diff http://launchpad.net/winwrangler/${pkgver%.*}/${pkgver}/+download/winwrangler-${pkgver}.tar.gz)

md5sums=('d7e77438a112502f3e61e10f28609b3f'
         '2fde578a7a734f6acd9a117c794c8b0b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../../icon.diff || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

package() {
  :
}

