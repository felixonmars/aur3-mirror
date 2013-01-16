# Maintainer: TDY <tdy@archlinux.info>

pkgname=x10
pkgver=2.3.0
pkgrel=1
pkgdesc="A new programming language from IBM with a focus on parallel, high-end computing"
arch=('i686' 'x86_64')
url="http://x10-lang.org/"
license=('EPL')
depends=('java-environment')
makedepends=('apache-ant')
options=('!emptydirs' '!strip')
install=x10.install
source=(http://downloads.sourceforge.net/project/x10/x10/$pkgver/x10-$pkgver-src.tar.bz2
        x10.profile)
md5sums=('de4da48ce82e994fc2ebd55133177c7a'
         '40392c992ca5ba3858dd503d529d7124')

build() {
  cd "$srcdir/x10.dist"
  ant squeakyclean dist \
    -DNO_CHECKS=true \
    -Doptimize=true
}

package() {
  cd "$srcdir/x10.dist"
  install -dm755 "$pkgdir/opt/x10/bin/"
  cp -a bin etc include lib samples stdlib tools "$pkgdir/opt/x10/"
  install -Dm644 ../x10.profile "$pkgdir/etc/profile.d/x10.sh"
  rm -f "$pkgdir"/opt/x10/bin/*.in

  msg2 "Enforcing permissions..."
  find "$pkgdir/opt/x10/" -type f -exec chmod 644 '{}' \;
  chmod 755 $(find "$pkgdir/opt/x10" -exec file '{}' \;|grep -E 'ELF|directory'|cut -d: -f1)
  chmod 755 "$pkgdir"/opt/x10/bin/*
}

# vim:set ts=2 sw=2 et:
