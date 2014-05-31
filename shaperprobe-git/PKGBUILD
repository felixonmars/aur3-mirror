# Maintainer: Carl Mueller  arch at carlm e4ward com

pkgname=shaperprobe-git
_name=shaperprobe
pkgver=20140530
pkgrel=2
pkgdesc="Detecting ISP Traffic Rate-Limiting"
arch=('i686' 'x86_64')
url="https://code.google.com/p/shaperprobe/"
license=('GPL')
makedepends=('git')

build() {
  git clone ${url}
  cd ${_name}/${_name}/linux
  make
}

package () {
  cd ${_name}/${_name}/linux
  mkdir -p ${pkgdir}/usr/bin
  install -m 755 prober ${pkgdir}/usr/bin/
}
