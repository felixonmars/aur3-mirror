# Contributor: Tom K <tomk@runbox.com>
# Contributor: ploxiln <pierce.lopez@gmail.com>
pkgname=mbrowse
pkgver=0.4.3
pkgrel=1
pkgdesc='A SNMP MIB browser based on GTK2 and net-snmp.'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/mbrowse/'
license=('GPL')
depends=('gtk2' 'net-snmp')
source=("http://sourceforge.net/projects/mbrowse/files/$pkgver/mbrowse-$pkgver.tar.gz")
md5sums=('9857a88d2e6246384587350a647e605d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr        \
              --disable-gtktest    \
              --with-snmp-type=net
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
