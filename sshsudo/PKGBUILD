pkgname=sshsudo
pkgver=0.1
pkgrel=3
pkgdesc="Script to run sudo on multiple remote computers"
arch=('i686' 'x86_64')
url="http://code.google.com/p/sshsudo"
license=('GPL3')
depends=('bash' 'sudo')
source=(http://sshsudo.googlecode.com/files/sshsudo)
md5sums=('a96e86b928891f4e5f458ad08b1b89b0') 

build() {
  install -D -m755 "$srcdir/sshsudo" "$pkgdir/usr/bin/sshsudo"
}

# vim:set ts=2 sw=2 et:
