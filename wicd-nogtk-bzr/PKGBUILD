
_appname=wicd
_suffix=-nogtk-bzr
pkgname=${_appname}${_suffix}
pkgver=565
pkgrel=1
pkgdesc="New and alternative wireless/wired network management utility - no gtk gui."
arch=('any')
url="http://wicd.sourceforge.net/"
license=('GPL2')
depends=('python2' 'dbus-python' 'dhcpcd' 'wpa_supplicant' 'wireless_tools' 'ethtool' 'python-urwid' 'consolekit' 'pygobject')
optdepends=('python-wpactrl:	needed if you want to use the new experimental ioctrl backend'
            'python-iwscan:	needed if you want to use the new experimental ioctrl backend')

replaces=('wicd' 'wicd-nogtk')
provides=('wicd-nogtk') # or part of it anyway
install=${_appname}.install
source=(wicd-daemon)
options=('emptydirs')
backup=('etc/wicd/encryption/templates/active')
md5sums=('f40e5f59998d0829707a7c9976afa8f8')
_bzrtrunk=lp:wicd
_bzrmod=wicd

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  bzr branch ${_bzrtrunk} -q -r ${pkgver}

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  

#  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
#  export PYTHON=python2
  python2 setup.py configure --no-install-init \
                            --resume=/usr/share/wicd/scripts/ \
                            --suspend=/usr/share/wicd/scripts/ \
                            --verbose \
                            --python=/usr/bin/python2 \
                            --no-install-gtk \
                            --no-use-notifications
}

package() {
  cd ${srcdir}/${_bzrmod}-build
  python2 setup.py install --root=$pkgdir

  # Add custom rc.d script
  install -Dm755 $srcdir/wicd-daemon $pkgdir/etc/rc.d/wicd

  cd build/lib/wicd
  for i in *.py; do
    install -Dm 755 $i ${pkgdir}/usr/lib/wicd/$i
  done
  
  rm -rf ${pkgdir}/usr/share/autostart
}

