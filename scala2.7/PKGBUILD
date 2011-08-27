# Maintainer: Hoang Duc Hieu <hdh @ lazny.tang.la>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

pkgname=scala2.7
pkgver=2.7.7
pkgrel=1
pkgdesc="Old version of a Java-interoperable language with object-oriented and functional features"
arch=('any')
url="http://www.scala-lang.org"
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'util-linux-ng')
source=(http://www.scala-lang.org/downloads/distrib/files/scala-${pkgver}.final-sources.tgz)
md5sums=('3692a6ac7523b21302901a24016a3f4c')

build(){
    cd ${srcdir}/scala-${pkgver}.final-sources
    ant build || return 1
    ant docs || return 1
#    ant pack || return 1

    install -d ${pkgdir}/usr/{bin,share} ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/${pkgname}/{bin,lib} || return 1

    install -D -m0644 docs/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
    mv build/pack/lib ${pkgdir}/usr/share/${pkgname}/ || return 1
    install -m 755 build/pack/bin/{fsc,scala,scalac,scaladoc} ${pkgdir}/usr/share/${pkgname}/bin || return 1
    install -m 644 build/scaladoc/manual/man/man1/{fsc,sbaz,scala,scalac,scaladoc}.1 ${pkgdir}/usr/share/man/man1 || return 1
    rename .1 2.7.1 ${pkgdir}/usr/share/man/man1/* || return 1 # avoid conflict with scala

    ln -s ../share/${pkgname}/bin/fsc ${pkgdir}/usr/bin/fsc2.7
    ln -s ../share/${pkgname}/bin/scala ${pkgdir}/usr/bin/${pkgname}
    ln -s ../share/${pkgname}/bin/scalac ${pkgdir}/usr/bin/scalac2.7
    ln -s ../share/${pkgname}/bin/scaladoc ${pkgdir}/usr/bin/scaladoc2.7
}
