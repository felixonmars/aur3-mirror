# Maintainer:   Adlai Chandrasekhar <munchking at gmail dot com>
# Creator:      Leslie P. Polzer <polzer at gnu dot org>
# Contributor:  Fernando L. Canizo <conan at lugmen dot org dot ar>
pkgname=ccl-bin
pkgver=1.10
pkgrel=1
pkgdesc="x86 and x86-64 binary versions of Clozure Common Lisp"
url="http://ccl.clozure.com/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=()
provides=('common-lisp' 'cl-asdf')
source=("ftp://ftp.clozure.com/pub/release/$pkgver/ccl-$pkgver-linuxx86.tar.gz" \
        ccl.sh)
md5sums=('d1ba56cd638ff57645446e5220969c8e'
         '1d244ef188c6bb9a26582c9298bb6143')
sha1sums=('53e58476d78027915fe2f04dbb387eeba67e453d'
          'a4b4004532d703b0274e1fe3b411572e3d7e7fe3')

package() {
  cd $srcdir

  BINDIR="$pkgdir/usr/bin"
  PROFILEDIR="$pkgdir/etc/profile.d"
  DATADIR="$pkgdir/usr/share/"
  LICENSEDIR="$pkgdir/usr/share/licenses/ccl-bin/"

  # install datadir
  mkdir -p "$DATADIR"
  cp -av ccl/ "$DATADIR"
  find "$DATADIR" -name .svn -print0 | xargs -0 rm -rf # remove SVN dirs

  # install env profile
  mkdir -p "$PROFILEDIR"
  cp "$srcdir/ccl.sh" "$PROFILEDIR"

  # install frontend script
  mkdir -p "$BINDIR"
  cp -av "$srcdir/ccl/scripts/ccl"{,64} "$BINDIR"
  sed -i "s#CCL_DEFAULT_DIRECTORY=/usr/local/src/ccl#$(cat "$PROFILEDIR/ccl.sh")#g" "$BINDIR/ccl"{,64}

  # install license
  mkdir -p "$LICENSEDIR"
  install -m644 "$srcdir/ccl/doc/LICENSE" "$LICENSEDIR"
}
