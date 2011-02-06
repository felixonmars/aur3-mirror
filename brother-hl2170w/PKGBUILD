# Contributor: Liming Wang <lmwang+aur@gmail.com>
# Contributor: Loui Chang <louipc dot. ist at@ noSPAM gmail.com>
# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>

pkgname=brother-hl2170w
pkgver=2.0.2
_pkgrel=1
pkgrel=3
pkgdesc="Brother HL-2170W CUPS printer driver"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#HL-2170W"
license=('custom:Brother' 'GPL')
makedepends=('rpmextract')
install="brother-hl2170w.install"
arch=('i686' 'x86_64')

if [[ -z "$CARCH" ]]; then
	echo ":: PKGBUILD could not detect your architecture. Some dependencies may be missing."
else
	if [[ "$CARCH" == "x86_64" ]]; then
		depends=('lib32-glibc')
	fi
fi

source=(
brother-hl2170w.patch
http://www.brother.com/pub/bsc/linux/dlf/brhl2170wlpr-$pkgver-$_pkgrel.i386.rpm
http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2170W-$pkgver-$_pkgrel.i386.rpm
)

md5sums=('eb0fb0c952d0594be471c66c4c12ff0e'
         '2d7fe5114239b48dad38e08e24c9fca0'
         '5d2b95b7c148eabf21866604e6e5cf3a')

build()
{
	cd "$srcdir" || return 1
	for n in *.rpm; do
		rpmextract.sh "$n" || return 1
	done 

	cd "$srcdir/usr/" || return 1
	patch -p1 < ../brother-hl2170w.patch

	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/usr/bin" "$pkgdir/usr"
	cp -R "$srcdir/usr/lib" "$pkgdir/usr"
	cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/Brother"

	echo Fixing paths...
	find $pkgdir -type f -exec sed -i s#/usr/local/Brother#/usr/share/Brother#g {} \;

	cd "$srcdir" || return 1
	DESTDIR=$pkgdir DRIVER_PREFIX=/usr/share/Brother \
	"$srcdir/usr/local/Brother/cupswrapper/cupswrapperHL2170W-2.0.2" -s

	rm "$pkgdir/usr/share/Brother/cupswrapper/cupswrapperHL2170W-2.0.2"
	rm "$pkgdir/usr/share/Brother/inf/setupPrintcap"
}

