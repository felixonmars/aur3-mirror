# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=brackets-deb
_pkgname=brackets
_build=34
pkgver=sprint$_build
pkgrel=1
pkgdesc="A code editor for HTML, CSS and JavaScript. "
arch=("i686" "x86_64")
url="http://brackets.io"
license=("MIT")
depends=("gconf" "nodejs" "nspr" "nss" "systemd")
makedepends=("prelink")
optdepends=(
	"google-chrome: to enable Live Preview"
	"gnuplot: to enable node benchmarking"
	"gtk2: to enable native UI"
	"ruby: to enable LiveDevelopment Inspector"
	"desktop-file-utils: for update-desktop-database"
	"hicolor-icon-theme: for hicolor theme hierarchy"
)
provides=("brackets=$pkgver")
conflicts=('brackets' 'brackets-git')
install=$pkgname.install

if [[ "$CARCH" == "i686" ]]; then
	sha512sums=("65fd66ad75ef023d7ee660c9416a46413a0bd0b6d3f289be5e51b874ffbaac3fdc871f5460dc50b81194b4632ae40ddbe61102b672588919df1c2d73de8e9865")
	_arch=32
	_
elif [[ "$CARCH" == "x86_64" ]]; then		sha512sums=("eec0829ee3de88e4f2f7ae63d8d09afc42cd8348f57b52c129cbc3ce252dc7df4904728d45fa24a3ce4339d59f711f2f699ad7ab579c8c3adfbba48a42fa9acf")
	_arch=64
fi

source=("brackets-sprint-$_build-LINUX$_arch.deb::http://download.brackets.io/file.cfm?platform=LINUX$_arch&build=$_build")

export DLAGENTS='http::/usr/bin/curl -A "Mozilla/4.0" -fLC - --retry 3 --retry-delay 3 -o %o %u'

prepare() {
	cd $srcdir

	msg2 "  -> Extracting files..."
	tar -xf data.tar.gz

	msg2 "  -> Fixing executable stack..."
	execstack -c opt/$_pkgname/Brackets

}

package() {

	msg2 "  -> Installing program..."

	install -d $pkgdir/opt
	cp -r opt/$_pkgname $pkgdir/opt/$_pkgname

	chmod -R a+rw $pkgdir/opt/$_pkgname/samples

	install -d $pkgdir/usr/bin
	ln -s /opt/brackets/brackets $pkgdir/usr/bin/$_pkgname

	msg2 "  -> Installing icons..."
	local _icon_dir="usr/share/icons/hicolor"
	install -d $pkgdir/$_icon_dir/scalable/apps
	install -Dm644 $_icon_dir/scalable/apps/$_pkgname.svg $pkgdir/$_icon_dir/scalable/apps/$_pkgname.svg
	for _icon in "opt/brackets/appshell"*.png; do
		local _icon_size=${_icon##*/appshell}
		install -d $pkgdir/$_icon_dir/${_icon_size%.png}x${_icon_size%.png}/apps
		install -Dm644 $_icon $pkgdir/$_icon_dir/${_icon_size%.png}x${_icon_size%.png}/apps/$_pkgname.png
	done

	msg2 "  -> Installing .desktop file..."
	install -d $pkgdir/usr/share/applications
	sed 's/Development/Development;/' opt/$_pkgname/$_pkgname.desktop > $pkgdir/usr/share/applications/$_pkgname.desktop


	msg2 "  -> Installing license..."
	install -Dm755 usr/share/doc/$_pkgname/copyright $pkgdir/usr/share/licenses/$_pkgname/copyright
}