# Maintainer:  WinterXMQ <WinterXMQ at gmail dot com
# Contributor: WinterXMQ <WinterXMQ at gmail dot com

pkgname=goagent-gtk
_pkgname=GoAgent
pkgver=20140118
pkgrel=2
pkgdesc='Gae Proxy from grpproxy/wallproxy Date 14/01/18, with GTK Windows'
arch=("any")
url="gttp://goagent.googlecode.com"
license=("GPL2")
makedepends=('git')
depends=('python2' 'python2-pyopenssl')
optdepends=(
    'python2-gevent>0.99: for better performance'
    'python2-crypto: optimazation for RC4'
	'python2-pacparser: PAC proxy support'
)
conflicts=('goagent' 'goagent-git')
provides=('goagent' 'goagent-git')
source=(
	"${_pkgname}.tar.gz"
)
sha512sums=(
	'e0bbae4cd6c98e22ed33cb668839d6129563407d41926abfbda2e19fb3a141054bbf58953aa77dd87cbb0a8a2102fac4a2f4aab2f54a456754ad85cbc6ec5e99'
)
backup=('etc/goagent')
install='goagent-gtk.install'

#pkgver() {
#	cd "$srcdir/$pkgname"
#	git log -1 --rotmat="%cd" --date=short | sed 's|-||g'
#}

package() {
	tar zxvf ${_pkgname}.tar.gz
	mkdir -p $pkgdir/usr/share/
	cp -r ${_pkgname} $pkgdir/usr/share/
	install -Dm644 ${_pkgname}/local/goagent.desktop \
		$pkgdir/usr/share/applications/goagent.desktop
	mkdir -p $pkgdir/etc
	ln -sf /usr/share/$_pkgname/local/proxy.ini \
		$pkgdir/etc/goagent
#	cd "$srcdir/$pkgname"
#	sed -i -e "s|^#!/usr/bin/env python|#!/usr/bin/env python}2|" \
#		"local/proxy.py"
#	echo '[Desktop Entry]
#Categories=Network;Proxy;
#Name=GoAgent
#Icon=/usr/share/GoAgent/local/goagent-logo.png
#Exec=/usr/share/GoAgent/local/goagent-gtk.py
#StartupNotify=true
#Terminal=false
#Type=Application' >> \
#		local/goagent.desktop
#
#	install -Dm755 local/proxy.py \
#		"$pkgdir/usr/share/$_pkgname/local/proxy.py"
#	install -Dm644 local/proxy.pac \
#		"$pkgdir/usr/share/$_pkgname/local/proxy.pac"
#	install -Dm644 local/cacert.pem \
#		"$pkgdir/usr/share/$_pkgname/local/cacert.pem"
#	install -Dm644 local/SwitchyOptions.bak \
#		"$pkgdir/usr/share/$_pkgname/local/SwitchyOptions.bak"
#	install -Dm644 local/SwitchySharp.crx \
#		"$pkgdir/usr/share/$_pkgname/local/SwitchySharp.crx"
#	install -Dm755 local/goagent-gtk.py \
#		"$pkgdir/usr/share/$_pkgname/local/goagent-gtk.py"
#	install -Dm644 ../../goagent-logo.png \
#		"$pkgdir/usr/share/$_pkgname/local/goagent-logo.png"
#	install -Dm644 local/goagent.desktop \
#		"$pkgdir/usr/share/applications/goagent.desktop"
#	install -Dm644 local/proxy.ini \
#		"$pkgdir/etc/goagent"
#	ln -sf "/etc/goagent" \
#		"$pkgdir/usr/share/$_pkgname/local/proxy.ini"
#	cp -r server "$pkgdir/usr/share/$_pkgname/"
#	rm "$pkgdir/usr/share/$_pkgname/server/uploader.bat"

	# system service
	install -Dm644 "$_pkgname/local/goagent.service" \
		"$pkgdir/usr/lib/systemd/system/goagent.service"
}
