# Contributor: Greg Fitzgerald <greg@gregf.org>
# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=engulf
pkgver=3.0.0_beta12
pkgrel=1
pkgdesc="Engulf is a scalable and distributed HTTP benchmarker"
arch=('i686' 'x86_64')
url="http://engulf-project.org"
license=('MIT')
depends=(java-runtime)
source=("http://engulf-project.s3.amazonaws.com/releases/$pkgname.jar"
        ${pkgname}.sh)

sha1sums=('ab1781bcec3d678c7e2e2029573a33284f182760'
          '30170676eeab8aa77c9b8525df74de32c3ac79a7')

noextract=(${source[@]##*/})

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.jar "${pkgdir}"/usr/share/java/${pkgname}/${pkgname}.jar
}

# vim:set ts=4 sw=4 et:
