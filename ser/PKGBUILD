# Contributor: Florian Pritz <bluewind@xinu.at>
pkgname=ser
pkgver=0.9.6
pkgrel=1
pkgdesc="SIP Express Router, a sip proxy/server"
arch=(i686 x86_64)
url="http://www.iptel.org/ser/"
license=('GPL')
depends=(glibc)
makedepends=() #builds without any?!
optdepends=(
  "expat: jabber gateway support (the jabber module)"
  "xml2: cpl-c (CPL support) or pa (presence) modules"
  "postgresql-libs: postgres support (the postgres module)"
  "libmysqlclient: mysql support (the mysql module)"
  "zlib: mysql support (the mysql module)"
  )
backup=(etc/ser/dictionary.ser etc/ser/ser.cfg)
source=(http://ftp.iptel.org/pub/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}_src.tar.gz)
md5sums=('31031225d483c0d5ac43e8eb5d0428e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "
    s|^prefix = \\\$(PREFIX)\$|prefix = /usr|;
    s|^cfg-prefix = .*|cfg-prefix = \$(basedir)|
    s|^cfg-target = .*|cfg-target = \$(basedir)/\$(cfg-dir)|
    " Makefile.defs
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make basedir="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
