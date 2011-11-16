# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=multipass-git
pkgver=20111116
pkgrel=1
pkgdesc='Utility to sign multiple files with gpg.'
arch=('any')
url='https://github.com/gostrc/multipass'
license=('MIT')
depends=('bash' 'gnupg')
makedepends=('git')

_gitroot='git://github.com/gostrc/multipass.git'
_gitname='multipass'

build() {
  git clone $_gitroot
}

package() {
  cd ${_gitname}

  install -d ${pkgdir}/usr/bin
  install multipass \
    ${pkgdir}/usr/bin
}


