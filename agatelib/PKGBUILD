# Maintainer: Nathan O <ndowens04 at gmail dot com> 

pkgname=agatelib
pkgver=0.3.1
_downloadver=031
pkgrel=1
pkgdesc="A .NET library for cross-platform development of games and game development tools"
arch=('i686' 'x86_64')
url="http://www.agatelib.org/"
license=('MPL')
depends=('mono')
makedepends=('nant')
source=(http://downloads.sourceforge.net/agate/Agate${_downloadver}.zip)
md5sums=('d2a22039bddf6c067b7b8dac22d347bd')

build() {
  cd ${srcdir}/Source/Build
  chmod +x nant.sh 
  export MONO_SHARED_DIR=$(pwd)

  ./nant.sh || return 1

  install -d "$pkgdir"/usr/lib/mono/$pkgname
  install -m644 ../Binaries/Release/AgateLib/*.dll "$pkgdir"/usr/lib/mono/$pkgname/
}

# vim:set ts=2 sw=2 et:
