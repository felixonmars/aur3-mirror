# Contributor:  Martin Stolpe <martinstolpe at gmail ... com>
pkgname=bzr-eclipse
pkgver=1.1.1
pkgrel=1
pkgdesc="Bazaar Plugin for Eclipse (stable Version)"
arch=(i686 x86_64)
url="https://launchpad.net/bzr-eclipse"
license=('GPL')
depends=('bzr-xmloutput>=0.8.7' 'eclipse')
replaces=(eclipse-bzr)
conflicts=(eclipse-bzr eclipse-bazaar-plugin)
source=(http://verterok.com.ar/bzr-eclipse/archive/update-site-${pkgver}.zip)
_install_dir=${pkgdir}/usr/share/eclipse/dropins/bzr-eclipse/eclipse/

build() {
  cd "${srcdir}/update-site-${pkgver}"
  install -dm755 "${_install_dir}"

  install -dm755 "${_install_dir}/features"
  install -dm755 "${_install_dir}/plugins"

  find ./ -maxdepth 1 -type f -exec install -m644 -t "${_install_dir}/../" {} \;
  find ./plugins -maxdepth 1 -type f -exec install -m644 -t "${_install_dir}/plugins" {} \;
  find ./features -maxdepth 1 -type f -exec install -m644 -t "${_install_dir}/features" {} \;
}
md5sums=('bc79f097207ebe66067c63a71e9b2a27')
