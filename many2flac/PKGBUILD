# Maintainer: Army
# Contributor: m0rph < m0rph.mailbox (at) gmail.com >

pkgname=many2flac
pkgver=1.14
pkgrel=1
pkgdesc="ALAC/APE to FLAC converter script"
arch=(any)
depends=('ffmpeg' 'flac' 'mplayer')
license=('GPL3')
url=https://www.archlinux.org
source=(many2flac)
md5sums=('cd815b69f1343c1dffeb47dc134f3c14')

build() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
