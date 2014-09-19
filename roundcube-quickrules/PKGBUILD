# Maintainer Stefan Tatschner <stefan@sevenbyte.org>

pkgname=roundcube-quickrules
_pkgname=Roundcube-Plugin-QuickRules
pkgver=2.2.1
pkgrel=1
pkgdesc="Allows managing sieve rules in roundcube"
arch=('any')
url="https://github.com/JohnDoh/Roundcube-Plugin-SieveRules-Managesieve"
license=('GPL')
depends=('roundcubemail' 'roundcube-sieverules')
source=("https://github.com/JohnDoh/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4f3b35bd16c3377c781af306680fdef3')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/roundcubemail/plugins

  cd ${pkgdir}/usr/share/webapps/roundcubemail/plugins
  cp -ra ${srcdir}/${_pkgname}-${pkgver} quickrules
}
