# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
pkgname=furiuscipher
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple PyGTK client for encrypting and decrypting text via AES"
arch=('i686' 'x86_64')
url="http://www.marcus-furius.com/?page_id=23"
license=('GPL')
depends=('pycrypto' 'pygtk')
source=(http://www.marcus-furius.com/files/FuriusCipher/PyFuriusCipher.zip
        $pkgname.desktop $pkgname.launcher $pkgname.png)
md5sums=('657ac3daed6d0d1ea02bcdec9f191783'
         '518afceff3b8fc4d662902caca48e58e'
         'cbe4228e8ec815a3b56af537318c4ca0'
         '32222d043f22a8d5a06af6cd902f9e45')

build() {
  cd "$srcdir/PyFuriusCipher"
  install -Dm644 FuriusCipher.pyw "$pkgdir/usr/share/$pkgname/FuriusCipher.pyw"
  install -Dm644 MainWindow.glade "$pkgdir/usr/share/$pkgname/MainWindow.glade"
  install -Dm755 ../$pkgname.launcher "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
