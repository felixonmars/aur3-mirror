# Contributor: Scott Cunningham <scott@netsoc.tcd.ie>
pkgname=skype-api-pidgin
pkgver=1.0
pkgrel=1
pkgdesc="Skype API for Pidgin/libpurple (Finch etc)"
arch=('i686' 'x86_64')
url="http://eion.robbmob.com/"
license=('GPLv3')
depends=('libpurple' 'pidgin')
source=http://eion.robbmob.com/skype4pidgin.deb

build() {
		
		ar -x skype4pidgin.deb
		tar -xzvf data.tar.gz --exclude='libskypearm.so' -C "$pkgdir/"

}
sha256sums=('b27f773c91f14ffbd2f1e7d1cd8454be44020814d43feb3c41534e7c4325cf4d')
