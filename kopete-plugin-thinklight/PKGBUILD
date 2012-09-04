# Contributor: Patrick Hanft <patrick@phlogfile.de>
# Note: This is my very first package, so comments for improvement are welcome!

pkgname=kopete-plugin-thinklight
_pkgname=kopete-thinklight
pkgver=0.50
pkgrel=3
pkgdesc="This kopete plugin lets a Thinkpad's light flash on every incoming message"
arch=(i686 x86_64)
url="http://www.kde-apps.org/content/show.php?content=100537"
license=('GPL')
groups=
provides=
depends=('kdenetwork-kopete')
makedepends=('cmake')
install='kopete-plugin-thinklight.install'
source=(http://www.kde-apps.org/CONTENT/content-files/100537-$_pkgname-$pkgver.tar.gz)
md5sums=('79d4fd7936be2199c506f1e5877f95ad')

build() {
  cd $srcdir/$_pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make || return 1
  make DESTDIR=$startdir/pkg install || return 2
}
