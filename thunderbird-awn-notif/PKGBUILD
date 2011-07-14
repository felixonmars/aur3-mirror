# Maintainer: Kozec <kozec at kozec dot com>

pkgname=thunderbird-awn-notif
pkgver=0.4
pkgrel=4
pkgdesc="Notify Avant Window Navigator when new mails arrive in Thunderbird."
arch=('i686' 'x86_64')
url="https://addons.mozilla.org/en-US/thunderbird/addon/awn-notif/"
license=('MPL' 'GPL' 'LGPL')
_tbver=5.0
depends=("thunderbird>=$_tbver" 'avant-window-navigator' 'python2' 'dbus-python')

source=("python2-and-systemwide-install.patch"
		"fake-support-for-version-5.0.patch"
		"https://addons.mozilla.org/thunderbird/downloads/file/95598/awn-notif-${pkgver}-tb-linux.xpi"
		)

md5sums=('bb3b47a6718349a50faa2e15eba982ed'
         '2996bc98cdf8b005c0297b1292527816'
         '011cb39d44f506a9a4dd49045114b9ff')

noextract=(awn-notif-${pkgver}-tb-linux.xpi)

build() {
	cd "$srcdir"
	[ -e target ] && rm -R target
	mkdir target
	cd target
	msg "Extracting xpi..."
	bsdtar -xf ../awn-notif-${pkgver}-tb-linux.xpi
	msg "Patching..."
	patch -Np0 -i "$srcdir/python2-and-systemwide-install.patch" || return 1
	patch -Np0 -i "$srcdir/fake-support-for-version-5.0.patch" || return 1
}

package() {
	EMID=$(grep 'em:id' "$srcdir/target/install.rdf" |head -1|cut -d ">" -f 2|cut -d "<" -f 1)
	mkdir -p "$pkgdir/usr/lib/thunderbird-$_tbver/extensions/$EMID"
	cp -R "$srcdir/target/"* "$pkgdir/usr/lib/thunderbird-$_tbver/extensions/$EMID"
	chmod -R ogu-x+X "$pkgdir/usr/lib/thunderbird-$_tbver/extensions/$EMID"
	}
