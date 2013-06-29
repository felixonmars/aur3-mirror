# Maintainer: Yannic Arnoux <kianby@gmail.com>

pkgname=chive
pkgver=1.3.1
pkgrel=3
pkgdesc="Chive is a next generation MySQL database management tool. It aims to be an alternative to phpMyAdmin."
arch=('any')
license=('GPL')
depends=('php')
url="http://www.chive-project.com/"
source=("chive.tar.gz::http://www.chive-project.com/Download/Redirect")
noextract=(chive.tar.gz)
 
sha512sums=('03b57866d6cae7bbb2688d6715266df96f9f723344d81c6ee1021800f05cd44addf6bd0d0d61c7490924ff68ce6a532ffc08db924cfcd65ba0f57d3efa35e46e')

package() {
  mkdir -p $srcdir/chive
  cd $srcdir/chive
  bsdtar xf ../../chive.tar.gz || return $?
  mkdir -p $pkgdir/usr/share/webapps
  mkdir -p $pkgdir/etc/webapps/chive

  # Apache configuration
  cat > $pkgdir/etc/webapps/chive/apache.example.conf <<EOF
  <VirtualHost *:80>
    DocumentRoot "/usr/share/webapps"
    ServerAdmin root@localhost
    ErrorLog "/var/log/httpd/127.0.0.1-error_log"
    CustomLog "/var/log/httpd/127.0.0.1-access_log" common
    <Directory /usr/share/webapps/chive>
	AllowOverride All
	Options FollowSymlinks
	Order allow,deny
	Allow from all
	php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
    </Directory>
  </VirtualHost>
EOF

  mv chive $pkgdir/usr/share/webapps/.
}

