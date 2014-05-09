# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=ccnx
pkgname=$_pkgname-git
pkgver=11105.645d19c
pkgrel=5
pkgdesc="an experimental implementation of content-centric networking"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.ccnx.org"
license=('GPL2' 'LGPL2.1')
depends=('openssl' 'expat' 'libpcap' 'libxml2' 'apache-ant' 'java-environment' 'java-runtime' 'athena-jot')
makedepends=('git')
provides=("$_pkgname" 'ndn')
conflicts=($_pkgname)
options=('zipman')
source=("${pkgname}::git+https://github.com/ProjectCCNx/${_pkgname}.git"
        'ndnd.service')
md5sums=('SKIP'
         '4f78713ff3328078604249027da2bbbe')

pkgver() {
  cd $srcdir/$pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/$pkgname"
  pwd
  echo INSTALL_BASE=/usr > $srcdir/ccnx/csrc/conf/local.mk
}

build() {
  cd "$srcdir/$pkgname"
  sed -i 's/\r//' configure
  /usr/bin/sh ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir{/etc/profile.d,/usr/{include,lib,bin,share/{man/man1,doc/ccnx/technical}}}
  make INSTALL_BASE=${pkgdir}/usr install
  export CCN_HOME=/usr
  echo "export CCN_HOME=/usr/lib" > ${pkgdir}/etc/profile.d/ccnx.sh
  chmod +x ${pkgdir}/etc/profile.d/ccnx.sh

  install -Dm644 doc/manpages/*.1 $pkgdir/usr/share/man/man1/
  install -Dm644 doc/technical/*.txt $pkgdir/usr/share/doc/ccnx/technical/
  install -Dm644 README NOTICES NEWS $pkgdir/usr/share/doc/ccnx/
  install -Dm644 "${srcdir}/ndnd.service" "${pkgdir}/usr/lib/systemd/system/ndnd.service"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
} 
# vim:set ts=2 sw=2 et:
