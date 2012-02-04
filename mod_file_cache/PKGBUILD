pkgname=mod_file_cache
pkgver=2.2.6
pkgrel=1
pkgdesc="file cache module for apache"
arch=(i686 x86_64)
options=('!libtool')
url='http://www.apache.org/dist/httpd'
license=('APACHE')
depends=('openssl>=0.9.8b' 'zlib' 'apr-util>=1.2.7-2' 'db>=4.6', "apache=$pkgver")
source=(http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2)
md5sums=('203bea91715064f0c787f6499d33a377') 

build() {
  cd ${startdir}/src/httpd-${pkgver}
  # fix the suexec user
  sed -i 's|^#define AP_HTTPD_USER.*$|#define AP_HTTPD_USER "nobody"|' \
    support/suexec.h
  ./configure --prefix=/usr --enable-layout=RedHat --datadir=/home/httpd \
    --enable-modules=all --enable-mods-shared=all --enable-ssl --enable-so \
    --enable-proxy --enable-proxy-connect --enable-proxy-ftp \
    --enable-proxy-http --enable-suexec --enable-dbd \
    --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache \
    --with-apr=/usr --with-apr-util=/usr \
    --with-mpm=worker
  make || return 1                     
  make DESTDIR=${startdir}/pkg install   
  for x in etc home usr/sbin usr/bin usr/include usr/man var; do
    rm -rf ${startdir}/pkg/$x
  done
  for x in ${startdir}/pkg/usr/lib/apache/*; do
    basex=$(basename $x)
    if [ "$basex" != "mod_file_cache.so" ]; then
      rm $x
    fi
  done
}
