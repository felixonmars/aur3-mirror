# Contributer: Matthew Bauer <mjbauer95@gmail.com>
pkgname=reggie
_pkgname=Reggie
pkgver=2
pkgrel=4
pkgdesc="Reggie! is an easy-to-use and full-featured level editor for New Super Mario Bros. Wii, created by Treeki and Tempus. (nsmbwii)"
arch=(any)
url="http://rvlution.net/$pkgname/"
license=('custom')
depends=('python' 'pyqt')
conflics=('reggie-git')
source=("http://rvlution.net/$pkgname/downloads/${_pkgname}_r${pkgver}_source.zip"
        'reggie.sh'
        'reggie.desktop'
        'reggie.mime')
md5sums=('953e68f8301c54afc2f636f441b008ea'
         'f2788d2c556bf37472a6eabf3f139344'
         '559d760060d5c21bf614a6e81c098270'
         '0e434f22292068e5394767daf7c25eff')

build() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr/share/reggie"
	cp archive.py common.py lz77.py $pkgname.py sprites.py -r ${pkgname}data ${pkgname}extras "$pkgdir/usr/share/$pkgname"

	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp readme.txt license.txt "$pkgdir/usr/share/doc/$pkgname"

	mkdir -p "$pkgdir/usr/share/mime/packages"
	cp reggie.mime "$pkgdir/usr/share/mime/packages/$pkgname.xml"

	mkdir -p "$pkgdir/usr/share/applications"
	cp reggie.desktop "$pkgdir/usr/share/applications"

	# our own executable
	mkdir -p "$pkgdir/usr/bin"
	cp ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
	chmod +x "$pkgdir/usr/bin/$pkgname"
}
