# Maintainer: Baurzhan Muftakhidinov <baurthefirst@gmail.com> 

pkgname=hunspell-kk
pkgver=0.1
pkgrel=1
pkgdesc="A kazakh dictionary for Hunspell"
arch=('any')
url="http://hunspell.sourceforge.net/"
license=('GPL' 'LGPL' 'MPL')
depends=('hunspell')
source=('http://extensions.services.openoffice.org/e-files/1172/12/dict-kk.oxt')
md5sums=('5853936d6ff926015256777f0477bfa3')

build() {
  cd "$srcdir"

  install -D -m644 kk_KZ.dic "$pkgdir/usr/share/myspell/kk_KZ.dic" || return 1
  install -D -m644 kk_KZ.aff "$pkgdir/usr/share/myspell/kk_KZ.aff" || return 1
}
