# Contributor: <fedor@yu.wildpark.net>
# Contributor: miau9202 ( https://aur.archlinux.org/account/miau9202/ )
# Contributor: leniviy ( https://aur.archlinux.org/account/leniviy/ )

pkgname=ss5
pkgver=3.8.9_8
pkgrel=1
pkgdesc="ss5 is a socks server, which supports both SOCKS4 and SOCKS5 protocols,
that runs on Linux/Solaris platforms."
arch=('i686' 'x86_64')
url="http://ss5.sf.net/"
license=('GPL')
depends=(libldap pam openssl krb5)
install=ss5.install
source=(http://downloads.sourceforge.net/project/ss5/ss5/${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz
        peersfile.patch
        ss5.service)
install=$pkgname.install
backup=('etc/ss5/ss5.conf' 'etc/ss5/ss5.passwd' 'etc/conf.d/ss5' )

build() {
  cd ${srcdir}/$pkgname-${pkgver%_*}/

  patch -Np1 -i ${srcdir}/peersfile.patch

  [ x"$CFLAGS" = x ] || export CFLAGS=${CFLAGS//-D_FORTIFY_SOURCE=2/} # workaround bad use of snprintf()

  autoconf
  EXTRA_LIBS='-lcrypto' ./configure --with-libpath=/usr/lib \
  --with-confpathbase=/etc \
  --with-passwordfile=/etc/ss5/ss5.passwd \
  --with-configfile=/etc/ss5/ss5.conf \
  --with-peersfile=/etc/ss5/ss5.ha \
  --with-profilepath=/etc/ss5 \

  make || return 1
  make install dst_dir=${pkgdir}
  cp -f ${pkgdir}/etc/sysconfig/ss5 ${startdir}/ss5.confd
  rm -rf ${pkgdir}/etc/sysconfig
  rm -rf ${pkgdir}/etc/rc.d
  
  install -D -m644 ${startdir}/ss5.confd ${pkgdir}/etc/conf.d/ss5
  install -D -m644 ${srcdir}/ss5.service ${pkgdir}/usr/lib/systemd/system/ss5.service
}
md5sums=('dacd5112c667d479cb23e0e6fa3baf98'
         '5571f16643390274a2e79aeb8089b9c8'
         'dbdf44bf6553f466e3fd91aa09e6d3f7')
