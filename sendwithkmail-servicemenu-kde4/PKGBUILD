# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

_shortname=sendwithkmail
_name=Simple+Send+as+Attachment+with+Kmail
_name2=send-attach
pkgname="$_shortname-servicemenu-kde4"
_number=123121
pkgver=4.02
pkgrel=1
pkgdesc="Send one or more selected files from Konqueror or Dolphin as attachement with Kmail."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/$_name?content=$_number"
license=('GPL')
depends=('kdelibs' 'kdepim-kmail')
source=("http://kde-apps.org/CONTENT/content-files/$_number-$_name2.desktop")
md5sums=('1057fb23bd2f91773892f2d4043862d8')

build() {
   mkdir -p "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus"
   cp $srcdir/$_number-$_name2.desktop "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_shortname.desktop"
   chmod 644 "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_shortname.desktop"
}