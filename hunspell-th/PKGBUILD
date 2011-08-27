# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=hunspell-th
pkgver=0.3
pkgrel=1
pkgdesc="Thai dictionary for Hunspell"
arch=('any')
url="http://wiki.services.openoffice.org/wiki/Dictionaries#Thai_.28Thailand.29"
license=('LGPL')
depends=('hunspell')
source=(http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/th_TH.zip)
md5sums=('0d71a7294205979c318caf8633f1a1ab')

build() {
  cd "$srcdir"
  
  install -Dm644 th_TH.dic "$pkgdir/usr/share/myspell/th_TH.dic"
  install -Dm644 th_TH.aff "$pkgdir/usr/share/myspell/th_TH.aff"
}

# vim:set ts=2 sw=2 et:
