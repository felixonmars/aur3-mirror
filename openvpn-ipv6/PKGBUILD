# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: crazyb0y < bjin1990 at gmail dot com>
# Contributor: philanecros <philanecros@gmail.com>

pkgname=openvpn-ipv6
_pkgrealname=openvpn
pkgver=2.2_beta5
_pkgrealver=2.2-beta5-ipv6-0.4.15
pkgrel=1
pkgdesc="An easy-to-use, robust, and highly configurable VPN (Virtual Private Network) with IPv6 patch"
arch=(i686 x86_64)
url="http://github.com/jjo/openvpn-ipv6/"
depends=('openssl' 'lzo2' 'iproute2')
license=('custom')
backup=(usr/share/openvpn/easy-rsa/vars
        usr/share/openvpn/easy-rsa/openssl.cnf
        etc/conf.d/openvpn-tapdev)
source=("openvpn-ipv6.tar.gz::https://github.com/jjo/openvpn-ipv6/tarball/v$_pkgrealver"
	openvpn.rc
        openvpn-tapdev.rc
        openvpn-tapdev.conf)

md5sums=('fb8c4aa55b156cdf0838c4522d4d9735'
         'a3809b9727f0c2af2d0770f5c7442db2'
         'd2c48e970088d679dd3c2afd914ff731'
         '722f483c9e3ce2ec66d3301aaf7cf3d5')
makedepends=('autoconf' 'automake' 'make' 'gcc')
provides=('openvpn')
conflicts=('openvpn')

build() {
  cd "$srcdir"

  rm -rf $pkgname
  mv jjo-openvpn-ipv6-* "$srcdir/$pkgname"

  cd "$srcdir/$pkgname"
  autoreconf -i -v
  CFLAGS="$CFLAGS -DPLUGIN_LIBDIR=\\\"/usr/lib/openvpn\\\"" ./configure \
    --prefix=/usr \
    --enable-password-save \
    --mandir=/usr/share/man \
    --enable-iproute2 \
    --enable-ipv6
  make || return 1
  
  # Build plugins
  for plug in auth-pam down-root; do
    cd $srcdir/$pkgname/plugin/$plug
    make || return 1 
  done
}

package() {
  cd $srcdir/$pkgname
  # Install openvpn
  make DESTDIR=$pkgdir install
  install -d -m755 $pkgdir/etc/openvpn
  # Install examples
  install -d -m755 $pkgdir/usr/share/openvpn
  cp -r sample-config-files $pkgdir/usr/share/openvpn/examples
  find $pkgdir/usr/share/openvpn -type f -exec chmod 644 {} \;
  find $pkgdir/usr/share/openvpn -type d -exec chmod 755 {} \;
  # Install license
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$_pkgrealname/COPYING
  # Install plugins
  for plug in auth-pam down-root; do
    cd $srcdir/$pkgname/plugin/$plug
    install -D -m755 openvpn-$plug.so $pkgdir/usr/lib/openvpn/openvpn-$plug.so
    cd -
  done
  # Install contrib
  install -d -m755 $pkgdir/usr/share/openvpn/contrib
  cp -r contrib $pkgdir/usr/share/openvpn
  # Install easy-rsa
  cd $srcdir/$pkgname
  make -C easy-rsa/2.0 install DESTDIR=$pkgdir PREFIX=usr/share/openvpn/easy-rsa
  rm -f ${pkgdir}/usr/share/openvpn/easy-rsa/openssl-0.9.?.cnf
  # Install rc scripts
  install -D -m755 $srcdir/openvpn.rc $pkgdir/etc/rc.d/openvpn
  install -D -m755 $srcdir/openvpn-tapdev.rc $pkgdir/etc/rc.d/openvpn-tapdev
  install -D -m644 $srcdir/openvpn-tapdev.conf $pkgdir/etc/conf.d/openvpn-tapdev
}
