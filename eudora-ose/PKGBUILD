# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

pkgname=eudora-ose
pkgver=1.0
pkgrel=1
pkgdesc="Email client that combines Mozilla's Thunderbird with code, features, and GUI elements from Qualcomm's Eudora"
arch=('i686')
license=('GPL')
depends=('kernel26>=2.2.14' 'glibc>=2.3.2' 'gtk2' 'fontconfig' 'libstdc++5')
url="https://wiki.mozilla.org/Eudora_OSE"
source=("http://eudora.com/download/eudora/$pkgver/EudoraOSE-$pkgver.en-US.linux-i686.tar.bz2")
md5sums=('9373a46cc1e64cfafb5c720b6c7ed732')

build() {
	msg "Nothing to compile for $pkgname"
}

package() {
  cd $srcdir/
  
  # Install the compiled app to /opt
  mkdir -p $pkgdir/opt/
  cp -r eudora $pkgdir/opt/

  # Create a symlink to /usr/bin
  mkdir -p $pkgdir/usr/bin/
  ln -sf /opt/eudora/eudora $pkgdir/usr/bin/eudora
}

# vim:set ts=2 sw=2 et:
