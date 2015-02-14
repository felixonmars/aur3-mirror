pkgname=kde-thumbnailer-webp-git
_gitname=kde-thumbnailer-webp
pkgver=1.1
pkgrel=1
pkgdesc="A WebP thumbnailer for KDE4"

arch=('any')
url="https://github.com/FLOSSingIsImportant/kde-thumbnailer-webp"
license=('GPL3')
depends=('libwebp' 'kdelibs' 'zlib')
makedepends=('git' 'cmake' 'automoc4')

source=("git://github.com/FLOSSingIsImportant/kde-thumbnailer-webp.git")
sha256sums=('SKIP')

package () {
 cd "$_gitname"
 cmake -DCMAKE_INSTALL_PREFIX=/usr
 make || return 1
 make DESTDIR=${pkgdir} install
}
