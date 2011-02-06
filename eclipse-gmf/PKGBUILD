# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: scosu <scosu (at) gmx (dot) de>
pkgname=eclipse-gmf
pkgver=2.2.2
rel_number=R201002241200
pkgrel=1
pkgdesc="Graphical Modeling Framework for developing editors based on EMF and GEF"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/modeling/gmf/"
license=('EPL')
depends=('eclipse-emf-transaction' 'eclipse-gef')
makedepends=('unzip')
source=(http://download.eclipse.org/modeling/gmf/gmf/downloads/drops/${pkgver}/${rel_number}/gmf-runtime-${pkgver}.zip)
md5sums=('f98162b775c78728f46d26a48231c3d6')

build() {
  cd $srcdir/eclipse
  find . -type f -exec chmod 644 {} \; || return 1
  find . -type d -exec chmod 755 {} \; || return 1
  install -d -m755 $pkgdir/$ECLIPSE_HOME || return 1
  mv plugins features $pkgdir/$ECLIPSE_HOME || return 1
}

