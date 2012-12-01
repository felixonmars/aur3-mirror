# Maintainer: Mauro Santos <registo.mailling@gmail.com>

_pkgname='hyphen'
pkgname='hyphen-en-base'
pkgver=2.8.6
pkgrel=2
pkgdesc="US English hyphenation rules"
arch=('any')
url="http://hunspell.sf.net"
license=('GPL' 'LGPL' 'MPL')
optdepends=('hyphen: offers hyphenation library functions')
conflicts=('hyphen-en')
source=(http://downloads.sourceforge.net/hunspell/${_pkgname}-${pkgver}.tar.gz)
md5sums=('ee527b48ef1a7e95ee803a1f7c283c56')

build() {
  /bin/true
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -dm755 $pkgdir/usr/share/hyphen
  install -m644 hyph_en_US.dic $pkgdir/usr/share/hyphen

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  ln -s /usr/share/hyphen/hyph_en_US.dic $pkgdir/usr/share/myspell/dicts
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_hyph_en_US.txt $pkgdir/usr/share/doc/$pkgname
  
  # licences
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -m644 README_hyph_en_US.txt $pkgdir/usr/share/licenses/$pkgname
}
