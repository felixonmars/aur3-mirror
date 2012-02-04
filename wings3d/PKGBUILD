
# Maintainer: kappa <kappacurve@gmail.com>
pkgname=wings3d
_pkgname=wings
pkgver=1.4.1
pkgrel=4
pkgdesc="3D modeling program."
arch=('i686' 'x86_64')
url="http://www.wings3d.com"
license=('GPL')
depends=('esdl>=1.0.1')
optdepends=('povray: rendering support via POV-Ray' 'kerkythea: rendering support via Kerkythea')
replaces=('wings' 'wings-devel')
install=wings3d.install
source=(http://downloads.sourceforge.net/wings/${_pkgname}-${pkgver}.tar.bz2
        wings3d wings3d.desktop wings3d.png wings3d.install)
md5sums=('f62a06acdbf2d4ef09ce2bf55e8cec0f'
         '62fd2b01d06b88b64d6ea4f043c6cc48'
         'bd136dc7a2ebea6293b188c928fe4c78'
         '150ee5b1b9b44e20862210c9b01e53f4'
         'fe97a01e5f683b08eb8079120117d94e')
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export ESDL_PATH=$(echo /usr/lib/erlang/lib/esdl-*)
  make 
  make lang
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  mkdir -p ${pkgdir}/usr/lib/${pkgname}
  for subdir in ebin fonts patches plugins shaders textures ; do
    cp -r "${srcdir}/${_pkgname}-${pkgver}/${subdir}/" "${pkgdir}/usr/lib/${pkgname}"
  done

  install -D -m 755 ${srcdir}/wings3d ${pkgdir}/usr/bin/wings3d
  install -D -m 644 ${srcdir}/wings3d.desktop ${pkgdir}/usr/share/applications/wings3d.desktop
  install -D -m 644 ${srcdir}/wings3d.png ${pkgdir}/usr/share/pixmaps/wings3d.png
  install -D -m 644 ${srcdir}/${_pkgname}-${pkgver}/license.terms ${pkgdir}/usr/share/licenses/wings3d/license.terms
}



