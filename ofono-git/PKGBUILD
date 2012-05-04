pkgname=ofono-git
pkgver=20120503
pkgrel=1
pkgdesc="mobile manager"
url="http://ofono.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('dbus-core' 'modemmanager' 'glib2' 'bluez' 'udev')
provides=('ofono')
md5sums=('88ece7cbf1d0d289545ce4f8553fdab8'
         '82d4734075e355a45dbfc8a57a51a2ec')

_gitroot="https://git.kernel.org/pub/scm/network/ofono/ofono.git"
_gitname="ofono"

build() {
  cd $srcdir

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin || return 1
  else
    git clone $_gitroot || return 1
  fi
  
  cd $srcdir/$_gitname

  ./bootstrap-configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var

  make || return 1
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir/" install
  install -Dm755 $srcdir/$_gitname/src/ofono.conf $pkgdir/etc/dbus-1/system.d/ofono.conf
  install -Dm755 $srcdir/$_gitname/src/ofono.service $pkgdir/usr/lib/systemd/system/ofono.service
}
