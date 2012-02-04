#Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname=cinelerra-swtc
pkgver=0.5
pkgrel=1
pkgdesc="Extra Shape Wipe Transitions for Cinelerra"
arch=("any")
url="https://launchpad.net/~akirad"
license=('custom')
groups=(cinelerra)
depends=(cinelerra-cv)
source=("https://launchpad.net/~akirad/+archive/ppa/+files/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('56de7478e40d598e3234fadc7acf5abb')

package() {
  cd "${srcdir}"/$pkgname.orig/

  #install png
  install -d "${pkgdir}"/usr/lib/
  cp -r usr/lib "${pkgdir}"/usr

  #install licenses files
  install -d "${pkgdir}"/usr/share/licenses/$pkgname
  cp usr/share/doc/cinelerra-shapewipe-collections-akirad/licenses/*.txt "${pkgdir}"/usr/share/licenses/$pkgname
} 
