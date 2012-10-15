# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

_shortname=sendwithkmail
_name2=send-attach
pkgname=kde-servicemenus-sendwithkmail
_number=123121
pkgver=4.0.5
pkgrel=1
pkgdesc="Send selected files from Konqueror or Dolphin as attachement with Kmail."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Simple+Send+as+Attachment+with+Kmail?content=$_number"
license=('GPL')
depends=('kdelibs' 'kdepim-kmail')
conflicts=('kdeservicemenu-sendwithkmail')
replaces=('kdeservicemenu-sendwithkmail')
source=("https://github.com/indymike/Simple-Send-as-Attachment-with-Kmail/tarball/master")
md5sums=('d49b74062c4ce1f11a2c7c2c426503bc')

build() {
  /bin/true
}

package() {
  install -Dm644 ${srcdir}/indymike-Simple-Send-as-Attachment-with-Kmail-a6977a0/$_name2.desktop \
    "${pkgdir}/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/${_shortname}.desktop"
}
