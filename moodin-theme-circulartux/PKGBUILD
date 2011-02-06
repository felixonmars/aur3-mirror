pkgname=moodin-theme-circulartux
pkgver=0.2
pkgrel=1
pkgdesc="KDE splash screen for Moodin Engine"
url="http://www.kde-look.org/content/show.php/CircularTUX?content=26128"
license="GPL"
depends=('ksplash-engine-moodin')
source=(http://www.biodesign.com.ar/blog/wp-content/files/splash/CircularTUX.tar.gz)
md5sums=('87ac13239eadb9588e4b2e2761168635')
arch=(i686)
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
  cp -r CircularTUX $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
}
