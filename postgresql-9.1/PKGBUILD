# Maintainer: Adam Gradzki <adam.gradzki@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=postgresql-9.1
pkgver=9.1.13
pkgrel=2
_majorver=9.1
pkgdesc="PostgreSQL Database 9.1 (includes both server and libs)"
arch=('i686' 'x86_64')
url="https://wiki.postgresql.org/wiki/"
license=('custom:PostgreSQL')
backup=('etc/pam.d/postgresql' 'etc/logrotate.d/postgresql')
options=(!strip) # to facilitate debugging of testing builds
depends=('libxml2')
makedepends=('python2' 'perl')
optdepends=('python2: for PL/Python support'
            'perl: for PL/Perl support')
conflicts=('postgresql-libs' 'postgresql' 'postgresql-testing')
provides=("postgresql-libs=$pkgver" "postgresql=$pkgver")
source=("http://ftp.postgresql.org/pub/source/v$pkgver/postgresql-$pkgver.tar.bz2"
        postgresql-run-socket.patch
        postgresql.pam
        postgresql.logrotate
        postgresql.service
        postgresql.tmpfiles.conf
        postgresql-check-db-dir)
install=postgresql.install

prepare() {

  cd postgresql-$pkgver
  patch -Np1 < ../postgresql-run-socket.patch

}

build() {

  cd postgresql-$pkgver

  ./configure --prefix=/usr \
  --mandir=/usr/share/man \
  --datadir=/usr/share/postgresql \
  --sysconfdir=/etc \
  --with-libxml \
  --with-openssl \
  --with-perl \
  --with-python PYTHON=/usr/bin/python2 \
  --with-pam \
  --with-system-tzdata=/usr/share/zoneinfo \
  --enable-nls \
  --enable-thread-safety
  #--with-krb5 \
  #--with-tcl \

  make
  make -C contrib
}

package() {

  cd postgresql-$pkgver

  # install
  make DESTDIR="${pkgdir}" install
  make -C contrib DESTDIR="${pkgdir}" install

  # install license
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 "${srcdir}/postgresql.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/postgresql.conf"
  install -D -m644 "${srcdir}/postgresql.service" \
    "${pkgdir}/usr/lib/systemd/system/postgresql.service"
  install -D -m755 "${srcdir}/postgresql-check-db-dir" \
    "${pkgdir}/usr/bin/postgresql-check-db-dir"
  install -D -m644 "${srcdir}/postgresql.pam" \
    "${pkgdir}/etc/pam.d/postgresql"
  install -D -m644 "${srcdir}/postgresql.logrotate" \
    "${pkgdir}/etc/logrotate.d/postgresql"
}
sha256sums=('20f8aa5dfcb47688ca6b6c41340cac61712d9cf87c34d58b0a75bb2f85d89b7f'
            '728835fbd0803140a1537902dcddca6f8e5869e784af256aca96fb1518971b7b'
            '57dfd072fd7ef0018c6b0a798367aac1abb5979060ff3f9df22d1048bb71c0d5'
            '6abb842764bbed74ea4a269d24f1e73d1c0b1d8ecd6e2e6fb5fb10590298605e'
            'c69b614731fdd3f4e127540814f5999f423363523c5209e252e19b1d4362ad68'
            '7e086d70e0dcaa6ce45693b4e826ce92d770192b3aff5642319b1ef279d88dc4'
            '43d62ce95410e1a5a6c7e7f71443fbf6741ed5005f9889949b9e314a3c3db1c5')
