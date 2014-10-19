# Maintainer:  danyf90 <daniele.formihelli@gmail.com>
# Contributor: totoloco <totoloco@gmx.com>

pkgname=sigram-bin
_pkgname=sigram
pkgver=0.7.1
pkgrel=1
pkgdesc="A different telegram client from Sialan.labs"
arch=('i686' 'x86_64')
url="http://labs.sialan.org/projects/sigram"
license=('GPL')
depends=('qt5-base' 'qt5-declarative')
if [[ $CARCH == x86_64 ]]; then
  filename=${_pkgname}-$pkgver-linux-x64-installer.run
  source=("http://dl.labs.sialan.org/$filename")
  sha512sums=('4ce4fea9ebc79dcbc78a788f06b9ff11b37462c5d43a84f1def6a19a09715758a2bc9506511ffe4fa8c5553af32261f06c4dd5fca1818b5004e5c742ab9549f2')
else
  filename=${_pkgname}-$pkgver-linux-installer.run
  source=("http://dl.labs.sialan.org/$filename")
  sha512sums=('a79f0cef4963569add919387aa0135bb70c9060225ac3e1bd0ec79267ee547cfd6e3e4510dce30081eed3cb7ecb896ea63d455d0fa92501a9901e7b37653a267')
fi

source+=("$_pkgname.desktop")
sha512sums+=('364a3cfd82f8e12ba7117f67c2d3ab6bf32bb8a16f997742b1a5955263536095aeac59e19f3161bf266228d9b164dafbb7a30c9dc7221bdb89dbefa96b43a519')

package() {
  cd $srcdir

  install -d $pkgdir/{opt,usr/bin}

  chmod a+x $filename

  ./$filename --prefix $pkgdir/opt --mode unattended

  rm $pkgdir/opt/uninstall
  rm $pkgdir/opt/Uninstall\ Sigram.desktop
  rm $pkgdir/opt/uninstall.dat

  install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop


  # fix undefined symbol: EVP_idea_cbc error
  ln -sf /usr/lib/libcrypto.so.1.0.0 $pkgdir/opt/$_pkgname/libs/libcrypto.so.1.0.0
}