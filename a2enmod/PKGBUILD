# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=a2enmod
pkgver=1.0
pkgrel=1
pkgdesc='Apache enable/disable module/site. From Debian package.'
arch=('any')
url='http://httpd.apache.org/'
license=('APACHE')
groups=()
#depends=(perl-list-moreutils apache)
depends=(perl apache)
makedepends=()
optdepends=('php-apache: php support' 'openssl: https support, to generate a certificate')
provides=()
conflicts=()
replaces=()
backup=()
options=(emptydirs)
source=($pkgname-$pkgver.tar.gz)
install='a2enmod.install'
noextract=()

_apache_dir='/etc/httpd'
_man_dir='/usr/share/man/man8'

package(){
  cd "$srcdir/$pkgname-$pkgver"

  # install modules and default sites and basic configuration
  install -dm755 "$pkgdir"/${_apache_dir}/conf || return 1
  tar -c conf | tar -x -C "$pkgdir"${_apache_dir}

  # install missing modules from default httpd.conf
  cp -f mods-orig/* "$pkgdir"/${_apache_dir}/conf/mods-available/

  pushd "$pkgdir"${_apache_dir}/conf/mods-available
  # remove /usr/lib/apache2 from *.load
  sed -e 's#/usr/lib/apache2/##g' -i *.load
  # change directory apache2 to httpd
  sed -e 's#/usr/share/apache2/#/usr/share/httpd/#g' -i *.conf
  popd

  # install a2enmod script
  install -Dm755 sbin/a2enmod "$pkgdir"/usr/sbin/a2enmod
  pushd "$pkgdir"/usr/sbin
  ln -s a2enmod a2ensite
  ln -s a2enmod a2dismod
  ln -s a2enmod a2dissite
  popd

  # create directories
  install -dm755 "$pkgdir"$_apache_dir/conf/mods-enabled
  install -dm755 "$pkgdir"$_apache_dir/conf/sites-enabled

  # install man pages
  install -dm755 "$pkgdir"/${_man_dir}
  pushd man
  sed -e 's/apache2ctl/apachectl/g' -e 's#/etc/apache2#/etc/httpd/conf#g' -i a2enmod.8 a2ensite.8
  for i in *.8; do
    gzip $i -c > "$pkgdir"/${_man_dir}/$i.gz
  done
  popd

  # install bash completion
  install -Dm644 bash_completion "$pkgdir"/etc/bash_completion.d/a2enmod

}
md5sums=('22742da70a7077d887b4beb11175e952')
md5sums=('4715accad918379c3f075e4a219c0372')
