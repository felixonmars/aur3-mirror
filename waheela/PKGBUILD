# Contributor: Marvn <mistrmarvn@gmail.com>

pkgname=waheela
pkgver=0.3
pkgrel=1
pkgdesc="Fullscreen interface for Amarok 2.x allowing for basic playback and volume control"
arch=("i686" "x86_64")
url="http://www.kde-apps.org/content/show.php/Waheela+%28Amarok+Fullscreen+Player%29?content=108863"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("http://linux.wuertz.org/dists/sid/main/source/waheela_$pkgver.tar.gz")
md5sums=('59862caa7e570ac60762f3022d60ad3e')

build() 

{
  cd ${srcdir}/${pkgname} || return 1
  

  cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
  
}

package()
{
  cd ${srcdir}/${pkgname} || return 1
  make DESTDIR=${pkgdir} install || return 1
}