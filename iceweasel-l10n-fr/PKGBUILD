# Contributor: Fabien Wang <fabienwang@eliteheberg.fr>
# Maintainer:  Fabien Wang <fabienwang@eliteheberg.fr>

_lang=fr
_debver=29.0.1
_debrel=2
_debrepo=http://ftp.debian.org/debian/pool/main/i/

pkgname=iceweasel-l10n-fr
pkgver=$_debver.deb$_debrel
pkgrel=1
pkgdesc="French Language Pack for Iceweasel"
arch=('any')
url="http://www.mozilla.com/"
license=('MPL' 'GPL' 'LGPL')
depends=("iceweasel>=$_debver") 
source=("${_debrepo}/iceweasel/iceweasel-l10n-${_lang}_${_debver}-${_debrel}_all.deb")

package() {
  msg2 "Installing Language Pack..."
  tar Jxvf "${srcdir}"/data.tar.xz -C "${pkgdir}"/
  msg2 "Cleaning unwanted files..."
  rm -rv "${pkgdir}"/usr/share/
}



# vim:set ts=2 sw=2 et:

md5sums=('f5fb8323242af74905a252b2aedfb8ac')
