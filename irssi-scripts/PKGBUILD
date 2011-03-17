# Maintainer: Tj Vanderpoel <tj@rubyists.com>
pkgname=irssi-scripts
pkgver=1
pkgrel=1
pkgdesc="Collections of scripts for irssi from scripts.irssi.org"
arch=(i686 x86_64)
url="http://scripts.irssi.org"
license=('various')
depends=('irssi')
makedepends=('wget')
md5sums=() #generate with 'makepkg -g'

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  wget -r -l 1 -A pl http://scripts.irssi.org/scripts
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p tmp
  tmpfile=$(TMPDIR="$srcdir/$pkgname-$pkgver/tmp" mktemp)
  pacman -Ql irssi|awk '$2~/usr\/share\/irssi\/scripts\/.*\.pl/{print $2}' > $tmpfile
  install -D -d "$pkgdir/usr/share/irssi/scripts"
  cp -a scripts.irssi.org/scripts/*.pl "$pkgdir/usr/share/irssi/scripts"
  cd $pkgdir
  find . -name "*.pl"|grep -f $tmpfile|xargs -n1 rm
}

# vim:set ts=2 sw=2 et:
