# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

_shortname=sendwithkmail
_name2=send-attach
pkgname="kdeservicemenu-$_shortname"
_number=123121
pkgver=4.0.5
pkgrel=1
pkgdesc="Send selected files from Konqueror or Dolphin as attachement with Kmail."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Simple+Send+as+Attachment+with+Kmail?content=$_number"
license=('GPL')
depends=('kdelibs' 'kdepim-kmail')
conflicts=('sendwithkmail-servicemenu-kde4')
replaces=('sendwithkmail-servicemenu-kde4')
source=("https://github.com/indymike/Simple-Send-as-Attachment-with-Kmail/blob/master/$_name2.desktop")
md5sums=('3b1e445625d4426117534c2afb45dc9a')

package() {
   mkdir -p "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus"
   cp $srcdir/$_name2.desktop "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_shortname.desktop"
   chmod 644 "$pkgdir/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/$_shortname.desktop"
}
