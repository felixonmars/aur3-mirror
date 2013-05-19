# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Szymon Jakubczak <s.jakubczak@gmail.com>
pkgname=gant
pkgdesc="A Groovy-based build system that uses Ant tasks, but no XML"
pkgver=1.9.9
_groovyver=2.1.0
pkgrel=1
url='http://gant.codehaus.org'
arch=('i686' 'x86_64')
license=('APACHE')
depends=('groovy>=2.1.0', 'apache-ant')
provides=('gant')

source=("http://dist.codehaus.org/gant/distributions/gant-${pkgver}-_groovy-${_groovyver}.tgz"
        'gant.sh')
sha256sums=('40eebc3ba675e9218407668be3415a95572cf684c34fd7d602e44e559d28b362'
            'aa7b41ebd5c4f2975ccc299f74ff87dbce75e2743cfdcb60a23e6ae6b22a1bcd')

build() {
  true
}

package() {
  cd "${srcdir}/gant-${pkgver}"

  # create the necessary directory structure
  install -d ${pkgdir}/opt/${pkgname}/bin
  install -d ${pkgdir}/opt/${pkgname}/lib
  install -d ${pkgdir}/opt/${pkgname}/conf
  install -d ${pkgdir}/etc/profile.d

  install -m755 bin/gant     ${pkgdir}/opt/${pkgname}/bin/ || return 1
  install -Dm644 lib/*.jar   ${pkgdir}/opt/${pkgname}/lib/ || return 1
  install -Dm644 conf/*.conf ${pkgdir}/opt/${pkgname}/conf/ || return 1
  
  install -m755 ${srcdir}/gant.sh ${pkgdir}/etc/profile.d/gant.sh
}