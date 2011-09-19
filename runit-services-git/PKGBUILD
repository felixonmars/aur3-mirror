# Maintainer: Kevin Berry <kb@rubyists.com>
pkgname='runit-services-git'
pkgver=20110919
pkgrel=5
arch=('x86_64' 'i686')
pkgdesc="A collection of commonly used service directories"
url="http://github.com/rubyists/runit-services"
license=('custom')
provides=('runit-services')
depends=('runit-dietlibc')
makedepends=('git')
backup=('etc/sv/apache2/log/run' 'etc/sv/apache2/run' 'etc/sv/avahi/log/run' 'etc/sv/avahi/run' 'etc/sv/couchdb/log/run' 'etc/sv/couchdb/run' 'etc/sv/cups/log/run' 'etc/sv/cups/run' 'etc/sv/dbus/log/run' 'etc/sv/dbus/run' 'etc/sv/freeswitch/log/run' 'etc/sv/freeswitch/run' 'etc/sv/gdm/run' 'etc/sv/kdm/run' 'etc/sv/lighttpd2/log/run' 'etc/sv/lighttpd2/run' 'etc/sv/mysql/log/run' 'etc/sv/mysql/run' 'etc/sv/ntpd/log/run' 'etc/sv/ntpd/run' 'etc/sv/openntpd/log/run' 'etc/sv/openntpd/run' 'etc/sv/openvpn/log/run' 'etc/sv/openvpn/run' 'etc/sv/postgresql/log/run' 'etc/sv/postgresql/run' 'etc/sv/sshd/log/run' 'etc/sv/sshd/run')
source=('COPYRIGHT' "README.md")
md5sums=('69ec4109404fce21737ac93f9d844d49'
'48e57754259ba7b646ff30868b418fef')


_gitroot="git://github.com/rubyists/runit-services.git"
_gitname="runit-services"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
    else
      git clone --depth=1 $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

}

package() {
    cd "$srcdir/$_gitname/"

    install -D -m 0644 COPYRIGHT "$pkgdir/usr/share/doc/runit-services/COPYRIGHT"
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/runit-services/README.md"
    install -D -d "$pkgdir/etc/sv"

    for service in etc/sv/*;do
      cp -a $service "$pkgdir/etc/sv/"
    done
}
