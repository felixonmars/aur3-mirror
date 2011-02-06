pkgname=kdm-theme-darch
pkgver=0.2
pkgrel=2
pkgdesc="KDM theme with Archlinux logo"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=37679"
license="GPL"
depends=('kdebase')
source=(http://stimpyrama.org/arch/dArch_KDM.tar.gz)
md5sums=('196231979eb20c7d71c25d9283b8295b')

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/opt/kde/share/apps/kdm/themes/
  mv 'dArch KDM' darch
  cp -r darch $startdir/pkg/opt/kde/share/apps/kdm/themes/
}
