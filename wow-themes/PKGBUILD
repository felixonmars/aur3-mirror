# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=wow-themes
pkgver=latest
pkgrel=1
pkgdesc="Nice looking themes collection for gtk2, metacity, xfwm4 and openbox."
arch=('any')
url="http://gnome-look.org/content/show.php/WoW?content=125065"
license=('GPL')
optdepends=('gtk-engines: gtk themes'
            'gtk-engine-murrine: gtk themes'
            'metacity: metacity themes'
            'xfwm4: xfwm4 themes'
            'openbox: openbox themes')
source=(http://gnome-look.org/CONTENT/content-files/125065-WoW-Latest.zip)
md5sums=('dbdcc6f010884e73cbc490fb8806e9fd')
sha1sums=('addc6ba57ccb6a205537b15515f960211ec4a26f')

build() {
	cd "$srcdir"

	msg2 "Decompressing inner archives..."
	find *.tar.gz -exec tar xf '{}' \;
}


package() {
	cd "$srcdir"
	install -d "$pkgdir"/usr/share/themes

	msg2 "Copying themes..."
	for f in *; do
		[ -d "$f" ] && cp -r "$f" "$pkgdir"/usr/share/themes
	done

	msg2 "Adjusting permissions..."
	find "$pkgdir" -type f -exec chmod 644 '{}' \; 
}

# vim: set ft=sh ts=3 sw=3 tw=0:
