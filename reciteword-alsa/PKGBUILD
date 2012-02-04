#Contributor: Wang Shouju <TheThirdGhost[AT]gmail[DOT]com>
#Contributor: moostik <mooostik_at_gmail.com>

pkgname=reciteword-alsa
pkgver=0.8.4
pkgrel=2
pkgdesc="a education software to help people to study English with alsa support"
arch=('i686' 'x86_64')
url="http://reciteword.cosoft.org.cn"
license=("GPL")
depends=('perlxml' 'esound' 'gtk2')
conflicts=('reciteword')
provides=('reciteword')
source=("http://downloads.sourceforge.net/reciteword/reciteword-${pkgver}.tar.bz2")
md5sums=('09fb54601d29c30d3c73ad93fe49399d')

build() {
  cd "${srcdir}/reciteword-${pkgver}"
  patch -p1 -i ../../reciteword-alsa.patch
  export CXXFLAGS="${CXXFLAGS} -fpermissive"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/reciteword-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
