# Contributor:: Guillermo Garcia <ahioros@NO-SPAM.gmail.com>
#

pkgname="plymouth-theme-paw"
pkgver=0.1
_FEDORA_RELEASE=0.1-2.fc12
pkgrel=1
url="http://gnome-look.org/content/show.php/Paw+plymouth+theme+for+Fedora?content=118865"
pkgdesc="Simple bootsplash for Fedora featuring the Gnome logo"
arch=('i686' 'x86_64')
license=('GPL')
depends=('')
makedepends=('rpmextract')
provides=("")
conflicts=('')
options=('')
source=("http://appstyle.googlecode.com/files/${pkgname}-${_FEDORA_RELEASE}.noarch.rpm")
md5sums=('b18eca2ac5ef5c2fcc871975097f2387')

build() {
  msg "Nothing to compile for $pkgname"

  cd  $pkgdir
  rpmextract.sh $srcdir/${pkgname}-${_FEDORA_RELEASE}.noarch.rpm
}
