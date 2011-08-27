# Maintainer: Brad Arrington <bradla8@yahoo.com>

pkgbase=pbxtplugin
pkgname=('pbxtplugin')
_realpkgname=mysql
pkgver=5.1.54
pkgrel=1
pkgdesc="PBXT version 2a MySQL Database Engine plugin for version 5.1.x" 
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.primebase.org/"
makedepends=('tcp_wrappers' 'zlib' 'perl' 'openssl' 'libtool' 'patch')
options=('!libtool')
source=("http://ftp.gwdg.de/pub/misc/mysql/Downloads/MySQL-5.1/${_realpkgname}-${pkgver}.tar.gz"
        'mysqld'
        'my.cnf'
        'skip-abi-check.patch'
        'pbxt_compile.patch')

md5sums=('2a0f45a2f8b5a043b95ce7575796a30b'
         '2234207625baa29b2ff7d7b4f088abce'
         '0337741fa9afbe57939993636081a827'
         'a97e574945e19de3908575b956241026'
         '10cc8caf3d2b7024845c5fa7a88834c1')

build() {
  cd "${srcdir}"
  bzr branch lp:pbxt/2.0 2.0
  
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/skip-abi-check.patch"
  # CFLAGS/CXXFLAGS as suggested upstream
  CFLAGS="-fPIC ${CFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
  CXXFLAGS="-fPIC ${CXXFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \
  ./configure --prefix=/usr \
    --libexecdir=/usr/sbin \
    --localstatedir=/var \
    --sysconfdir=/etc/mysql \
    --without-docs \
    --without-readline \
    --with-ssl \
    --with-libwrap \
    --with-charset=utf8 \
    --with-collation=utf8_general_ci \
    --with-extra-charsets=complex \
    --with-embedded-server \
    --with-unix-socket-path=/var/run/mysqld/mysqld.sock \
    --enable-local-infile \
    --with-plugins=partition,ftexample,archive,blackhole,federated,heap,innobase,innodb_plugin,ndbcluster
  make 

  cd ..
  patch -p0 < "$srcdir/pbxt_compile.patch"
  cd 2.0
  ./configure --with-mysql=../mysql-5.1.54  
  make 
  make DESTDIR="${pkgdir}" install || return 1
}
