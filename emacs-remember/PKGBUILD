# Contributor: fl4ppie at gmail dot com
# Contributor: bender02 at gmx dot com
pkgname=emacs-remember
pkgver=2.0
pkgrel=2
pkgdesc="RememberMode: a mode for quickly jotting down things to remember"
url="http://www.emacswiki.org/cgi-bin/wiki/RememberMode"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-muse' 'emacs-planner')
install=$pkgname.install
source=(http://download.gna.org/remember-el/remember-$pkgver.tar.gz)
md5sums=('7b5fac511a3546d417ec09a72ead49e3')

build() {
  cd $srcdir/remember-$pkgver
  make || return 1
  make INFODIR=$pkgdir/usr/share/info PREFIX=$pkgdir/usr install || return 1
  [ -e $pkgdir/usr/share/info/dir ] && rm $pkgdir/usr/share/info/dir || return 1
}
