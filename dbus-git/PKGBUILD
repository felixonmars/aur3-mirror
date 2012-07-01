# Contributor: Dave Reisner <d@falconindy.com>

pkgname=dbus-git
pkgver=20120630
pkgrel=1
pkgdesc="Freedesktop.org message bus system"
url="http://www.freedesktop.org/Software/dbus"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
depends=('libx11' 'expat' 'coreutils' 'filesystem')
makedepends=('git' 'xmlto')
provides=('dbus' 'dbus-core')
conflicts=('dbus' 'dbus-core')
options=('!libtool')
install=dbus.install
source=('dbus.rc'
        '30-dbus')
md5sums=('f0364f3f5dc5f653bb05d39aa36e3264'
         'd14e59575f04e55d21a04907b6fd9f3c')

_gitroot="git://anongit.freedesktop.org/git/dbus/dbus"
_gitname="dbus"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=81 \
      --with-system-pid-file=/run/dbus.pid \
      --with-system-socket=/run/dbus/system_bus_socket \
      --with-console-auth-dir=/run/console/ \
      --disable-verbose-mode --disable-static \
      --enable-inotify --disable-dnotify \
      --disable-tests --disable-asserts \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-systemd \
      --disable-developer

  make
}

package() {
  cd "$_gitname-build"

  make DESTDIR="$pkgdir" install-man

  pushd tools
  install -Dm755 "$srcdir/30-dbus" "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus"
  popd

  make DESTDIR="$pkgdir" install

  install -Dm755 "$srcdir/dbus.rc" "$pkgdir/etc/rc.d/dbus"

  rm -r "$pkgdir/var/run"

  #Fix configuration file
  sed -i -e 's|<user>81</user>|<user>dbus</user>|' "$pkgdir/etc/dbus-1/system.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus/COPYING"
}

