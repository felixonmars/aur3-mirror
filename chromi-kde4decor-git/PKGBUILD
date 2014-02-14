# Contributor: Flamelab <panosfilip@gmail.com>
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=chromi-kde4decor-git
pkgver=0.2.r2.2886a62
pkgrel=1
license=('GPLv2')
pkgdesc="A titlebar-less decoration, inspired by Google Chrome, for KDE4."
arch=("i686" "x86_64")
url="http://www.kde-look.org/content/show.php/Chromi?content=119069"
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'git')
source=(git://github.com/jinliu/kwin-deco-chromi.git)
md5sums=(SKIP)

pkgver() {
  cd kwin-deco-chromi

  printf "%s" "$(git describe --tags | sed 's/-/.r/; s/-g/./; s/v//')"
}

build()
{
	cd ${srcdir}/kwin-deco-chromi
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
	make
}

package() 
{
	cd ${srcdir}/kwin-deco-chromi
	make DESTDIR=${pkgdir} install
}
