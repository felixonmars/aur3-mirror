# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
pkgname=etrn-poke
pkgver=0.1.1
pkgrel=1
pkgdesc="Script to poke a backup MX using ETRN"
arch=(any)
url="http://fukawi2.nl/index.php?page=code-etrn-poke"
license=('GPL')
depends=('fetchmail' 'postgresql-client')
backup=("etc/$pkgname/options.conf")
source=(etrn-poke options.conf)
md5sums=('6db5ba44dad88820e173a6bbfd2dbc1b'
         'f367c8f84e89e96ff8fc84b414061419')

build() {
  msg "Nothing to compile for $pkgname"
}

package() {
	install -Dm755 -g12 $pkgname $pkgdir/usr/bin/$pkgname || return 1
	install -Dm600 -g12 options.conf $pkgdir/etc/$pkgname/options.conf || return 1
}

# vim:set ts=2 sw=2 et:
