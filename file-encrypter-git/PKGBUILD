# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=file-encrypter-git
pkgver=80.ecef6c3
pkgrel=1
pkgdesc="GUI utility for encrypting and decrypting files easily using GnuPG"
arch=('any')
url="https://github.com/wifiextender/file-encrypter"
license=('GPL')
depends=('p7zip' 'python2-gobject' 'python2' 'webkitgtk' 'pywebkitgtk' 'gpgme' 'libgpg-error')
makedepends=('git')
source=('git+https://github.com/wifiextender/file-encrypter.git'
         encrypt_decrypt_gui.desktop
         encrypt_decrypt.sh)
md5sums=('SKIP'
         'dd1d9ee6d9c94797a68d6450cb3d924b'
         '60562a3520cd15a730f82ec70c28c026')

package() {
  cd $srcdir

  # Program
  install -d $pkgdir/usr/share/file-encrypter
  cp -rf file-encrypter/* $pkgdir/usr/share/file-encrypter

  # Start file
  install -Dm755 encrypt_decrypt.sh $pkgdir/usr/bin/encrypt_decrypt

  # Desktop icon
  install -Dm644 encrypt_decrypt_gui.desktop $pkgdir/usr/share/applications/encrypt_decrypt_gui.desktop
  install -Dm644 file-encrypter/gui/enc_data/logo.png $pkgdir/usr/share/pixmaps/encrypt_decrypt_logo.png
}

pkgver() {
  cd $srcdir/file-encrypter
  echo $(git rev-list --count master).$(git rev-parse --short master)
}