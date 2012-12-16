# Maintainer: Romain Schmitz <slopjong at archlinux dot lu>

pkgname=obfsh
pkgver=1.2
pkgrel=1
pkgdesc="Obfuscate shell scripts."
arch=('i686' 'x86_64')
url="http://www.comp.eonworks.com/scripts/obfuscate_shell_script-20011012.html"
license=('GPL')
makedepends=('help2man')
source=('http://www.comp.eonworks.com/scripts/obfsh.gz')
md5sums=('40e2db818bbd4d73a18aafe18582c1b2')

build() {
  chmod 755 "$srcdir/$pkgname"
  
  # this creates a badly formatted man page, kindof man page in a man page but
  # an incorrect formatted man page is better than none, feel free to fix it
  help2man --help-option=-m --no-discard-stderr "$srcdir/$pkgname" > "$pkgname".1
}
 
package() {
  mkdir -p "$pkgdir"/usr/{bin,share/man/man1}
  mv "$srcdir/$pkgname" "$pkgdir"/usr/bin
  mv "$srcdir/$pkgname".1 "$pkgdir"/usr/share/man/man1
}