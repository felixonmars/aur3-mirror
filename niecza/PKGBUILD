# Maintainer : Konrad Borowski <glitchmr@myopera.com>
pkgname=niecza
pkgver=24
pkgrel=1
pkgdesc='Perl 6 implementation focusing on optimization'
arch=any
url='https://github.com/sorear/niecza'
license='Artistic2.0'
depends=('mono>=2.6.4'
'bash')
# wget and unzip appear to be needed
makedepends=('wget'
'unzip'
'perl')
source="https://github.com/sorear/niecza/archive/v$pkgver.tar.gz"
md5sums='b9943e86d254e5be98b427238ee5661d'

build() {
  cd "$srcdir/niecza-$pkgver"
  # Don't get version using git, as we don't have git.
  perl -i -ne'print unless /\@git/' Makefile
  # Ugly hack just for niecza --version work even without git.
  echo "v$pkgver" > VERSION
  # No debugging and optimize. Also, save to /usr
  make CSC='gmcs -o' PREFIX='/usr'
}
package() {
  cd "$srcdir/niecza-$pkgver"
  # But when installing, lie about location
  make PREFIX="$pkgdir/usr" install
  # Executable (but nothing else) seem to depend on $pkgdir. This
  # is a hack to fix it.
  echo '#!/bin/bash' > "$pkgdir/usr/bin/niecza"
  echo 'exec mono /usr/lib/niecza/bin/MAIN.exe "$@"' >> "$pkgdir/usr/bin/niecza"
}
