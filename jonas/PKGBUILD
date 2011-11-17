# Maintainer: Guillaume ALAUX <guillaume at alaux dot net>
pkgname=jonas
pkgver=5.2.2
pkgrel=1
pkgdesc="Java EE 5 certified Open Source OSGi Enterprise Server by OW2"
arch=('any')
url="http://jonas.ow2.org/"
license=('LGPL')
depends=('java-runtime' 'apache-ant>1.7' 'java-bcel')
optdepends=('zsh-completions-git'
            'jonas-bash-completion')
install=jonas.install
source=(\
  http://download.forge.objectweb.org/${pkgname}/${pkgname}-full-${pkgver}-bin.tar.gz \
  jonas \
  jonas.sh
)
md5sums=('5e5a2f301aa672ae0a69ed4c3571447d'
         '7f6035ea79d1750b643177ce93b260a9'
         'ab6a50bab9ecb98cb34f7fc1932009a1')

package() {
  mkdir -p ${pkgdir}/opt
  # JOnAS files
  cp -a ${srcdir}/jonas-full-${pkgver} ${pkgdir}/opt/${pkgname}
  # Daemon startup script
  install -D -m755 ${srcdir}/jonas ${pkgdir}/etc/rc.d/jonas
  # Cleanup
  find ${pkgdir}/opt/${pkgname}/bin -name "*.bat" -delete
  # Environment variables
  install -D -m755 ${srcdir}/jonas.sh ${pkgdir}/etc/profile.d/jonas.sh
}
