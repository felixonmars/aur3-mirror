# Contributor: Sharn <go__cart91@hotmail.com>

pkgname=wicd-bzr-nacl
pkgver=305
pkgrel=1
pkgdesc="Wired and wireless network manager which aims to provide a simple interface to connect to networks with a wide variety of settings. nacls experimental branch - cursesui"
arch=('i686' 'x86_64')
url="http://wicd.sourceforge.net/"
license=('GPL')
depends=('dbus-python' 'pygtk' 'dhclient' 'ethtool' 'wpa_supplicant' 'python-urwid')
makedepends=('bzr')
provides=('wicd')
conflicts=('wicd' 'wicd-svn' 'wicd-bzr')
replaces=('wicd' 'wicd-svn' 'wicd-bzr')
install=wicd.install
source=()
md5sums=()

_bzrtrunk=lp:~nacl/wicd/experimental-nacl
_bzrmod=experimental-nacl

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrtrunk} -q -r ${pkgver}

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  msg "Starting make..."

  install -d -m 755 $pkgdir/etc
  touch $pkgdir/etc/arch-release

  # Configure & install
  python setup.py configure || return 1
  #python setup.py get_translations
  python setup.py install --root ${startdir}/pkg/ || return 1


  # Add custom rc.d script
  cd ${startdir}
  install -D -m755 wicd-daemon pkg/etc/rc.d/wicd

  # Add missing directories and delete useless one
  rm -r ${startdir}/pkg/usr/share/autostart
  rm $pkgdir/etc/arch-release

}
