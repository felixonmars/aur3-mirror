# Contributor: Anonymous <nomad@ag.ru>
pkgname=sosator
pkgver=0.3b
pkgrel=1
pkgdesc="Analyzes threads and finds sosnoovsheeh (special for /s/)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sosator/"
license=('unknown')
depends=('qt')
install=
source=(http://sosator.googlecode.com/files/$pkgname-$pkgver.tar.gz sosator.desktop)
md5sums=('e2f728d77dcf07f98969ad8dfeddadd3' '23aef37c448c68ced60e40bfabc6e6f7') 
build() {
  cd "$srcdir/$pkgname-0.3" || return 1
  qmake || return 1
  make || return 1
   install -d "$pkgdir/usr/bin"
   install -dm 755 "$pkgdir/opt/$pkgname" || return 1
   cp -R * "$pkgdir/opt/$pkgname/" || return 1
   ln -s $pkgdir/opt/$pkgname/Sosator $pkgdir/usr/bin/$pkgname
   install -Dm 644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop || return 1
}
# vim:set ts=2 sw=2 et:
