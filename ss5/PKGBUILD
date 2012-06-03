# Contributor: <fedor@yu.wildpark.net>

pkgname=ss5
pkgver=3.8.9_6
pkgrel=2
pkgdesc="ss5 is a socks server, which supports both SOCKS4 and SOCKS5 protocols,
that runs on Linux/Solaris platforms."
arch=('i686' 'x86_64')
url="http://ss5.sf.net/"
license=('GPL')
depends=(libldap pam openssl krb5)
install=ss5.install
source=(http://downloads.sourceforge.net/project/ss5/ss5/${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz ss5d)
md5sums=('54c398f20a65a090fbde6c6bafb2b11c'
         'cb055c6b93e81785f8b0d5852e2ffdc8')
install=$pkgname.install
backup=('etc/ss5/ss5.conf' 'etc/ss5/ss5.passwd' 'etc/conf.d/ss5' )

build() {
  cd ${srcdir}/$pkgname-${pkgver//_6/}/

  autoconf
  EXTRA_LIBS='-lcrypto' ./configure --with-libpath=/usr/lib \
  --with-confpathbase=/etc \
  --with-passwordfile=/etc/ss5/ss5.passwd \
  --with-configfile=/etc/ss5/ss5.conf \
  --with-profilepath=/etc/ss5 \

  make || return 1
  make install dst_dir=${startdir}/pkg
  cp -f ${pkgdir}/etc/sysconfig/ss5 ${startdir}/ss5.confd
  rm -rf ${pkgdir}/etc/sysconfig
  rm -rf ${pkgdir}/etc/rc.d/init.d
  
  install -D -m644 ${startdir}/ss5.confd ${pkgdir}/etc/conf.d/ss5
  install -D -m744 ${startdir}/ss5d ${pkgdir}/etc/rc.d/ss5
  
}
