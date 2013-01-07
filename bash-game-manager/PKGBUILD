# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname='bash-game-manager'
pkgver=0.9
pkgrel=1
arch=('any')
pkgdesc='Game Manager for use in console'
url='https://github.com/mrk3004/Bash-Game-Manager'
depends=('wine'
         'winetricks'
         'schedtool'
         'exo'
         'util-linux'
         'procps-ng'
         'findutils'
         'coreutils'
         'gawk'
         'xorg-xinit')
optdepends=('bash-completion')
source=("https://github.com/mrk3004/Bash-Game-Manager/tarball/bgm-$pkgver")
md5sums=('99358044c2f2093ea19f9bc2ded0f92f')
license=('GPL')

package() {
   #get_tag_hash
	cd "${srcdir}/mrk3004-Bash-Game-Manager-0ee4e2a"
   make DESTDIR="$pkgdir" install
}

get_tag_hash() {
   local tag_hash=$(ls "$srcdir" | grep mrk3004-Bash-Game-Manager-)
   echo ${tag_hash##*-}
   exit 1
}
