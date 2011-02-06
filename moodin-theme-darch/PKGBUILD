pkgname=moodin-theme-darch
pkgver=0.2
pkgrel=3
pkgdesc="KDE splash screen for Moodin Engine"
arch=(i686)
url="http://www.kde-look.org/content/show.php?content=38200"
license="GPL"
depends=('ksplash-engine-moodin')
source=(http://stimpyrama.org/arch/dArch_KDESplash.tar.gz)
md5sums=('a39228c8365e35a302683df2c07f0327')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
  mv dArchKDE darch
  cp -r darch $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
}
