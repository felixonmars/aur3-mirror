# Maintainer: Antonio Bonifati <http://ninuzzo.github.com/contact.html>
# Nice to have: expat, fortune-mod, tcllib, tidyhtml
pkgname=tpad
pkgver=1.3
pkgrel=6
pkgdesc="Windows XP (TM) enhanced Notepad clone written in Tcl/Tk"
install=tpad.install
arch=('i686' 'x86_64')
url="http://tclpad.sourceforge.net"
license=('GPL')
depends=('tk')
optdepends=('expat: xmlwf plugin'
  'fortune-mod: display fortune tip at startup' 
  'tidyhtml: HTML Tidy plugin (you also need tcllib)')
backup=('etc/tpad.conf')
source=(http://downloads.sourceforge.net/tclpad/$pkgname-$pkgver.tar.gz?download $pkgname-$pkgver.patch)

md5sums=('8ddb7a2511ed98c71aa43a19b284efd8' 'c537271c14d68d63685c453e7770efc5')

build() {
  cd "$srcdir"

  patch -p1 < $pkgname-$pkgver.patch
}

package() {
  cd "$srcdir"

  install -d $pkgdir/{etc,usr/{bin,lib/tpad$pkgver,man/man1,share/tpad}}
  install bin/tpad $pkgdir/usr/bin
  install -m 644 etc/tpad.conf $pkgdir/etc
  install -m 644 lib/tpad$pkgver/*.tcl $pkgdir/usr/lib/tpad$pkgver
  install -m 644 man/man1/tpad.1 $pkgdir/usr/man/man1
  install -m 644 share/tpad/* $pkgdir/usr/share/tpad
  cd $pkgdir/usr/bin && ln -s tpad tview
  cd $pkgdir/usr/man/man1 && ln -s tpad.1 tview.1
}
