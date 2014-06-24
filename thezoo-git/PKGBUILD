# Maintainer: Bar Hofesh <Bar Hofesh at Linux dot com>

pkgname=thezoo-git
pkgver=73e8758
pkgrel=1
pkgdesc='a project created to make the possibility of malware analysis open and available to the public'
arch=('any')
url=('https://github.com/ytisf/theZoo')
license=('GPLv3')
depends=('python2')
provides=('thezoo')
makedepends=('git')
options=('!strip')
source=('git://github.com/ytisf/theZoo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/theZoo"
  git describe --always
}

package() {
  cd "$srcdir/theZoo"

  # Base directories.
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/opt/theZoo"

  cp -R --no-preserve=ownership * "$pkgdir/opt/theZoo"

  cat > "$pkgdir/usr/bin/thezoo" << EOF
#!/bin/bash
cd /opt/theZoo
python2 theZoo.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/thezoo"
}

