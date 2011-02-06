pkgname=kdeplasma-windows-list
pkgver=0.3
pkgrel=1
pkgdesc="Icon plasmoid showing a List of Open Window"
url="http://kde-look.org/content/show.php/Windows+List?content=96486"
arch=(i686 x86_64)
license=(GPL)
depends=('qt' 'kdelibs>=4.2' 'kdebase')
makedepends=('cmake')
groups=()
source=(http://kde-look.org/CONTENT/content-files/96486-windowslist_0.3.tar.bz2)
md5sums=(58d0dc6f35b7b32a8824c1dc7c153cd0)

build() {
  cd $srcdir/windowslist_$pkgver
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
    make || return 1
      make DESTDIR=$pkgdir install || return 1
      }
