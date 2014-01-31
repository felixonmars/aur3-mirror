# Maintainer:  mikezackles
# Creator?:    Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Marcos J. S. Magalhaes <mjsmagalhaesinsc@gmail.com>

pkgname=premake5-hg
pkgver=1261.da7749d8a963
pkgrel=1
pkgdesc='Simple build configuration and project generation tool using Lua'
arch=('i686' 'x86_64')
url='http://industriousone.com/premake'
license=('BSD')
depends=('glibc')
makedepends=('mercurial' 'premake')
provides=('premake5')
source=(hg+https://bitbucket.org/premake/premake-dev)
md5sums=('SKIP')

pkgver() {
  cd premake-dev
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd premake-dev

  premake4 embed
  premake4 gmake

  make config=release
}

package() {
  install -Dm755 premake-dev/bin/release/premake5 "$pkgdir"/usr/bin/premake5
}
