# Maintainer: Kevin Thomas <hamgom95@gmail.com>
# Contributor: Kevin Thomas <hamgom95@gmail.com>

pkgname=jailhouse-git
pkgver=f8a4a5a
pkgrel=1
pkgdesc='a partitioning hypervisor linux kernel module (Git version)'
arch=('x86_64')
license=('GPL')
url='http://github.com/siemens/jailhouse'
provides=('jailhouse')
makedepends=('linux-headers' 'git')
source=("${pkgname}::git+https://github.com/siemens/jailhouse.git")
md5sums=('SKIP')
install=jailhouse.install
pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd ${srcdir}/${pkgname}

  _PACKAGES=`pacman -Qsq linux`
  _KERNELS=`pacman -Ql $_packages | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`

   # Find all extramodules directories
  _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`

  # Loop through all detected kernels
  for _kernver in $_KERNELS; do

    # Loop through all detected extramodules directories
    for _moduledirs in $_EXTRAMODULES; do
      # Check which extramodules directory corresponds with the built module
      if [ `cat "/usr/lib/modules/${_moduledirs}/version"` = $_kernver ]; then
        mkdir -p "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        install -m644 jailhouse.ko "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/jailhouse.ko"
      fi
    done
  done
}
