# Maintainer: Jojo <tisseron.joffrey@aliceadsl.fr>
pkgname=ginkgo
pkgver=0.32
pkgrel=2
pkgdesc='A navigator for Nepomuk, the KDE semantic toolkit.'
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/Ginkgo?content=125636'
license=('GPL')
depends=('kdebindings-python>4.4' 'python2-mako')
makedepends=('python2')
source=("http://svn.mandriva.com/svn/packages/cooker/ginkgo/current/SOURCES/$pkgname-$pkgver.tar.bz2"
	'ginkgo.desktop')
md5sums=('40ef59184eae5d3653c081cfeab28ec7'
	 '568fbb3a9041eea38784d7d7ff68048f')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ || return 1
}

package() {
  mkdir -p $pkgdir/usr/share/applications/kde4/
  cp $startdir/ginkgo.desktop $pkgdir/usr/share/applications/kde4/ginkgo.desktop
} 
