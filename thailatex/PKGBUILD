# Maintainer: Smith Dhumbumroong <zodmaner at gmail dot com>

pkgname=thailatex
pkgver=0.4.7
pkgrel=1
pkgdesc="A package which enables typesetting Thai language with LaTeX's standard document classes"
arch=('any')
url="http://linux.thai.net/projects/thailatex"
license=('LPPL')
depends=('texlive-core' 'swath' 'sh' 'ttf-latex-tlwg')
makedepends=('texlive-bin')
groups=('texlive-lang')
install=thailatex.install
source=(ftp://linux.thai.net/pub/ThaiLinux/software/thailatex/$pkgname-$pkgver.tar.gz)
md5sums=('189a396bf4f720c146809a857a8457b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-texmfdir=/usr/share/texmf-dist || return 1
  make || return 1
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
