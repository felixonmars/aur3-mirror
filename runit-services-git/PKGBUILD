# Maintainer: Kevin Berry <kb@rubyists.com>
pkgname='runit-services-git'
pkgver=20110430
pkgrel=3
arch=('x86_64' 'i686')
pkgdesc="A collection of commonly used service directories"
url="http://github.com/rubyists/runit-services"
license=('custom')
provides=('runit-services')
depends=('runit')
makedepends=('git')
backup=('etc/sv/avahi/log/run' 'etc/sv/avahi/run' 'etc/sv/couchdb/log/run' 'etc/sv/couchdb/run' 'etc/sv/cups/log/run' 'etc/sv/cups/run' 'etc/sv/dbus/log/run' 'etc/sv/dbus/run' 'etc/sv/gdm/run' 'etc/sv/kdm/run' 'etc/sv/openntpd/log/run' 'etc/sv/openntpd/run' 'etc/sv/openvpn/log/run' 'etc/sv/openvpn/run' 'etc/sv/postgresql/log/run' 'etc/sv/postgresql/run' 'etc/sv/sshd/log/run' 'etc/sv/sshd/run')
source=('COPYRIGHT' "README.md")
md5sums=('69ec4109404fce21737ac93f9d844d49'
'48e57754259ba7b646ff30868b418fef')


_gitroot="https://github.com/rubyists/runit-services.git"
_gitname="runit-services"

build() {
cd "$srcdir"
msg "Connecting to GIT server...."

if [ -d $_gitname ] ; then
cd $_gitname && git pull origin
msg "The local files are updated."
else
git clone $_gitroot $_gitname
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

rm -rf "$srcdir/$_gitname-build"
git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
cd "$srcdir/$_gitname-build"

#
# BUILD HERE
#

}

package() {
cd "$srcdir/$_gitname-build/"
install -D -d "$pkgdir/etc/sv"
for service in etc/sv/*;do
cp -a $service "$pkgdir/etc/sv/"
done
}
