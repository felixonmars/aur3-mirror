# Maintainer: Maximilian Stein <maxarchpkgbuild@hmamail.com>
# Contributor: Ramses de Norre <ramzi@zoenk.be>

pkgname=mathtex
pkgver=1.05
pkgrel=1
pkgdesc="Cgi program that lets you easily embed LaTeX math in your own html pages, blogs, wikis, etc"
arch=('i686' 'x86_64')
url="http://www.forkosh.com/mathtex.html"
license=('GPL3')
depends=('texlive-bin')
source=(http://www.forkosh.com/mathtex.zip)
sha256sums=('a90a59b0cf5eb186ac493ed78d677ab6776c791bcc6471ba16ca9ba671ca4c47')

build() {
  cd $srcdir
  gcc mathtex.c $CFLAGS -DLATEX=\"$(which latex)\" -DDVIPNG=\"$(which dvipng)\" -o mathtex
}

package() {
  install -D $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -D $srcdir/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
