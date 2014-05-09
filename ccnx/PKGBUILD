# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=ccnx
pkgver=0.8.2
pkgrel=2
pkgdesc="content-centric networking (aka named-data networking)."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.ccnx.org"
license=('GPL2' 'LGPL2.1')
depends=('openssl' 'expat' 'libpcap' 'libxml2' 'apache-ant' 'java-environment' 'java-runtime' 'athena-jot')
conflicts=('ccnx-git')
options=('zipman')
source=("http://www.ccnx.org/releases/$pkgname-$pkgver.tar.gz"
        'ndnd.service')
sha512sums=('25f6dbb97a7740eef3473dcad7382b92bd3af380ac3ed83336ef3ad334ebaa314a7192c185884989c35358c4d5777c161b63c95113bd4f20e8385e45ef456f38'
            '88fab2cf73c6887e2feb943d9c5e96ca8d7ad71044187854d3726968ad34a9074beab6e549838965ab2eaab4c20368ddbbece9b5989fdf3b344b752613370708')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  echo INSTALL_BASE=/usr > $srcdir/$pkgname-$pkgver/csrc/conf/local.mk
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir{/etc/profile.d,/usr/{include,lib,bin,share/{man/man1,doc/$pkgname/technical}}}
  make INSTALL_BASE=${pkgdir}/usr install
  export CCN_HOME=/usr
  echo "export CCN_HOME=/usr/lib/ccn" > ${pkgdir}/etc/profile.d/${pkgname}.sh
  chmod +x ${pkgdir}/etc/profile.d/${pkgname}.sh

  install -Dm644 doc/manpages/*.1 $pkgdir/usr/share/man/man1/
  install -Dm644 doc/technical/*.txt $pkgdir/usr/share/doc/ccnx/technical/
  install -Dm644 README NOTICES NEWS $pkgdir/usr/share/doc/ccnx/
  install -Dm644 "${srcdir}/ndnd.service" "${pkgdir}/usr/lib/systemd/system/ndnd.service"
} 
# vim:set ts=2 sw=2 et:
