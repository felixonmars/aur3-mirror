# Maintainer: nqn1976 @ gmail.com

pkgname=kdeplasma-applets-networkmanagement-l10n
pkgver=svn
pkgrel=2
pkgdesc="Localization for kdeplasma-applets-networkmanagement"
arch=('any')
url="http://www.kde.org/"
license=('GPL')
depends=('kdeplasma-applets-networkmanagement')
makedepends=('translate-toolkit')
source=()
md5sums=()

build() {
  _langs=("bs ca ca@valencia cs da de el en_GB eo es et fi fr ga gl hr hu it ja km lt lv mai ms nb nds nl nn pa pl pt pt_BR ro ru sk sl sv th tr ug uk wa zh_CN zh_TW")
  mkdir ${pkgdir}/{usr,usr/share,usr/share/locale}
  for i in ${_langs}
  do
   rm -f *.po
   wget http://websvn.kde.org/*checkout*/trunk/l10n-kde4/${i}/messages/extragear-base/libknetworkmanager.po
   wget http://websvn.kde.org/*checkout*/trunk/l10n-kde4/${i}/messages/extragear-base/plasma_applet_networkmanagement.po
   pocompile libknetworkmanager.po libknetworkmanager.mo
   pocompile plasma_applet_networkmanagement.po plasma_applet_networkmanagement.mo
   mkdir ${pkgdir}/usr/share/locale/{${i},${i}/LC_MESSAGES}
   mv *.mo ${pkgdir}/usr/share/locale/${i}/LC_MESSAGES
  done
}