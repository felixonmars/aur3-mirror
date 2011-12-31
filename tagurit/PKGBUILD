# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=tagurit
pkgver=0.1
pkgrel=1
pkgdesc='Watches git repos for new tags.'
arch=('any')
url='https://github.com/gostrc/tagurit'
license=('unknown')
depends=('ruby' 'git')

build() {
  local _gitroot='git://github.com/gostrc/tagurit.git'
  local _gitname='tagurit'

  if [ -d ${_gitname} ] ; then
    cd ${_gitname}
    git pull
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi

  git checkout 0.1
} 

package() {
  local _gitname='tagurit'

  cd ${_gitname}

  install -D tagurit.rb \
    ${pkgdir}/usr/bin/tagurit
}
