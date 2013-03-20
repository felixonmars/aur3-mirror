# Maintainer: Oliver Woolland <oliver_woolland at hotmail dot co dot uk> 
pkgname=cinnamon_extension_gtile
pkgver=0
pkgrel=3
pkgdesc="Add tiling functionality to the Cinnamon desktop" 
url="http://cinnamon-spices.linuxmint.com/extensions/view/21"
arch=('any')
license=('GPL3')
depends=('cinnamon')
install='cinnamon-gtile.install'
source=("http://cinnamon-spices.linuxmint.com/uploads/extensions/IOV3-MHUS-8U71.zip")
md5sums=('42b1184432cf38a0ffe7691cbe5454fb')

_uuid="gTile_v0.3"

build() {
  cd "${srcdir}/${_uuid}"
  sed 's/1.6/1.7.2/' gTile\@shuairan/metadata.json > tmpfile
  mv tmpfile gTile\@shuairan/metadata.json
}

package() {
  cd "${srcdir}/${_uuid}"
  find gTile\@shuairan/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/cinnamon/extensions/{}" \;
  install -Dm644 *.xml "${pkgdir}/usr/share/glib-2.0/schemas/org.cinnamon.extensions.gtile.gschema.xml"
}

