# Contributor: Ivan Kuraj <kaptoxic [at] yahoo [dot] com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>

pkgname=hypermail
pkgver=2.3.0
pkgrel=1
pkgdesc="A free program to convert email from Unix mbox format to html"
arch=('i686' 'x86_64')
url="http://hypermail-project.org/"
license=('GPL')
depends=('gdbm' 'pcre')
source=('repo::git+https://github.com/kaptoxic/hypermail.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/repo"
  find . -type f -iname "configure" -exec sed -i 's/\/lib\/cpp/cpp/g' {} +
  ./configure --without-htmldir --prefix=/usr
  make
}

package() {
  cd "$srcdir/repo"
  make bindir="${pkgdir}/usr/bin" \
       mandir="${pkgdir}/usr/share/man" install
}
