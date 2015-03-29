# $Id$
# Maintainer: Andrea Scarpino <marek.prochera@gmail.com>

pkgname=sbt-latest
epoch=1
pkgver=0.13.8
pkgrel=1
pkgdesc="The interactive build tool. Use Scala to define your tasks. Then run them in parallel from the shell."
arch=('any')
url='http://www.scala-sbt.org/'
license=('custom' 'APACHE')
depends=('java-runtime-headless' 'sh')
source=("http://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/${pkgver}/sbt-launch.jar"
        'LICENSE' 'LICENSE_Scala' 'sbt.sh' 'sbt.conf.sh' 'sbt.conf.csh')
md5sums=('00672c01d5beea62928e33cdeae7b46b'
         '0cc49331142988765ce73782a5839c57'
         '4a09aae439532404ef76d0ba1db3342c'
         '0f046b0f4124d83a8ae7f480ae655f6d'
         'd3691d3866b0f4e35d4cdc15fac495ef'
         'db3701bd6facf736100efa5871847564')

package() {
  install -d "${pkgdir}"/usr/share/java/${pkgname}
  install -m755 sbt-launch.jar "${pkgdir}"/usr/share/java/${pkgname}

  install -d "${pkgdir}"/usr/bin/
  install -Dm755 "${srcdir}"/sbt.sh "${pkgdir}"/usr/bin/sbt

  install -d "${pkgdir}"/etc/profile.d
  install -Dm644 "${srcdir}"/sbt.conf.sh "${pkgdir}"/etc/profile.d/sbt.sh
  install -Dm644 "${srcdir}"/sbt.conf.csh "${pkgdir}"/etc/profile.d/sbt.csh

  install -Dm644 "${srcdir}"/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 "${srcdir}"/LICENSE_Scala \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE_Scala
}
