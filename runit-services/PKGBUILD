# Maintainer: Kevin Berry <kb@rubyists.com>
# Maintainer: Michael Fellinger <mf@rubyists.com>
# Maintainer: Tj Vanderpoel <tj@rubyists.com>
pkgname='runit-services'
pkgver=1.1.2
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="A collection of commonly used service directories"
url="http://github.com/rubyists/runit-services"
license=('custom')
provides=('runit-services')
depends=('runit')
backup=('etc/sv/agetty-generic/finish' 'etc/sv/agetty-generic/run' 'etc/sv/agetty-tty1/finish' 'etc/sv/agetty-tty1/run' 'etc/sv/agetty-tty2/finish' 'etc/sv/agetty-tty2/run' 'etc/sv/agetty-tty3/finish' 'etc/sv/agetty-tty3/run' 'etc/sv/agetty-tty4/finish' 'etc/sv/agetty-tty4/run' 'etc/sv/agetty-tty5/finish' 'etc/sv/agetty-tty5/run' 'etc/sv/agetty-tty6/finish' 'etc/sv/agetty-tty6/run' 'etc/sv/apache2/log/run' 'etc/sv/apache2/run' 'etc/sv/avahi/log/run' 'etc/sv/avahi/run' 'etc/sv/bumblebeed/run' 'etc/sv/couchdb/log/run' 'etc/sv/couchdb/run' 'etc/sv/cron/log/run' 'etc/sv/cron/run' 'etc/sv/cups/log/run' 'etc/sv/cups/run' 'etc/sv/dbus/log/run' 'etc/sv/dbus/run' 'etc/sv/fgetty-generic/finish' 'etc/sv/fgetty-generic/run' 'etc/sv/fgetty-tty2/finish' 'etc/sv/fgetty-tty2/run' 'etc/sv/fgetty-tty3/finish' 'etc/sv/fgetty-tty3/run' 'etc/sv/freeswitch/log/run' 'etc/sv/freeswitch/run' 'etc/sv/gdm/run' 'etc/sv/gssd/log/run' 'etc/sv/gssd/run' 'etc/sv/idmapd/log/run' 'etc/sv/idmapd/run' 'etc/sv/kdm/run' 'etc/sv/lighttpd/log/run' 'etc/sv/lighttpd/run' 'etc/sv/lighttpd2/log/run' 'etc/sv/lighttpd2/run' 'etc/sv/memcached/log/run' 'etc/sv/memcached/run' 'etc/sv/mongodb/log/run' 'etc/sv/mongodb/run' 'etc/sv/mysql/log/run' 'etc/sv/mysql/run' 'etc/sv/nfs-server/finish' 'etc/sv/nfs-server/log/run' 'etc/sv/nfs-server/run' 'etc/sv/ngetty/run' 'etc/sv/ntpd/log/run' 'etc/sv/ntpd/run' 'etc/sv/openntpd/log/run' 'etc/sv/openntpd/run' 'etc/sv/openvpn/log/run' 'etc/sv/openvpn/run' 'etc/sv/postfix/log/run' 'etc/sv/postfix/run' 'etc/sv/postgresql/log/run' 'etc/sv/postgresql/run' 'etc/sv/redis/finish' 'etc/sv/redis/log/run' 'etc/sv/redis/run' 'etc/sv/rpcbind/log/run' 'etc/sv/rpcbind/run' 'etc/sv/sshd/log/run' 'etc/sv/sshd/run' 'etc/sv/statd/log/run' 'etc/sv/statd/run' 'etc/sv/syslog-ng/finish' 'etc/sv/syslog-ng/log/run' 'etc/sv/syslog-ng/run')

source=("https://s3.amazonaws.com/rubyists/aur/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz" 'rsvlog' 'COPYRIGHT' "README.md")
md5sums=('fb9aa582de561a77593b7ea58611e3c8'
         '1d70b6229d809076174d786926a9e356'
         '69ec4109404fce21737ac93f9d844d49'
         '48e57754259ba7b646ff30868b418fef')

package() {
  cd "$srcdir/$pkgname/"

  install -D -m 0755 rsvlog "$pkgdir/usr/bin/rsvlog"
  install -D -m 0644 COPYRIGHT "$pkgdir/usr/share/doc/runit-services/COPYRIGHT"
  install -D -m 0644 README.md "$pkgdir/usr/share/doc/runit-services/README.md"
  install -D -d "$pkgdir/etc/sv"

  for service in etc/sv/*;do
    cp -a $service "$pkgdir/etc/sv/"
  done
}
