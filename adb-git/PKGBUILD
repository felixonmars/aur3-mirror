pkgname=adb-git
pkgver=android-4.4.4_r2.0.1
pkgrel=2
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
md5sums=("SKIP"
		 "SKIP")

pkgver() {
  cd core
  # Use the tag of the last commit
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd core/adb
  mv ../../adbMakefile makefile
  make
}

package(){
  install -Dm755 core/adb/adb "${pkgdir}"/usr/bin/adb
}
