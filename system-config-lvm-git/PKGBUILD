# Contributors:
#   henning mueller <henning@orgizm.net>
#   schalox <schalox at gmail dot com>
#   Florian Dejonckheere <floriandejonckheere.be>

pkgname=system-config-lvm-git
pkgver=1.1.18
_fedora_rel=1.fc19
pkgrel=4
pkgdesc='A utility for graphical configuration of Logical Volumes - git version'
arch=(any)
url="http://fedoraproject.org/wiki/SystemConfig/lvm"
license=(GPL)
depends=(gtk2 gnome-python pygtk lvm2 gksu)
makedepends=(intltool automake-1.7)
conflicts=(system-config-lvm)
source=(
  'git+https://git.fedorahosted.org/cgit/system-config-lvm.git'
)

prepare() {
  cd "$srcdir/system-config-lvm"
  echo "$(cat system-config-lvm.desktop.in | sed -e '7c \
Exec=/usr/bin/gksu /usr/bin/system-config-lvm')" > system-config-lvm2.desktop.in
  mv system-config-lvm2.desktop.in system-config-lvm.desktop.in
  cp /usr/share/aclocal/intltool.m4 aclocal.m4
  cp autogen.sh autogen2.sh
  echo "$(cat autogen.sh | sed -e 's/automake/automake-1.7/')" > autogen2.sh
  mv autogen2.sh autogen.sh
  aclocal-1.7
  ./autogen.sh
}

build() {
  cd "$srcdir/system-config-lvm"
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/system-config-lvm"
  make DESTDIR="$pkgdir" install
  ln -fs \
    /usr/share/$pkgname/$pkgname.py \
    "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('SKIP')
