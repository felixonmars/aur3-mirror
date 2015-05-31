# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=krb5-appl-git
pkgver=r1637.g680b24c
pkgrel=1
pkgdesc="Obsolete client applications from the MIT Kerberos suite"
arch=('i686' 'x86_64')
url="http://web.mit.edu/kerberos/"
license=('custom')
depends=('e2fsprogs')
makedepends=('perl' 'subversion')
provides=('krb5-appl')
conflicts=('krb5-appl')
source=('git://github.com/krb5/krb5-appl.git'
        'krb5-eklogind.socket'
        'krb5-eklogind@.service'
        'krb5-ftpd.socket'
        'krb5-ftpd@.service'
        'krb5-klogind.socket'
        'krb5-klogind@.service'
        'krb5-kshd.socket'
        'krb5-kshd@.service'
        'krb5-telnetd.socket'
        'krb5-telnetd@.service'
        )
sha1sums=('SKIP'
          '2c1e4784cdc19a6624fecec188a6bf89e8a30192'
          '9a49bdf44395cf54c964f74ae42611e2d7d7545a'
          '15d732d2e7ed3ac0c02e1d0f84e682f59440b499'
          '928afcb512234e2abb0ce0f74b22fd0edf604c1a'
          '6d8da6f5c9fb767852ee7bf190081bf73f9a31dc'
          '9fcd355850b6c0349d93db5ffb30f90878a40349'
          '03e89e3f00b49d31753c97855006ef6471fa5cea'
          '190811a9f543c24715283195ebb3e83954bad2be'
          'eb0726d124c8649866d2a42e13b8ce22ecf63186'
          'e287f799ca7707ef928863936237d420522f0ed8')

pkgver() {
  cd krb5-appl
  echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
  cd krb5-appl
  ./autogen.sh
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --mandir=/usr/share/man   \
    --localstatedir=/var/lib  \
    --program-prefix=krb5-    \
    ;
  sed -i '/^RSH=/ s/\<rlogin\>/krb5-&/' bsd/Makefile
  make
}

package() {
  cd krb5-appl
  make DESTDIR="$pkgdir" install
  install -Dm0644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd ..
  for file in *.{socket,service}; do
    install -Dm0644 "$file" "$pkgdir/usr/lib/systemd/system/$file"
  done
}

# vim: ts=2:sw=2:et
