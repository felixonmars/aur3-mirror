# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=zerobugs
pkgver=2012
_pkgver=67134
pkgrel=1
pkgdesc="A modular debugger for C/C++/D programming languages"
arch=('i686' 'x86_64')
# http://zerobugs.codeplex.com/
url="http://www.zero-bugs.com/"
license=('custom')
depends=('gtksourceviewmm2' 'gtkhtml' 'elfutils' 'boost-libs' 'desktop-file-utils')
makedepends=('boost')
options=(!buildflags !makeflags)
install=zerobugs.install
source=("zerobugs-$_pkgver.zip::http://download.codeplex.com/Download?ProjectName=zerobugs&DownloadId=328347&FileTime=129709229559870000&Build=18361" \
        python_includes.diff)
md5sums=('33db5c29cd92324dd42751681c43c6bd'
         '99b3ee460b17523839d7b73b6b3b6bdb')

build() {
  cd "$srcdir"

  # ugly for the python include path
  patch -Np1 < "$srcdir/python_includes.diff" || true

  ./build
}

package() {
  cd "$srcdir"
  echo "$pkgdir/opt/zerobugs" | ./build --install

  # install the desktop file and the icon manually
  install -D -m644 zero.desktop "$pkgdir/usr/share/applications/zero.desktop"

  # fix the paths
  sed -i "s|$pkgdir||g" "$pkgdir/opt/zerobugs/bin/zero"
  sed -i 's|/usr/local|/opt/zerobugs|' "$pkgdir/usr/share/applications/zero.desktop"

  # install license
  install -D -m644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE_1_0.txt"
  install -D -m644 LIBDWARFCOPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LIBDWARFCOPYRIGHT"
}

# vim:set ts=2 sw=2 et:
