# Modified from adb-git
# Maintainer: Logan Gorence <loganjohngorence@gmail.com>
# Contributor: Chris Down <chris@chrisdown.name>

pkgname=adb
pkgver=android.5.1.0_r5
pkgrel=1
pkgdesc="adb (Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('openssl' 'zlib')
makedepends=('git')
conflicts=('adb-git')
source=("git+https://android.googlesource.com/platform/system/core#commit=eb255708970f4723afa45ebc842de25ac9488235"
        'adbMakefile')
md5sums=('SKIP'
         'ef7cfcefe017a4448019856902ea242e')

build() {
  cd core/adb
  mv ../../adbMakefile makefile
  make
}

package(){
  install -Dm755 core/adb/adb "${pkgdir}"/usr/bin/adb
}
