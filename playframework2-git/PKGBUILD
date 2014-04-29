# Maintainer: Michele Damiano Torelli <me_AT_mdtorelli_DOT_it>

pkgname=playframework2-git
pkgver=2.3.M1.135.g15a3e74
pkgrel=1
pkgdesc="An open source web application framework in Java which follows the MVC pattern - Git version"
arch=('any')
url="http://www.playframework.org/"
license=('Apache')
depends=('java-environment')
makedepends=('git')
provides=('playframework2')
conflicts=('playframework' 'playframework2' 'playframework2-devel')
replaces=('playframework2')
source=('git://github.com/playframework/Play20'
        'play'
        'play.boot.properties')
md5sums=('SKIP'
         '073f878095aa04d5d4b285967d280eda'
         '0281be702c6e41e24c6276b91581b180')

pkgver() {
  cd Play20
  git describe --always | sed 's/-/./g'
}

build() {
  cd Play20/framework

  ./build publish-local
}

package() {
  install -dm755 "${pkgdir}"/usr/share/playframework2 "${pkgdir}"/usr/bin
  cp -r Play20/* "${pkgdir}"/usr/share/playframework2
  cp play "${pkgdir}"/usr/share/playframework2
  cp play.boot.properties "${pkgdir}"/usr/share/playframework2/framework/sbt

  chgrp -R users "${pkgdir}"/usr/share/playframework2/framework
  chmod -R g+rwx "${pkgdir}"/usr/share/playframework2/framework
  chmod 755 "${pkgdir}"/usr/share/playframework2/play

  rm "${pkgdir}"/usr/share/playframework2/{CONTRIBUTING.md,README.md,framework/build.bat}
  ln -s /usr/share/playframework2/play "${pkgdir}"/usr/bin/play
}
