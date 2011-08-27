pkgname=moodin-theme-lovekde
pkgver=1.0
pkgrel=3
pkgdesc="KDE splash screen for Moodin Engine"
arch=('i686')
url="http://www.kde-look.org/content/show.php?content=25945"
license="GPL"
depends=('ksplash-engine-moodin')
source=(http://moodwrod.com/files/LoveKDE.tar.bz2)
md5sums=('88a0fca9581da329f7f0bb9d414a6ddc')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
  cp -r LoveKDE $startdir/pkg/opt/kde/share/apps/ksplash/Themes/
}
