# Maintainer: Qhor Vertoe <vertoe@qhor.net>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

pkgname=encompass-git
_gitname=encompass
_gitbranch="release/v0.5.0"
pkgver=4216.3b91b31
pkgrel=1
pkgdesc="Multi-currency wallet based on Electrum. Supports Bitcoin, Litecoin, Dash, Mazacoin, Viacoin (git development version)."
arch=('any')
depends=('hicolor-icon-theme'
         'python2'
         'python2-ecdsa'
         'python2-pbkdf2'
         'python2-protobuf'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-pyqt4'
         'python2-qrcode'
         'python2-requests'
         'python2-six'
         'python2-slowaes'
         'python2-tlslite'
         'python2-socksipy-branch'
         'qt4')
makedepends=('gettext'
             'git'
             'protobuf'
             'python2-pycurl'
             'python2-setuptools'
             'python2-pip')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python2-amodem: air-gapped transaction signing over audio modem'
            'python2-btchip: BTChip hardware wallet support'
            'python2-dnspython: OpenAlias plugin'
            'python2-jsonrpclib: merchant script'
            'python2-matplotlib: plot transaction history in graphical mode'
            'python2-rpyc: send commands to Encompass Python console from an external script'
            'python2-trezor: TREZOR hardware wallet support'
            'xdg-utils: update desktop icon'
            'zbar: QR code reading support')
url="https://github.com/mazaclub/encompass"
license=('GPL3')
source=(git+https://github.com/mazaclub/encompass)
sha256sums=('SKIP')
provides=('encompass')
conflicts=('encompass')
install=encompass.install

pkgver() {
  cd ${pkgname%-git}

  msg2 "Using '$_gitbranch' tree..."
  git checkout -q "$_gitbranch"
  git pull -q origin "$_gitbranch"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'

  msg2 'Installing local deps from pip...'
  pip2 install --user ltc_scrypt
  pip2 install --user darkcoin_hash
}

build() {
  cd ${pkgname%-git}

  msg2 'Compiling icons...'
  pyrcc4 icons.qrc -o gui/qt/icons_rc.py

  msg2 'Compiling protobuf description file...'
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
