# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=exdongle
pkgname=$_pkgname-git
pkgver=20101222
pkgrel=1
pkgdesc="provides 'AutoRun' capabilities to Linux systems (based on a script by Gogodidi)"
arch=('any')
url="https://wiki.archlinux.org/index.php/Execute_on_usb_insert"
license=('unknown')
groups=('winxp')
depends=('bash')
makedepends=('git')
optdepends=('udisksie' 'udev' 'zenity' 'rsync' 'openssl')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
backup=(etc/exdongle.conf etc/exdongle.key)
options=()
install=exdongle.install
changelog=ChangeLog
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/matthewbauer/exdongle.git"
_gitname="$_pkgname"

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

}

package() {
  cd "$srcdir/$_gitname"

  install -D -m775 exdongle $pkgdir/usr/bin/exdongle
  install -D -m775 exdongle.conf $pkgdir/etc/exdongle.conf
  install -D -m660 exdongle.key $pkgdir/etc/exdongle.key
  install -D -m777 autorun.example $pkgdir/usr/share/exdongle/autorun.example
  install -D -m777 udev.example $pkgdir/usr/share/exdongle/udev.example
  install -D -m777 udiskie.example $pkgdir/usr/share/exdongle/udiskie.example
  install -D -m644 README $pkgdir/usr/share/doc/exdongle/README
}

# vim:set ts=2 sw=2 et:
