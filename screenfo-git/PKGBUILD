# Maintainer: Magnus Woldrich <trapd00r@trapd00r.se>
pkgname=screenfo-git
pkgver=20131211
pkgrel=1
pkgdesc="screenshot information tool for nerds"
arch=('any')
url="http://github.com/trapd00r/screenfo"
license=('GPLv2')
depends=('scrot' 'perl-term-extendedcolor')
makedepends=('git')
backup=(etc/screenfo.conf)
source=('git+https://github.com/trapd00r/screenfo.git')
md5sums=('SKIP')
#install="screenfo.install"
_gitname="screenfo"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/screenfo"
  cp -R "$srcdir/$_gitname/ascii/" "$pkgdir/usr/share/screenfo/"
  install -Dm664 "$srcdir/$_gitname/screenfo.conf" "$pkgdir/etc/screenfo.conf"
}
