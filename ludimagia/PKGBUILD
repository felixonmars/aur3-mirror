# Contributor:  <mathieui@mathieui.net>
pkgname=ludimagia
pkgver="0.5.1"
pkgrel=4
pkgdesc="Ludimagia is a free MagicWorkStation clone"
arch="any"
url="http://codingteam.net/project/ludimagia"
license=('WTFPL')
depends=('python-pygame' 'pgu' 'xmpppy' 'python-dnspython')
source=("http://codingteam.net/project/ludimagia/download/file/$pkgname-$pkgver.tar.bz2")
md5sums=('5829042e62238e7ff7a88f1214d4f80a')

build() {
  mkdir -p "${pkgdir}/usr/share/ludimagia/"
  cd "$srcdir"
  cp -R ./$pkgname-$pkgver/* ${pkgdir}/usr/share/ludimagia/
  mkdir -p ${pkgdir}/usr/bin/
  echo -e '#!/bin/bash\ncd /usr/share/ludimagia/\npython ludimagia.py' > ${pkgdir}/usr/bin/ludimagia
  echo -e '#!/bin/bash\ncd /usr/share/ludimagia/\npython deckcreator.py' > ${pkgdir}/usr/bin/ludimagia-deckcreator
  chmod +x ${pkgdir}/usr/bin/ludimagia
  chmod +x ${pkgdir}/usr/bin/ludimagia-deckcreator
}
