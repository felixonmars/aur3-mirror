#Contributor: Kessia Pinheiro <kessiapinheiro at gmail.com> 
pkgname=madplay
pkgver=0.15.2b
pkgrel=5
pkgdesc="a curses front-end for various audio players."
url="http://www.underbit.com/products/mad/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmad' 'libid3tag' 'esd')
source=("http://downloads.sourceforge.net/mad/${pkgname}-${pkgver}.tar.gz"
        'madplay-lame-tag-0.15.2b.patch')
md5sums=('6814b47ceaa99880c754c5195aa1aac1' 
         '542004033df04a062ced737cdbe986e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # apply patch to fix LAME decoding
  patch -p0 < ../madplay-lame-tag-0.15.2b.patch

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
