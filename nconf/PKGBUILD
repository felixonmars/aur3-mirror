# Contributor: Milos Dukic <ghostlovescorebg at gmail dot com> 
# Maintainer: Romain Schmitz <slopjong theatsign slopjong thedotsign [country=de]> 
pkgname=nconf
pkgver=1.3.0_0
_ver=$(echo $pkgver | tr '_' '-')
pkgrel=2
pkgdesc="NConf - Enterprise Nagios configurator"
arch=('i686' 'x86_64')
url="http://www.nconf.org/dokuwiki/doku.php"
license=('GPL')
groups=()
depends=('mariadb' 'php' 'perl')
makedepends=()
optdepends=(php-ldap)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://downloads.sourceforge.net/project/nconf/nconf/${_ver}/nconf-${_ver}.tgz")
noextract=()
md5sums=('643b512dfa26676f652d966af37f62bd')

package() {  
  _instdir="$pkgdir/usr/share/webapps/${pkgname}"
  _confdir="$pkgdir/etc/webapps/${pkgname}"
  
  # create the installation and configuration directories
  mkdir -p "$_instdir"
  mkdir -p "$_confdir"
  
  # move nconf to the package directory
  mv "$srcdir/${pkgname}"/* "$_instdir"
  cp "$_instdir"/config.orig/* "$_confdir"
  
  # symlink the configuration files
  cd "$_instdir"
  rm -rf config
  ln -s /etc/webapps/"${pkgname}" "$_instdir"/config
  
  # create an apache config
  cat >"$_confdir/apache.example.conf" <<EOF
	Alias /nconf "/usr/share/webapps/nconf"
	<Directory "/usr/share/webapps/nconf">
			AllowOverride All
			Options FollowSymlinks
			Order allow,deny
			Allow from all
			php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
	</Directory>
EOF
}

## [/etc/php.ini]
# short_open_tag = On
# register_globals = Off
# magic_quotes_gpc = Of

# vim:set ts=2 sw=2 et:
