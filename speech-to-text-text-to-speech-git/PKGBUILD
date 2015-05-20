# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=speech-to-text-text-to-speech-git
pkgver=20150519
pkgrel=2
pkgdesc="voice commander (git version)"
arch=('i686' 'x86_64')
url="http://github.com/taylorchu/lana"
license=('GPL2')
depends=('alsa-utils' 'mpg123')
makedepends=('git' 'go')
conflicts=()
provides=()
options=('!strip')

build() {
	GOPATH="$srcdir" go get -v github.com/taylorchu/lana/{commander,text-to-speech,speech-to-text}
}

package() {
	mkdir "$pkgdir/usr"
	cp -r "$srcdir/bin" "$pkgdir/usr"
}

