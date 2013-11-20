# Maintainer:  Pieter Kokx <pieter@kokx.nl>

pkgname=gtkgrab-server
_pkgname=GtkGrab-server
pkgver=0.3.0
pkgrel=1
pkgdesc='Server for GtkGrab, automatic screenshot upload utility'
arch=('any')
url="https://github.com/kokx/GtkGrab-server"
license=('GPL')
depends=('php')
backup=(etc/webapps/gtkgrab/config.php)
source=("https://github.com/kokx/$_pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('4f4f4b2e023d8e06794b1bef530ff7bc17fb34c2fabae4d32b0615171d8f7dc1')

package() {
  _instdir="$pkgdir"/usr/share/webapps/GtkGrab
  mkdir -p "$_instdir" "$pkgdir"/etc/webapps/gtkgrab
  cd "$_instdir"

  cp -ra $srcdir/$_pkgname-$pkgver/* .

  ln -s /etc/webapps/gtkgrab/config.php "$_instdir"/config.php
  cp "$_instdir"/config.php.dist "$pkgdir"/etc/webapps/gtkgrab/config.php

  cat >"$pkgdir"/etc/webapps/gtkgrab/apache.example.conf <<EOF
	Alias /gtkgrab "/usr/share/webapps/GtkGrab"
	<Directory "/usr/share/webapps/GtkGrab">
		AllowOverride All
		Options FollowSymlinks
		Order allow,deny
		Allow from all
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
	</Directory>
EOF
}
