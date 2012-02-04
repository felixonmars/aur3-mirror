# Contributor lh <jarryson AT gmail com>

pkgname=indicator-workspaces-bzr
_realname=${pkgname/-bzr}
pkgver=22
pkgrel=1
arch=('any')
pkgdesc="Provides a replacement for panel applet switcher."
url="https://launchpad.net/${_realname}"
license=('GPL')
groups=('lh' 'ayatana')
depends=('indicator-messages' 'python-appindicator' 'python-wnck' 'python2-gconf')
makedepends=()
provides=("$_realname")
conflicts=("$_realname")
provides=()
source=()
install=$_realname.install

_bzrtrunk=lp:$_realname
_bzrmod=$_realname

apatch(){
  for i in ${startdir}/patches/*.patch; do
      msg2 "$i"
      patch -Np0 -i $i
  done
}

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  else
    cd ${_bzrmod} && bzr pull -r ${pkgver}
    cd ..
  fi

  msg "BZR checkout done or server timeout"
}
package(){
  cd ${srcdir}/${_bzrmod}
  
  install -d ${pkgdir}/usr/share/icons/ubuntu-mono-{light,dark}/status/24/
  install -m644 share/ubuntu-mono-dark/status/24/* ${pkgdir}/usr/share/icons/ubuntu-mono-dark/status/24/
  install -m644 share/ubuntu-mono-light/status/24/* ${pkgdir}/usr/share/icons/ubuntu-mono-light/status/24/

  install -d ${pkgdir}/usr/share/icons/hicolor/24x24/status
  install -m644 share/ubuntu-mono-light/status/24/* ${pkgdir}/usr/share/icons/hicolor/24x24/status/

  install -Dm644 workspaces-preferences.glade ${pkgdir}/usr/share/indicator-workspaces/workspaces-preferences.glade
  install -Dm755 indicator-workspaces ${pkgdir}/usr/bin/indicator-workspaces
}