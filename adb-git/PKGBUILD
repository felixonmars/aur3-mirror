pkgname=adb-git
pkgver=android.4.4.2_r1.494.g37fd839
pkgrel=1
pkgdesc="adb (Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('openssl' 'zlib')
makedepends=('git')
provides=('adb')
conflicts=('adb')
source=("git+https://android.googlesource.com/platform/system/core"
        'adbMakefile')
md5sums=('SKIP'
         '887d868e544330ef850334961685cab3')

pkgver() {
  cd core
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd core/adb
  mv ../../adbMakefile makefile
  make
}

package(){
  install -Dm755 core/adb/adb "${pkgdir}"/usr/bin/adb
}
