# Maintainer: alx78 <alxg78@gmail.com>
# Contributor: alx78 <alxg78@gmail.com>

pkgname=gnupgshell
_pkgname=wxGnuPGShell
pkgver=1.0.0
pkgrel=1
pkgdesc="A graphical user interface for the GnuPG"
arch=('i686' 'x86_64')
url="http://www.tech-faq.com/gnupg-shell.html"
license=('GPL')
groups=()
depends=('wxgtk' 'gnupg')
makedepends=('wxgtk')
source=(http://www.tech-faq.com/gnupg-shell/$pkgname-$pkgver.tar.gz)
md5sums=('c350b3580aaeb141083e89efe5d47459')

build() {
  cd $srcdir/$pkgname/build/
  make
}

package() {
  msg "Starting make..."

  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications/

  cd $srcdir/$pkgname/build/
  install -m 755  $srcdir/$pkgname/bin/$_pkgname $pkgdir/usr/share/$pkgname/
  ln -s /usr/share/$pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
  mkdir $pkgdir/usr/share/$pkgname/art/ && chmod 755 $pkgdir/usr/share/$pkgname/art/
  install -m 644 $srcdir/$pkgname/bin/art/*.ico $pkgdir/usr/share/$pkgname/art/
  install -Dm 644 $srcdir/../gnupgshell.desktop $pkgdir/usr/share/applications/gnupgshell.desktop
}
