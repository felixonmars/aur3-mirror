# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=mybb-mention-me
_pkgname=MentionMe
pkgver=2.3.1
pkgrel=1
pkgdesc="A plugin for MyBB 1.6.x that allows Twitter-style tagging and integration with MyAlerts"
install=mybb-mention-me.install
arch=('any')
url=('https://github.com/WildcardSearch/MentionMe')
license=('GPL')
depends=('mybb' 'mybb-myalerts')
source=("https://github.com/WildcardSearch/MentionMe/archive/v${pkgver}.tar.gz")
md5sums=('f57fa56b0fa14aa2846be4794fc88ab0')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/mybb/

  cp -ra ${srcdir}/${_pkgname}-${pkgver}/Upload/{inc,jscripts} ${pkgdir}/usr/share/webapps/mybb/
}
