pkgname=adb-git
pkgver=4d1d2ca
pkgrel=1
pkgdesc="adb (Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('openssl' 'zlib')
makedepends=('git')
provides=('adb')
conflicts=('adb')
source=("git+https://android.googlesource.com/platform/system/core#branch=master"
        'adbMakefile')
md5sums=("SKIP"
		 "SKIP")

pkgver() {
  cd core
  git log --pretty=format:'%h' -n 1
}

build() {
  cd core/adb
  mv ../../adbMakefile makefile
  make
}

package(){
  install -Dm755 core/adb/adb "${pkgdir}"/usr/bin/adb
}
