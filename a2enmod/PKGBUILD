# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=a2enmod
pkgver=1.0
pkgrel=2
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
backup=()
options=(emptydirs)
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
md5sums=('d095bbfae144cbb83cda1fae937da693')
