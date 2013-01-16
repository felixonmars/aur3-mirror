# Maintainer: TDY <tdy@archlinux.info>

pkgname=etpan
pkgver=0.7.1
pkgrel=2
pkgdesc="A console mail user agent based on libetpan"
arch=('i686' 'x86_64')
url="http://etpan.org/other.html"
license=('BSD')
depends=('libetpan>=0.42' 'libldap')
makedepends=('bison')
optdepends=('bogofilter: SPAM management'
            'gnupg:      PGP signing and encryption'
            'openssl:    S/MIME signing and encryption'
            'perl:       vtree generator script')
source=(http://downloads.sourceforge.net/lib$pkgname/$pkgname-ng-$pkgver.tar.gz)
md5sums=('c4ab9a5471d84be930809950bae9fd69')

build() {
  cd "$srcdir/$pkgname-ng-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-ng-$pkgver"
  make prefix="$pkgdir/usr" install
  install -cm755 contrib/$pkgname-make-vtree.pl "$pkgdir/usr/bin/"
  install -Dm644 contrib/vim-syntax/etpancfg.vim "$pkgdir/usr/share/vim/syntax/etpancfg.vim"
  install -Dm644 doc/CONFIG "$pkgdir/usr/share/doc/$pkgname/CONFIG"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
