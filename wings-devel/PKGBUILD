# Contributor: kappa <kappacurve@gmail.com>

pkgname=wings-devel
_pkgname=wings
pkgver=1.3.0.1
pkgrel=1
pkgdesc="3D modeling program."
arch=('i686' 'x86_64')
url="http://www.wings3d.com"
license=('custom')
depends=('esdl>=1.0.1' 'erlang>=R13B02')
provides=('wings')
conflicts=('wings')
install=wings.install
source=(http://downloads.sourceforge.net/wings/${_pkgname}-${pkgver}.tar.bz2
        wings wings.desktop wings.png wings.install)
 
build() {
  export ESDL_PATH=`echo /usr/lib/erlang/lib/esdl-*`

  cd ${srcdir}/${_pkgname}-${pkgver}
  export MAKEFLAGS="-j 1"
  make || return 1

  mkdir -p ${pkgdir}/usr/lib/${_pkgname}
  for subdir in ebin fonts patches plugins shaders textures ; do
    cp -r ${srcdir}/${_pkgname}-${pkgver}/$subdir/ ${pkgdir}/usr/lib/${_pkgname}
  done

  install -D -m 755 ${srcdir}/wings ${pkgdir}/usr/bin/wings
  install -D -m 644 ${srcdir}/wings.desktop ${pkgdir}/usr/share/applications/wings.desktop
  install -D -m 644 ${srcdir}/wings.png ${pkgdir}/usr/share/pixmaps/wings.png

  install -D -m 644 ${srcdir}/${_pkgname}-${pkgver}/license.terms ${pkgdir}/usr/share/licenses/wings/license.terms

}

md5sums=('ab063494de82e225cfc1b49edcc1a234'
         '4bd571237e47f4e0d398a8c7c70154ba'
         '84e33bbe72f77c87fb286539aad44564'
         '150ee5b1b9b44e20862210c9b01e53f4'
         'fe97a01e5f683b08eb8079120117d94e')
