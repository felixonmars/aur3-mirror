# Maintainer: Domenico Shura <shura1991@gmail.com>
pkgname=bertos
pkgver=2.7.0
pkgrel=2
epoch=
pkgdesc="A real time open source operating system designed for the rapid development of embedded software."
arch=(x86 x86_64)
url="http://www.bertos.org/"
license=('GPL')
groups=()
depends=(qt4 python2 python2-pyqt make bash which)
makedepends=(findutils sed patch doxygen)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !emptydirs)
install='bertos.install'
changelog=
source=("http://download.${pkgname}.com/release/${pkgname}.tar.bz2"
        'qt-version.patch'
        'bertos.install')
noextract=()
md5sums=('96d120ae4378186b7e9d85e73514b512'
         'c20ed96bacfc5c820eb930cb90816211'
         'f47b199c6c08eeb31cef2e8dd3072378')

build() {
	cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/qt-version.patch"
  find -iname \*.py -exec sed -i -e 's/^#!\/usr\/bin\/env python$/#!\/usr\/bin\/env python2.7/g' '{}' \;

  doxygen Doxyfile-offline

  rm -f Doxyfile* Makefile*

  cat <<'EOF' > py_compile
#!/usr/bin/env python2.7

import sys
import py_compile
py_compile.compile(sys.argv[1])
EOF
  chmod 0777 py_compile
  find -iname \*.py -exec ./py_compile '{}' \;
  rm -f py_compile
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
	cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"
  cat <<'EOF' > "$pkgdir/usr/bin/bertos"
#!/bin/sh

PATH="/usr/lib/qt4/bin:$PATH"
export PATH

exec python2.7 /opt/bertos/wizard/bertos.py "$@"
EOF
  chmod 0755 "$pkgdir/usr/bin/bertos"
  cat <<'EOF' > "$pkgdir/usr/bin/bertos-doc"
#!/bin/sh

if which xdg-open >/dev/null 2>/dev/null; then
  exec xdg-open /opt/bertos/doc/offline-reference/html/index.html
elif [[ "x$BROWSER" != "x" ]]; then
  exec "$BROWSER" /opt/bertos/doc/offline-reference/html/index.html
else
  echo "Open /opt/bertos/doc/offline-reference/html/index.html with your web browser."
fi
EOF
  chmod 0755 "$pkgdir/usr/bin/bertos-doc"
}
