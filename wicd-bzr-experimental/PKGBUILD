# Contributor: Sharn <go__cart91@hotmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=wicd-bzr-experimental
pkgver=798
pkgrel=1
pkgdesc="Wired and wireless network manager which aims to provide a simple interface to connect to networks with a wide variety of settings. Experimental 1.7 branch - has wicd-curses cli ui"
arch=('i686' 'x86_64')
url="http://wicd.sourceforge.net/"
license=('GPL')
depends=('python2-dbus' 'pygtk' 'dhclient' 'ethtool' 'wpa_supplicant' 'python2-urwid')
makedepends=('bzr')
provides=('wicd')
conflicts=('wicd' 'wicd-bzr')
replaces=('wicd' 'wicd-bzr')
install=wicd.install
source=()
md5sums=()

_bzrtrunk=lp:wicd
_bzrmod=1.7

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrtrunk} -q #-r ${pkgver}

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  if [ -d ./wicd-build ]; then
    rm -rf ./wicd-build
  fi
  cp -r ./wicd ./wicd-build
  cd ./wicd-build

  msg "Starting make..."

  install -d -m 755 $pkgdir/etc
  touch $pkgdir/etc/arch-release

  # Configure & install
  python2 setup.py configure
  #python setup.py get_translations
  python2 setup.py install --root $pkgdir


  # Add custom rc.d script
  #cd ${startdir}
  #install -D -m755 wicd-daemon $pkgdir/etc/rc.d/wicd

  # Add missing directories and delete useless one
  #rm -r $pkgdir/pkg/usr/share/autostart
  #rm $pkgdir/etc/arch-release

}
