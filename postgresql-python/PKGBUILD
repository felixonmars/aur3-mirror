# $Id$
# Maintainer: Mounier Florian <paradoxxx.zero@gmail.com>

pkgname=postgresql-python
pkgver=9.3.4
pkgdesc="Provides required libraries for using plpython3u (plpython using python 3)"
_majorver=${pkgver%.*}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.postgresql.org/"
license=('custom:PostgreSQL')
makedepends=('krb5' 'libxml2' 'perl' 'tcl>=8.6.0' 'openssl>=1.0.0')
depends=('python' 'postgresql')
provides=('postgresql-python')
conflicts=('postgresql-python')

source=(http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2
        postgresql-run-socket.patch
        postgresql.pam postgresql.logrotate
        postgresql.service postgresql.tmpfiles.conf postgresql-check-db-dir)
md5sums=('d0a41f54c377b2d2fab4a003b0dac762'
         '75c579eed03ffb2312631f0b649175b4'
         '96f82c38f3f540b53f3e5144900acf17'
         'd28e443f9f65a5712c52018b84e27137'
         '89b48774b0dae7c37fbb0e907c3c1db8'
         '1c5a1f99e8e93776c593c468e2612985'
         'ea7f9f914900e60835d20cb95010e63c')
sha256sums=('9ee819574dfc8798a448dc23a99510d2d8924c2f8b49f8228cd77e4efc8a6621'
            '8538619cb8bea51078b605ad64fe22abd6050373c7ae3ad6595178da52f6a7d9'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'c69b614731fdd3f4e127540814f5999f423363523c5209e252e19b1d4362ad68'
            '7e086d70e0dcaa6ce45693b4e826ce92d770192b3aff5642319b1ef279d88dc4'
            'b3ed31e5882e5bdf4515d488d3f2db874ff5561be3091eab29810f831038a888')

build() {
  cd "${srcdir}/postgresql-${pkgver}"

  patch -Np1 < ../postgresql-run-socket.patch

  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-krb5 \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python \
  --with-tcl \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --enable-nls \
  --enable-thread-safety

  make world
}

package() {
  cd "${srcdir}/postgresql-${pkgver}"

  make -C src/pl/plpython DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/plpython-9.3.mo
}
