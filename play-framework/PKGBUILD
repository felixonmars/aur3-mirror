# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Contributor: rickeyski <rickeyvisinski@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=play-framework
pkgver=2.1.0
pkgrel=1
pkgdesc="Java/Scala web framework focused on developer productivity."
arch=(any)
url="http://www.playframework.org"
license=(APACHE)
depends=('java-environment>=5' 'bash')
optdepends=('zsh-completions: zsh auto-completion for the play command')
install=${pkgname}.install
options=(!strip emptydirs)
changelog=Changelog
conflicts=(${pkgname}-git sox)
source=(http://downloads.typesafe.com/play/${pkgver}/play-${pkgver}.zip)
md5sums=('0eef88602d26409bb584536cedb585de')

package() {
  msg2 "Install the assembly at /opt/${pkgname}..."
  install -dm755                   "${pkgdir}"/opt/${pkgname}
  cp -r ${srcdir}/play-${pkgver}/* "${pkgdir}"/opt/${pkgname}

  msg2 "Install link to executable at /usr/bin/play..."
  install -dm755             "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/play "${pkgdir}"/usr/bin/

  msg2 "Install links to the documentation resources at /usr/share/doc/${pkgname}..."
  install -dm755                      "${pkgdir}"/usr/share/doc/${pkgname}
  ln -s /opt/${pkgname}/README.md     "${pkgdir}"/usr/share/doc/${pkgname}/README.md
  ln -s /opt/${pkgname}/documentation "${pkgdir}"/usr/share/doc/${pkgname}/documentation
  ln -s /opt/${pkgname}/samples       "${pkgdir}"/usr/share/doc/${pkgname}/samples

  msg2 "Set some directories group-writtable..."
  chmod -R g+w "${pkgdir}"/opt/${pkgname}/{framework/{sbt,skeletons},repository,samples}
}

# vim:set ts=2 sw=2 et:
