# Maintainer:  Kerrick Staley <mail at kerrickstaley.com>
# Contributor: Jekyll Wu <adaptee [at] gmail [dot] com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin-git
pkgver=20121123
pkgrel=1
pkgdesc='Pinyin (Chinese) input method for the IBus framework'
arch=('i686' 'x86_64')
license=('GPL')
url='http://ibus.googlecode.com'
depends=('ibus' 'pyzy' 'lua')
makedepends=('intltool' 'gnome-common')
conflicts=('ibus-pinyin')

_gitname='ibus-pinyin'
_gitroot='git://github.com/ibus/ibus-pinyin.git'

build() {
  cd "${srcdir}"
  
  if [ -d "${_gitname}" ]; then
      cd "${_gitname}" && git clean -df && git pull origin master
  else
      git clone "${_gitroot}" && cd "${_gitname}"
  fi
  
  sed -i 's/python/python2/' setup/ibus-setup-pinyin.in

  PYTHON=python2 ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make NO_INDEX=true DESTDIR="${pkgdir}" install
}
