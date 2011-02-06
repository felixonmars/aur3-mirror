# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=waluploader
pkgver=0.1
pkgrel=2
pkgdesc="Upload pictures from command line to Walmart Canada's photo service"
arch=('i686' 'x86_64')
url="http://code.google.com/p/waluploader"
license=('MIT')
depends=('bash' 'curl')
source=(http://waluploader.googlecode.com/files/uploader.sh 'LICENSE')
md5sums=('958b8ef802e82cc7d4a335f63b9f8fa6' \
         '4a647bb0c05cbec72713b634e5bafba8') 

build() {
  
  /bin/true
}
package() {

  cd $srcdir/
  
  install -d $pkgdir/usr/{bin,share/licenses/$pkgname}
  
  install -Dm755 uploader.sh $pkgdir/usr/bin/waluploader
  
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
