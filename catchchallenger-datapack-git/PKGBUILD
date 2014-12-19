# Maintainer: Nyutag <tanguy@metatux.fr>
pkgname=catchchallenger-datapack-git
pkgver=latest
pkgrel=2
pkgdesc="openSource datapack for the Catch Challenger game"
arch=('i686' 'x86_64')
url="http://catchchallenger.first-world.info/"
license=('GPL')
makedepends=('git')
_gitroot="git://github.com/alphaonex86/CatchChallenger-datapack.git"
source=("${pkgname}"::"${_gitroot}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
}
 
package() {
  cd "${srcdir}/${pkgname}"
  if [ $(ls -d /usr/share/catchchallenger* | wc -w) == 1 ]; then
    _name=$(ls -d /usr/share/catchchallenger*)
    if [ -d $(ls -d /usr/share/catchchallenger*)/datapack ]; then
      sudo rm -r $_name/datapack
    fi
    mkdir -p "$pkgdir$_name/datapack"
    cp -r datapack/* "$pkgdir$_name/datapack"
  else
    if [ $(ls -d /usr/share/catchchallenger* | wc -w) == 0 ]; then
      echo "check the path of catchchallenger, it as to be in /usr/share"
    else
      echo "This is not expected, check your catchchallenger path, it as to be in /usr/share"
    fi
  fi
}