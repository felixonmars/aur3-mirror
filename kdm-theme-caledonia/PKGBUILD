# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Ricky <riccardo_aur at libero dot it>
# Contributor: unikum <unikum.pm at gmail dot com>

pkgname=kdm-theme-caledonia
_themename=Caledonia
pkgver=1.3
pkgrel=1
pkgdesc="The official KDM theme for Caledonia"
arch=('any')
url="http://sourceforge.net/projects/caledonia/files/Caledonia%20KDM/"
license=('CCPL')
depends=('kdebase-workspace')
conflicts=('caledonia-bundle')
source=("http://downloads.sourceforge.net/project/caledonia/Caledonia%20KDM/$_themename-KDM-$pkgver.tar.gz")
sha512sums=('d75505ae032d66491ab0fab1f8a1355e879aae9b2226cdffec0af3f04b86da4b88bb2fb2a96827866d9fa8ec45bcedbb35b3392b55a9ddb95ea52c27791ab1e4')

package() {
  install -d $pkgdir/usr/share/apps/kdm/themes/
  mv $srcdir/$_themename-KDM $pkgdir/usr/share/apps/kdm/themes/
}