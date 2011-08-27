# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=imageshack-uploader2
_realpkgname=imageshack-uploader
pkgver=2.3.0
pkgrel=3
pkgdesc="Official Image and Video uploader for imageshack.us web site (builds from source)"
arch=('i686' 'x86_64')
url="http://imageshack.us"
license=('GPL')
depends=('ffmpeg' 'qt')
makedepends=('mercurial')
provides=('imageshack-uploader')
conflicts=('imageshack-uploader')
source=('vamp_patch')

build() {
  cd "$srcdir"
  hg clone https://imageshack-uploader.googlecode.com/hg/ imageshack-uploader
  patch -Np1 ./imageshack-uploader/ffmpeg_fas.c vamp_patch
# patch -Np1 ./imageshack-uploader/imageshack.pro vamp_patch_qmake
  cd "$_realpkgname"

  IMAGESHACK_DEVELOPER_KEY="Vamp898" qmake -unix
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install
}
md5sums=('f3d83b96d7845ac3c8dccb9a9759d522')
