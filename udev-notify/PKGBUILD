pkgname=udev-notify
pkgrel=2
pkgver=22
pkgdesc="Python script to show notifications when a  device is plugged in or out"
arch=('any')
url="http://udev-notify.learnfree.eu/"
license=('GPL')
makedepends=("bzr")
depends=("python2" "python-notify" "xdg-utils")

_bzrtrunk=lp:${pkgname}
_bzrmod=${pkgname}

package() {
  cd ${srcdir}
  
  if [ -d ${_bzrmod} ]; then
    cd ${_bzrmod} && bzr up
  else
    bzr co ${_bzrtrunk}
    cd ${_bzrmod}
  fi

  # python2 fix
  find . -name *.py -exec sed -i 's|python|python2|g' {} \;

  cd src
  mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages -v
  cp -r pyudev ${pkgdir}/usr/lib/python2.7/site-packages -v
 
  mkdir -p ${pkgdir}/usr/share/udev-notify -v
  cp udev-notify.py ${pkgdir}/usr/share/udev-notify -v

  install -Dm755 udev-notify ${pkgdir}/usr/bin/udev-notify 
  install -Dm755 udev-notify-autostart.desktop ${pkgdir}/etc/xdg/autostart/udev-notify-autostart.desktop
}

# vim:set ts=2 sw=2 et:
