# Maintainer: Musikolo <musikoloAThotmailDOTcom>
# ExContributor: krani1
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
pkgname=groovy
pkgver=1.8.5
pkgrel=1
pkgdesc="Groovy is a Java based scripting language, similar to Python, Ruby and Smalltalk"
url="http://groovy.codehaus.org"
license="BSD/Apache style licence"
depends=(bash java-environment)
arch=(x86_64 i686)
source=(http://dist.codehaus.org/groovy/distributions/$pkgname-binary-$pkgver.zip groovy.sh)
md5sums=('0c8759563be35e26fcebff240de4ca21'
         '8d619f6a1a06a66601a65fd5b5042dd0')
sha1sums=('6de4f2f191ec71e31ba99b3dda809716987be7d1'
          'fc4aa25a24a3fea82ed6078b0326c1b962b9ab25')

_optdir=${pkgdir}/opt/groovy
_profiledir=${pkgdir}/etc/profile.d

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/embeddable
  ln -s ${pkgname}-all-$pkgver.jar ${pkgname}-all.jar
  cd ..
  mkdir -p ${_optdir}
  mv * ${_optdir}
  mkdir -p ${_profiledir}
  install -m755 ../groovy.sh ${_profiledir}/groovy.sh
}
