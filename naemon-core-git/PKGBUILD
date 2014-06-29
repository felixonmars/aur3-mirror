# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

_pkgname=naemon
_gitname=naemon-core
pkgname=naemon-core-git
pkgver=0.8.0.r149.g0028d6c
pkgrel=2
pkgdesc="System and network monitoring application"
arch=('i686' 'x86_64')
url="http://naemon.org"
license=('GPL2')
depends=('bash')
makedepends=('gperf' 'git')
optdepends=('logrotate'
            'thruk: Webinterface'
            'monitoring-plugins')
backup=('etc/logrotate.d/naemon' 'etc/naemon/conf.d/commands.cfg'
  'etc/naemon/conf.d/contacts.cfg' 'etc/naemon/conf.d/localhost.cfg'
  'etc/naemon/conf.d/printer.cfg' 'etc/naemon/conf.d/switch.cfg'
  'etc/naemon/conf.d/templates/contacts.cfg'
  'etc/naemon/conf.d/templates/hosts.cfg'
  'etc/naemon/conf.d/templates/services.cfg'
  'etc/naemon/conf.d/timeperiods.cfg'
  'etc/naemon/conf.d/windows.cfg' 'etc/naemon/init.d/naemon'
  'etc/naemon/naemon.cfg' 'etc/naemon/resource.cfg')
install=$_gitname.install
source=(git://github.com/naemon/$_gitname.git
        $_pkgname.service)
md5sums=('SKIP'
         'fe8dfbfc15a7339f02493448a5225b1e')

pkgver() {
  cd "$srcdir"/$_gitname

  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' 
}

build() {
  cd "$srcdir"/$_gitname

  libtoolize
  aclocal
  autoheader
  automake --add-missing
  autoconf
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --datadir="/usr/share/naemon" \
              --libdir="/usr/lib/naemon" \
              --localstatedir="/var/lib/naemon" \
              --sysconfdir="/etc/naemon" \
              --mandir="/usr/share/man" \
              --enable-event-broker \
              --with-pluginsdir="/usr/lib/naemon/plugins" \
              --with-tempdir="/var/cache/naemon" \
              --with-checkresultdir="/var/cache/naemon/checkresults" \
              --with-logdir="/var/log/naemon" \
              --with-logrotatedir="/etc/logrotate.d" \
              --with-naemon-user="naemon" \
              --with-naemon-group="naemon" \
              --with-lockfile="/var/run/naemon/naemon.pid" \
              --with-htmlurl="/naemon"
  make
}

package() {
  cd "$srcdir"/$_gitname

  make DESTDIR="$pkgdir"/ install

  install -d "$pkgdir"/var/lib/$_pkgname

  chown -R 44:44 "$pkgdir"/var/{cache,lib,log}/$_pkgname \
    "$pkgdir"/etc/naemon/resource.cfg

  install -Dm644 "$srcdir"/$_pkgname.service \
    "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
}
