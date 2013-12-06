# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tess 'socketwench' Flynn <tess@deninet.com>
pkgname=drush-git
pkgver=0.0.0
pkgrel=1
pkgdesc="The Drupal command-line shell, git version."
arch=('any')
url="https://github.com/drush-ops/drush"
license=('GPL')
depends=('php' 'bash')
conflicts=('drush5' 'drush')
install=${pkgname}.install
source=("$pkgname"::'git://github.com/drush-ops/drush.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
  install -d ${pkgdir}/usr/lib/drush/classes
  cp -rf ${srcdir}/${pkgname}/classes/* ${pkgdir}/usr/lib/drush/classes/

  install -d ${pkgdir}/usr/lib/drush/commands
  cp -rf ${srcdir}/${pkgname}/commands/* ${pkgdir}/usr/lib/drush/commands/

  install -d ${pkgdir}/usr/lib/drush/docs
  cp -rf ${srcdir}/${pkgname}/docs/* ${pkgdir}/usr/lib/drush/docs/

  install -d ${pkgdir}/usr/lib/drush/examples
  cp -rf ${srcdir}/${pkgname}/examples/* ${pkgdir}/usr/lib/drush/examples/

  install -d ${pkgdir}/usr/lib/drush/includes
  cp -rf ${srcdir}/${pkgname}/includes/* ${pkgdir}/usr/lib/drush/includes/

  install -d ${pkgdir}/usr/lib/drush/lib
  cp -rf ${srcdir}/${pkgname}/lib/* ${pkgdir}/usr/lib/drush/lib/

  install -d ${pkgdir}/usr/lib/drush/misc
  cp -rf ${srcdir}/${pkgname}/misc/* ${pkgdir}/usr/lib/drush/misc/

  install -Dm755 ./drush.php ${pkgdir}/usr/lib/drush/drush.php || return 1
  install -Dm755 ./drush ${pkgdir}/usr/lib/drush/drush || return 1
  install -Dm644 ./drush.info ${pkgdir}/usr/lib/drush/drush.info || return 1
  install -Dm644 ./docs/drush.api.php ${pkgdir}/usr/lib/drush/drush.api.php || return 1
  install -Dm644 ./README.md ${pkgdir}/usr/share/doc/drush/README.txt || return 1
  install -Dm644 ./drush_logo-black.png ${pkgdir}/usr/share/doc/drush/drush_logo-black.png || return 1
  install -Dm644 ./examples/example.drushrc.php ${pkgdir}/etc/drush/example.drushrc.php || return 1
  install -Dm644 ./examples/example.aliases.drushrc.php ${pkgdir}/etc/drush/example.aliases.drushrc.php || return 1
  install -Dm644 ./examples/example.drush.ini ${pkgdir}/etc/drush/example.drush.ini || return 1
  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/lib/drush/drush ${pkgdir}/usr/bin/drush
  #Make directory for eventual packaged drush extensions
  mkdir -p ${pkgdir}/usr/share/drush/commands
}
