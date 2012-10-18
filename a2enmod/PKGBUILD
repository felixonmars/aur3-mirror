# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_mods_dir='etc/httpd/conf/mods-available'

pkgname=a2enmod
pkgver=1.1
pkgrel=1
pkgdesc='Apache enable/disable module/site. From Debian package.'
arch=('any')
url='http://httpd.apache.org/'
license=('APACHE')
groups=()
#depends=(perl-list-moreutils apache)
depends=(perl apache)
makedepends=()
optdepends=(
'php-apache: php support'
'openssl: https support, to generate a certificate'
)
provides=()
conflicts=()
replaces=()
backup=(
${_mods_dir}/actions.conf
${_mods_dir}/alias.conf
${_mods_dir}/autoindex.conf
${_mods_dir}/cgid.conf
${_mods_dir}/dav_fs.conf
${_mods_dir}/dav_svn.conf
${_mods_dir}/deflate.conf
${_mods_dir}/dir.conf
${_mods_dir}/disk_cache.conf
${_mods_dir}/dnssd.conf
${_mods_dir}/fastcgi.conf
${_mods_dir}/fcgid.conf
${_mods_dir}/info.conf
${_mods_dir}/ldap.conf
${_mods_dir}/mem_cache.conf
${_mods_dir}/mime.conf
${_mods_dir}/mime_magic.conf
${_mods_dir}/mod-security.conf
${_mods_dir}/mono.conf
${_mods_dir}/negotiation.conf
${_mods_dir}/pagespeed.conf
${_mods_dir}/perl.conf
${_mods_dir}/php5_cgi.conf
${_mods_dir}/php5.conf
${_mods_dir}/proxy_balancer.conf
${_mods_dir}/proxy.conf
${_mods_dir}/proxy_ftp.conf
${_mods_dir}/qos.conf
${_mods_dir}/reqtimeout.conf
${_mods_dir}/rpaf.conf
${_mods_dir}/setenvif.conf
${_mods_dir}/ssl.conf
${_mods_dir}/status.conf
${_mods_dir}/suphp.conf
${_mods_dir}/userdir.conf
${_mods_dir}/vhost_alias.conf
etc/httpd/conf/ports.conf
etc/httpd/conf/sites-available/default
etc/httpd/conf/sites-available/default-ssl
etc/httpd/conf/conf.d/charset
etc/httpd/conf/conf.d/localized-error-pages
etc/httpd/conf/conf.d/other-vhosts-access-log
etc/httpd/conf/conf.d/security
)
options=(emptydirs !strip)
source=($pkgname-$pkgver.tar.gz)
install='a2enmod.install'
noextract=()

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
md5sums=('7247d21054a7e8302b6cab16630e56a3')
