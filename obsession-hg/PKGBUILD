# Maintainer: mimas <mimasgpc@free.fr>

_pkgname=obsession
pkgname=$_pkgname-hg
pkgver=17.be73c8ac1bd1
pkgrel=1
pkgdesc="Openbox session tools"
arch=('i686' 'x86_64')
provides=("obsession")
conflicts=("obsession")
url=https://bitbucket.org/fabriceT/obsession
license=('GPL')
depends=('glib2' 'gtk2' 'dbus' 'systemd')
optdepends=('xlockmore' 'lxdm' 'gdm')
source=(hg+https://bitbucket.org/fabriceT/$_pkgname)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$_pkgname"
  make configure PREFIX=/usr/
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install PREFIX=$pkgdir/usr
}
