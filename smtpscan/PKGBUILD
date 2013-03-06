# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mauro Andreolini <mauro.andreolini@unimore.it>
pkgname=smtpscan
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="An SMTP scanner"
arch=('any')
url="http://packetstormsecurity.com/files/31102/smtpscan-0.5.tar.gz.html"
license=('GPL2')
groups=()
depends=(perl perl-net-dns)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://dl.packetstormsecurity.net/UNIX/scanners/smtpscan-0.5.tar.gz")
noextract=()
md5sums=('375e1a64347da0b39994910bcdd213db')

package() {
  VERSION="0.5"

  cd "$srcdir/$pkgname"

  perl -i -pe "s{(\\\$LOCAL_SHARE\s+=\s+)'/usr/local/share';}{\$1'/usr/share';};" "$srcdir"/smtpscan/src/smtpscan

  install -D -m 755 "$srcdir"/smtpscan/src/smtpscan "$pkgdir"/usr/bin/smtpscan
  install -D -m 644 "$srcdir"/smtpscan/src/fingerprints "$pkgdir"/usr/share/smtpscan/fingerprints
  install -D -m 644 "$srcdir"/smtpscan/src/tests "$pkgdir"/usr/share/smtpscan/tests
  install -D -m 644 "$srcdir"/smtpscan/docs/man/smtpscan.1 "$pkgdir"/usr/share/man/man1/smtpscan.1

}

# vim:set ts=2 sw=2 et:
