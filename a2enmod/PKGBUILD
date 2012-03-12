# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=a2enmod
pkgver=1.0
pkgrel=3
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
etc/httpd/conf/mods-available/actions.conf
etc/httpd/conf/mods-available/alias.conf
etc/httpd/conf/mods-available/autoindex.conf
etc/httpd/conf/mods-available/cgid.conf
etc/httpd/conf/mods-available/dav_fs.conf
etc/httpd/conf/mods-available/deflate.conf
etc/httpd/conf/mods-available/dir.conf
etc/httpd/conf/mods-available/disk_cache.conf
etc/httpd/conf/mods-available/dnssd.conf
etc/httpd/conf/mods-available/fastcgi.conf
etc/httpd/conf/mods-available/fcgid.conf
etc/httpd/conf/mods-available/info.conf
etc/httpd/conf/mods-available/ldap.conf
etc/httpd/conf/mods-available/mem_cache.conf
etc/httpd/conf/mods-available/mime.conf
etc/httpd/conf/mods-available/mime_magic.conf
etc/httpd/conf/mods-available/mono.conf
etc/httpd/conf/mods-available/negotiation.conf
etc/httpd/conf/mods-available/perl.conf
etc/httpd/conf/mods-available/php5.conf
etc/httpd/conf/mods-available/proxy_balancer.conf
etc/httpd/conf/mods-available/proxy.conf
etc/httpd/conf/mods-available/proxy_ftp.conf
etc/httpd/conf/mods-available/reqtimeout.conf
etc/httpd/conf/mods-available/setenvif.conf
etc/httpd/conf/mods-available/ssl.conf
etc/httpd/conf/mods-available/status.conf
etc/httpd/conf/mods-available/suphp.conf
etc/httpd/conf/mods-available/userdir.conf
)
options=(emptydirs !strip)
source=($pkgname-$pkgver.tar.gz)
install='a2enmod.install'
noextract=()

_apache_dir='/etc/httpd'
_man_dir='/usr/share/man/man8'

package(){
  cd "$srcdir/$pkgname-$pkgver"

  # installation of modules, default sites and basic configuration
  install -dm755 "$pkgdir"/${_apache_dir}/conf || return 1
  tar -c conf | tar -x -C "$pkgdir"${_apache_dir}

  # installation of missing modules from orignal httpd.conf
  cp -f mods-orig/* "$pkgdir"/${_apache_dir}/conf/mods-available/

  # installation of other modules, installed separately
  cp -f mods-other/* "$pkgdir"/${_apache_dir}/conf/mods-available/

  pushd "$pkgdir"${_apache_dir}/conf/mods-available
  
  # removing an entry '/usr/lib/apache2' from *.load
  sed -e 's#/usr/lib/apache2/##g' -i *.load

  # changing directory apache2 to httpd in *.conf
  sed -e 's#/usr/share/apache2/#/usr/share/httpd/#g' -i *.conf
  sed -e 's#/etc/apache2#/etc/httpd/conf#g' -i *.conf
  popd

  # installation of a2enmod script and symlinks
  install -Dm755 sbin/a2enmod "$pkgdir"/usr/sbin/a2enmod
  pushd "$pkgdir"/usr/sbin
  ln -s a2enmod a2ensite
  ln -s a2enmod a2dismod
  ln -s a2enmod a2dissite
  popd

  # creating directories for enabled mods and sites 
  install -dm755 "$pkgdir"$_apache_dir/conf/mods-enabled
  install -dm755 "$pkgdir"$_apache_dir/conf/sites-enabled

  # installation of man pages
  install -dm755 "$pkgdir"/${_man_dir}
  pushd man
  sed -e 's/apache2ctl/apachectl/g' -e 's#/etc/apache2#/etc/httpd/conf#g' -i a2enmod.8 a2ensite.8
  for i in *.8; do
    gzip $i -c > "$pkgdir"/${_man_dir}/$i.gz
  done
  popd

  # installation of bash completion
  install -Dm644 bash_completion "$pkgdir"/etc/bash_completion.d/a2enmod

}
md5sums=('71cddc8965391e34876bdae471107638')
