# Contributer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: bwrsandman <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/hunspell-en-CA

pkgname='hunspell-en-ca'
pkgver=2015.02.15
pkgrel=1
pkgdesc="Canadian English hunspell dictionaries"
arch=('any')
url="http://wordlist.sourceforge.net/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-en')
source=(http://downloads.sourceforge.net/wordlist/hunspell-en_CA-$pkgver.zip)
sha256sums=('547d8096e30d045ed75421dee5c3659891f9257ad8403acc560c36fb377810c7')

package() {
  cd "$srcdir"
  install -dm755 $pkgdir/usr/share/hunspell
  install -m644 en_CA.dic en_CA.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 $pkgdir/usr/share/myspell/dicts
  ln -s /usr/share/hunspell/en_CA.dic $pkgdir/usr/share/myspell/dicts/
  ln -s /usr/share/hunspell/en_CA.aff $pkgdir/usr/share/myspell/dicts/
  
  # docs
  install -dm755 $pkgdir/usr/share/doc/$pkgname
  install -m644 README_en_CA.txt $pkgdir/usr/share/doc/$pkgname

  # licenses
  install -dm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 README_en_CA.txt $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
