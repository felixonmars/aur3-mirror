# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=eclipse-mdt-uml2tools
pkgver=0.8.1_R200809231457
pkgrel=1
pkgdesc="A set of GMF-based editors for viewing and editing UML models"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/mdt/?project=uml2tools#uml2tools"
license=('EPL')
depends=("eclipse-gmf")
source=("http://download.eclipse.org/modeling/mdt/uml2tools/downloads/drops/${pkgver%%[A-Z,_]*}/${pkgver#*_}/mdt-uml2tools-runtime-incubation-${pkgver%_*}.zip")
md5sums=('0e17b5f1c0f51a9840d87b22ebfd0c49')

build() {
  cd "$srcdir"/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 "$pkgdir/$ECLIPSE_HOME" || return 1
  mv plugins features "$pkgdir/$ECLIPSE_HOME" || return 1
}
