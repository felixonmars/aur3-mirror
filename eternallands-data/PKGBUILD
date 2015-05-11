# Based on the eternallands package from aur
# Maintainer (yuan_modu): Atila Satilmis <atila.satilmis@gmail.com>

pkgname=eternallands-data
pkgver=1.9.4
pkgrel=1
pkgdesc="Eternal Lands is a FREE 3D fantasy MMORPG (Official game data)"
arch=('any')
license=('custom')
url="http://www.eternal-lands.com/"
conflicts=('eternallands')
options=('!strip')
source=('http://www.eternal-lands.com/EL-MAC-1.9.4.zip')
md5sums=('4d2ea93c538b86e53608a283dcc4442b')

package() {
  cd "${srcdir}/EternalLands.app/Contents/Resources/data"
  
  mkdir -p "${pkgdir}"/usr/share/{eternallands,licenses/eternallands}
  
  install -m644 license.txt \
    "${pkgdir}/usr/share/licenses/eternallands/LICENSE.data.txt"
  
  _folder=('2dobjects' '3dobjects' 'actor_defs' 'animations' 'languages' 'maps' \
            'meshes' 'particles' 'shaders' 'skeletons' 'skybox' 'textures')
  for _f in ${_folder[@]}; do
    cp -a ${_f} "${pkgdir}/usr/share/eternallands/"
  done
  
  _file=('*.ini' '*.txt' '*.lst' '*.xml')
  for _f in ${_file[@]}; do
    install -m644 ${_f} "${pkgdir}/usr/share/eternallands/"
  done
}
