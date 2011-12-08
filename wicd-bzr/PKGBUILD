# Maintainer: kiooeht <kiooeht at gmail dot com>
# Contributor: Tuxce <tuxce.net@gmail.com>

_appname=wicd
_suffix=-bzr
pkgname=${_appname}${_suffix}
pkgver=660
pkgrel=1
pkgdesc="Wired and wireless network manager which aims to provide a simple interface to connect to networks with a wide variety of settings."
arch=('any')
url="http://wicd.sourceforge.net/"
license=('GPL2')
depends=('python2' 'dbus-python' 'dhcpcd' 'wpa_supplicant' 'wireless_tools' 'ethtool' 'python-urwid' 'xdg-utils')
optdepends=('python-wpactrl: needed if you want to use the new experimental ioctrl backend'
            'python-iwscan: needed if you want to use the new experimental ioctrl backend'
            'gksu: needed to access some preferences in gtk interface'
            'notification-daemon: needed if you want notifications'
            'python-notify: needed if you want notifications'
            'hicolor-icon-theme')


makedepends=('bzr' 'python2')
provides=('wicd' 'wicd-gtk')
conflicts=('wicd' 'wicd-gtk')
install=${_appname}.install
source=()
options=('emptydirs')
backup=('etc/wicd/encryption/templates/active')
md5sums=()
_bzrtrunk=lp:wicd
_bzrmod=wicd

build() {
  cd ${srcdir}

  msg "Connecting to the server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
    cd ..
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

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
                            --python=/usr/bin/python2
}

package() {
  cd ${srcdir}/${_bzrmod}-build
  python2 setup.py install --root=$pkgdir --optimize=1

  # Add custom rc.d script
  install -Dm755 init/arch/wicd $pkgdir/etc/rc.d/wicd

  cd build/lib/wicd
  for i in *.py; do
    install -Dm 755 $i ${pkgdir}/usr/lib/wicd/$i
  done

  cd ${pkgdir}
  find ${pkgdir} -name '*.py' | while read FILE; do
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/usr/bin/env python\([^2]\)$|#!/usr/bin/env python2\1|" \
      "$FILE"
  done

  rm -rf ${pkgdir}/usr/share/autostart
}
