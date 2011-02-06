pkgname=eee-control-git
pkgver=20090410
pkgrel=1
pkgdesc="A utility for the EeePC family which allows the user to modify the FSB, toggle hardware on and off and more."
arch=('i686' 'x86_64')
url="http://greg.geekmind.org/eee-control"
license=('GPL')
depends=('acpid' 'dbus-python' 'gconf' 'gnome-python' 'pygtk' 'python-notify')
makedepends=(git)
conflicts=('acpi-eeepc-generic')
source=(eee-control.rc)
md5sums=('f66a56858f0e9ee4b274c55df5fcf7fc')

_gitname="eee-control"
_gitroot="http://greg.geekmind.org/git/eee-control.git"

build() {
  cd ${srcdir}

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "Locale files are up-to-date."
  else
    git clone $_gitroot
  fi

  install -Dm 755 ${srcdir}/eee-control.rc ${pkgdir}/etc/rc.d/eee-control || return 1
  cd ${srcdir}/${_gitname}
  python setup.py install --prefix=${pkgdir}/usr || return 1
  rm ${pkgdir}/usr/bin/eee-control-setup.sh
}
