# BETA
pkgname=electrum-doge
pkgver=1.9.8.257.g45d1cd3
pkgrel=1
pkgdesc="Lightweight DogeCoin wallet (beta from git)"
arch=('any')
depends=('python2' 'python2-ecdsa' 'python2-pbkdf2' 'python2-pyasn1' 'python2-pyasn1-modules' 'python2-pyqt4' 'python2-qrcode' 'python2-requests' 'python2-sip' 'python2-slowaes' 'python2-tlslite' 'qt4' 'sip')
makedepends=('gettext' 'python2-pycurl' 'python2-setuptools' 'git')
optdepends=('desktop-file-utils: update desktop database'
            'python2-ltc_scrypt: much faster block verification'
            'python2-rpyc: send commands to Electrum-LTC Python console from an external script'
            'python2-zbar: QR code reading support')
url="https://github.com/paybee/electrum-doge"
license=('GPL3')
##install='electrum-doge.install'
source=('git+https://github.com/paybee/electrum-doge#branch=master')
sha1sums=('SKIP')

_gitname='electrum-doge'

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd $_gitname

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'

  msg 'Changing electrum.mo to electrum-doge.mo...'
  find . -type f -print0 | xargs -0 sed -i 's#electrum.mo#electrum-doge.mo#g'
}

build() {
  cd $_gitname

  msg 'Building...'
  python2 mki18n.py
  pyrcc4 icons.qrc -o gui/qt/icons_rc.py
  python2 setup.py build
}

package() {
  cd $_gitname

  msg 'Installing...'
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

