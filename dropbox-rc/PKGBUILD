# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=dropbox-rc
pkgver=3.2.3
pkgrel=1
pkgdesc="Dropbox Release Candidate"
arch=('i686' 'x86_64')
url="https://www.dropboxforum.com/hc/communities/public/topics/200210355-Desktop-Client-Beta"
license=('custom')
depends=('libsm')
conflicts=('dropbox' 'dropbox-experimental')
options=('!strip')

source_i686=(https://d1ilhw0800yew8.cloudfront.net/client/dropbox-lnx.x86-$pkgver.tar.gz)
source_x86_64=(https://d1ilhw0800yew8.cloudfront.net/client/dropbox-lnx.x86_64-$pkgver.tar.gz)

md5sums_i686=('aa380b97295eace3dc04f09743fc44aa')
md5sums_x86_64=('f518208f9ba649ddb9f3ea83e3553adb')

package() {
	install -d "$pkgdir"/opt
	[[ $CARCH == x86_64 ]] && _arch=x86_64 || _arch=x86
	cp -R "$srcdir"/.dropbox-dist/dropbox-lnx.$_arch-$pkgver "$pkgdir"/opt/dropbox

	find "$pkgdir"/opt/dropbox/ -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/dropbox/dropboxd
	chmod 755 "$pkgdir"/opt/dropbox/dropbox

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/dropbox/dropboxd "$pkgdir"/usr/bin/dropboxd
}

