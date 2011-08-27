# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

pkgname=postgresql-client
pkgver=9.0.2
pkgrel=1
pkgdesc="Client only install of a sophisticated object-relational DBMS"
arch=('i686' 'x86_64')
license=('BSD')
#backup=('etc/conf.d/postgresql' 'etc/pam.d/postgresql')
url="http://www.postgresql.org/"
depends=("postgresql-libs>=$pkgver" "libxml2" 'readline>=6.0')
options=('!makeflags')
source=("ftp://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2" "build.patch")
md5sums=('fc79ef32b602f75f2ccd37647bc008e9'
         '4d74f4227dc5e12bf95b3490758d86c9')

build() {
  cd $srcdir/postgresql-$pkgver

  # patch to remove regress/test make target (won't build with it present)
  patch -Np1 -i ../build.patch

  # configure
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc \
    --with-openssl \
    --datadir=/usr/share/postgresql \
    --with-pam \
    --with-libxml
  
  sed -i -e '/interfaces/d' src/Makefile
  
  # build
  make
}

package() {
  cd $srcdir/postgresql-$pkgver

  # install
  make -C src/bin DESTDIR=$pkgdir install
  make -C src/include DESTDIR=$pkgdir install
  make -C src/interfaces DESTDIR=$pkgdir install
  #make -C doc DESTDIR=$pkgdir install || return 1
  
  # clean up unneeded installed items
  rm -rf $pkgdir/usr/include/postgresql/internal
  rm -rf $pkgdir/usr/include/libpq
  rm -rf $pkgdir/usr/include/*
  rm -f $pkgdir/usr/bin/pg_config
  rm -f $pkgdir/usr/bin/ecpg
  rm -f $pkgdir/usr/lib/*
  rm -f $pkgdir/usr/share/postgresql/pg_service.conf.sample
  
  # install license
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}
# vim:set ts=2 sw=2 et:
