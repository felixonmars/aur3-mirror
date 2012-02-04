# Mantainer: Sam Vimes>

pkgname=phpmycms
pkgver=1.0.0b
pkgrel=1
pkgdesc="Modern CMS"
arch=('i686' 'x86_64')
url="http://stankowic-development.net/projects.html"
license=('GPL')
depends=('php')
backup=(srv/http/wordpress/.htaccess)
source=(http://stankowic-development.net/releases/phpmycms/1.1.0/phpmycms_1.1.0.tar.gz)


build() {
  # Install files to the package directory.
  install -dm755 "$pkgdir/srv/http/cms" || return 1
  cp -r "$srcdir"/* "$pkgdir/srv/http/cms" || return 1
}