# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <hollunder at gmx dot at>

pkgname=ll-scope
pkgver=0.2.1
pkgrel=2
pkgdesc="DSSI oscilloscope plugin."
url="http://www.student.nada.kth.se/~d00-llu/music_dssi.php?lang=en"
arch=('i686' 'x86_64')
license=('GPL')
depends=('liblo' 'libglademm' 'dssi')
source=("${url/music*/}plugins/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('2f3350423df5349528bcf6e1ef503ec0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # adding -fPIC for x86_64
  export CFLAGS="-fPIC"

  # add DESTDIR and remove local referencies to Makefile
  sed -i "s| \(\$(INS\)| \$(DESTDIR)/\1|g;s|/local||" Makefile

  # fix sigc
  sed -i "s| \(signal<void\)| sigc::\1|g" *.hpp

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # install ll-scope executable script
  install -d "$pkgdir/usr/bin"
  cat << EOF >> "$pkgdir/usr/bin/ll-scope"
#!/bin/bash

export DSSI_PATH=/usr/lib/dssi
exec jack-dssi-host $pkgname.so
EOF

  chmod +x "$pkgdir/usr/bin/ll-scope"
}
