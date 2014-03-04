# Modified from adb-git
# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=adb
pkgver=android.4.4.2_r2
pkgrel=1
pkgdesc="adb (Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=('adb-git')
source=("git+https://android.googlesource.com/platform/system/core#commit=e65b7ea"
        'adbMakefile')
md5sums=('SKIP'
         '887d868e544330ef850334961685cab3')

build() {
  cd core/adb
  mv ../../adbMakefile makefile
  make
}

package(){
  install -Dm755 core/adb/adb "${pkgdir}"/usr/bin/adb
}
