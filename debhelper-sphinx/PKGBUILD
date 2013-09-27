# Contributor: Johannes Dewender  arch at JonyJD dot net
pkgname=debhelper-sphinx
_pkgname=sphinx
pkgver=1.1.3
pkgrel=2
_pkgrel=8
pkgdesc="debhelper scripts for Sphinx: sphinxdoc.pm"
arch=('any')
url="http://packages.debian.org/sid/sphinx-common"
license=('custom:MIT')
groups=()
depends=('debhelper')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://ftp.debian.org/debian/pool/main/s/$_pkgname/${_pkgname}_$pkgver+dfsg-$_pkgrel.debian.tar.gz)
md5sums=('42e1fb074646b1ef3e9bd7e3591db517')

package() {
  cd "$srcdir/debian"
  cd "dh-sphinxdoc"
  install -D dh_sphinxdoc "$pkgdir/usr/bin/dh_sphinxdoc"
  install -D -m 644 sphinxdoc.pm \
    "$pkgdir/usr/share/perl5/vendor_perl/Debian/Debhelper/Sequence/sphinxdoc.pm"
}

# vim:set ts=2 sw=2 et:

