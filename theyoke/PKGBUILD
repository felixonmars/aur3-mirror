# Contributor: ryooichi <ryooichi+arch AT gmail DOT com>
pkgname=theyoke
pkgver=1.23
pkgrel=5
pkgdesc="ultra-simple, polite RSS aggregrator for the command line"
arch=('i686' 'x86_64')
url="http://www.mackers.com/projects/theyoke/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl' 'perl-libwww' 'perl-html-parser' 'perl-uri' 'perl-xml-rss' 'perl-digest-md5' 'perl-term-size' 'perl-html-format')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
#install=
source=('http://www.mackers.com/projects/theyoke/theyoke.txt' 'theyoke.patch')
noextract=()
md5sums=('ed9bfa9966e959cd754496184b7e4516'
         'abac3e0761dffd793312fbb2b72d3e46')
build() {
  patch -p0 <theyoke.patch
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/theyoke.txt $pkgdir/usr/bin/theyoke
}
# vim:syntax=sh
