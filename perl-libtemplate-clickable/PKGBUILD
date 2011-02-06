# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=perl-libtemplate-clickable
pkgver=0.06
pkgrel=1
pkgdesc="Template::Plugin::Clickable - Make URLs clickable in HTML"
arch=(i686)
url="http://packages.qa.debian.org/libt/libtemplate-plugin-clickable-perl.html"
license=('GPL')
depends=('perl-template-toolkit' 'perl-universal-require' 'perl-uri-find')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("http://www.cpan.org/modules/by-authors/id/M/MI/MIYAGAWA/Template-Plugin-Clickable-$pkgver.tar.gz")
noextract=()
md5sums=('6c6bc71bec639aa3c90de9b0cd6b5cf4')

build() {
  cd $startdir/src/Template-Plugin-Clickable-$pkgver
  /usr/bin/perl Makefile.PL
  make || return 1
  make DESTDIR=$startdir/pkg install
}

