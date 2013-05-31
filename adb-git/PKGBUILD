# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=adb-git
pkgver=20130531
pkgrel=1
pkgdesc="adb (Android Debug Bridge CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('openssl')
makedepends=('git')
provides=('adb')
conflicts=('adb')
source=("git+https://android.googlesource.com/platform/system/core"
        'adbMakefile')
md5sums=('SKIP'
         '887d868e544330ef850334961685cab3')

build() {
  cd "${srcdir}"/core/adb
  mv ../../adbMakefile makefile
  make
}

package(){
  install -Dm755 "${srcdir}"/core/adb/adb "${pkgdir}"/usr/bin/adb
}
