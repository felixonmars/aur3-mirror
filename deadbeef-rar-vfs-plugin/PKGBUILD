pkgname=deadbeef-rar-vfs-plugin
pkgver=1.8
pkgrel=5
pkgdesc="RAR vfs plugin for DeaDBeeF music player"
arch=("i686" "x86_64")
license=('GPL2')
url="https://github.com/shaohao/vfs_rar"
depends=('deadbeef')
source=('git+git://github.com/Alexey-Yakovenko/deadbeef-plugin-builder/')
md5sums=('SKIP')

prepare() {
  cd ${srcdir}/deadbeef-plugin-builder
  mkdir static-deps
}

build() {
  cd ${srcdir}/deadbeef-plugin-builder
  ./build --arch=x86_64 vfs_rar
}

package() {
  cd ${srcdir}/deadbeef-plugin-builder/temp/vfs_rar
  install -dm755 "${pkgdir}/usr/lib/deadbeef/"
  install -D -m644 vfs_rar.so "${pkgdir}/usr/lib/deadbeef/"
}
