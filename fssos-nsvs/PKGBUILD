# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=fssos-nsvs
pkgver=0.5
pkgrel=13
pkgdesc='NSVS for FSSOS'
arch=('i686' 'x86_64')
url='http://fssos.sourceforge.net/'
license=('GPL')
depends=('bash' 'mariadb')
backup=('etc/nsvsd.conf')
options=('!libtool' '!makeflags')
install=$pkgname.install
source=("http://downloads.sourceforge.net/sourceforge/fssos/nsvs-$pkgver.tar.gz"
        'nsvsd.service')
md5sums=('3f17c2f6339f1a322b712b467023d825'
         '45de9db3146ed57046e4d4c1072e38c2')

build() {
  cd nsvs-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --localstatedir=/var
  make CFLAGS="${CFLAGS} -D_GNU_SOURCE"
}

package() {
  cd nsvs-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/nsvsd.service" "$pkgdir/usr/lib/systemd/system/nsvsd.service"
}

# vim:set ts=2 sw=2 et:
