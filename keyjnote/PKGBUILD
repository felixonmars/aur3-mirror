# Contributor: daniel g. siegel <dgsiegel@gmail.com>

pkgname="keyjnote"
pkgver=0.10.2
pkgrel=1
license="GPL"
arch=('i686' 'x86_64')
pkgdesc="KeyJnote is a program that displays presentation slides with the \"wow\"-effect"
depends=('python' 'python-opengl' 'python-pygame' 'pil' 'poppler')
source=(http://dl.sourceforge.net/$pkgname/KeyJnote-$pkgver.tar.gz)
url="http://keyjnote.sourceforge.net"
md5sums=('b6bd8a552b6949ad2041deb9e126c6ad')

build() {
  cd $startdir/src/KeyJnote-$pkgver
  install -D -m755 keyjnote.py ${startdir}/pkg/usr/bin/keyjnote

  install -D -m644 keyjnote.html ${startdir}/pkg/usr/share/$pkgname/doc/keyjnote.html
  install -D -m644 demo.pdf ${startdir}/pkg/usr/share/$pkgname/doc/demo.pdf
}
