# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: revel <revelΘmuub·net>
# Contributor: Marcos J. S. Magalhaes <mjsmagalhaesinsc@gmail.com>

pkgname=premake-hg
pkgver=737.15a1bd2219d5
pkgrel=1
pkgdesc='Simple build configuration and project generation tool using Lua'
arch=('i686' 'x86_64')
url='http://industriousone.com/premake'
license=('BSD')
depends=('glibc')
makedepends=('mercurial' 'premake')
provides=('premake4' 'premake')
conflicts=('premake')
source=(hg+https://bitbucket.org/premake/premake-stable)
md5sums=('SKIP')

pkgver() {
  cd premake-stable
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd premake-stable

  premake4 embed
  premake4 gmake

  make config=release
}

package() {
  install -Dm755 premake-stable/bin/release/premake4 "$pkgdir"/usr/bin/premake4
}
