# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Submitter:  thotypous
pkgname="samsutools"
pkgver="20080730"
pkgrel=5
pkgdesc="Tools for Samsung Mobile Phones."
url="http://samsutools.berlios.de/"
arch=('any')
license=('BSD')
depends=('python2>=2.4' 'python2-fuse>=0.2.1' 'ppp')
source=("http://downloads.sourceforge.net/project/samsutools.berlios/${pkgname}-${pkgver}-alpha.tar.gz")
md5sums=('fdea4809a3ffa2388c9a3a15a0c137f4')

package() {
  cd "$srcdir/$pkgname-$pkgver-alpha"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' samsung{fs,java}
  install -d "$pkgdir/usr/bin"
  install -m755 samsung{fs,java} "$pkgdir/usr/bin"
  install -m755 "conf/ppp.setup.example.linux" "$pkgdir/usr/bin/samsungjava-ppp"
  install -d "$pkgdir/usr/share/licenses/samsutools"
  install -m644 "LICENSE" "$pkgdir/usr/share/licenses/samsutools"
}

