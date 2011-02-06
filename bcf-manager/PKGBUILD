# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=bcf-manager
pkgver=0.1
pkgrel=2
pkgdesc="A fast command-line connection manager"
arch=('i686' 'x86_64')
url="http://code.google.com/p/bfc-manager/"
license=('GPL3')
depends=('bash' 'openssl')
optdepends=('openssh: For SSH support')
source=(http://bfc-manager.googlecode.com/files/$pkgname.sh)
md5sums=('77b4f65592086278ab48c9cc49222a57') 

build() {

  /bin/true
}
package() {
  cd $srcdir/

  install -d $pkgdir/usr/bin
  
  install -Dm755 bcf-manager.sh $pkgdir/usr/bin/bfc-manager
}

# vim:set ts=2 sw=2 et:
