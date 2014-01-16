pkgname=fastboot-git
pkgver=6800_37fd839
pkgrel=1
pkgdesc="fastboot (Fastboot protocol CLI tool), an Android platform tool"
arch=('i686' 'x86_64' 'armv7h')
url="http://tools.android.com/"
license=('Apache')
depends=('zlib')
makedepends=('git')
provides=('fastboot')
conflicts=('fastboot')
source=("git+https://android.googlesource.com/platform/system/core"
        "git+https://android.googlesource.com/platform/system/extras"
        "git+https://android.googlesource.com/platform/external/libselinux"
        'fastbootMakefile')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '1802c76d7ea43657ce7407ee7c8f3972')

pkgver() {
  cd core
  echo "$(git rev-list HEAD | wc -l)_$(git rev-parse --short HEAD)"
}

build() {
  cd core/fastboot
  mv -f ../../fastbootMakefile makefile
  make
}

package(){
  install -Dm755 core/fastboot/fastboot "${pkgdir}"/usr/bin/fastboot
}
