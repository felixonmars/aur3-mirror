# Contributor: Liming Wang <lmwang+aur@gmail.com>
# Contributor: Loui Chang <louipc dot. ist at@ noSPAM gmail.com>
# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>

pkgname=brother-mfc7440n
pkgver=2.0.2
_pkgrel=1
pkgrel=2
pkgdesc="Brother MFC-7440N CUPS printer driver"
url="http://solutions.brother.com/linux/en_us/download_prn.html#MFC-7440N"
license=('custom:Brother' 'GPL')
depends=('cups')
makedepends=('rpmextract')
install="brother-mfc7440n.install"
arch=('i686' 'x86_64')

if [[ -z "$CARCH" ]]; then
	echo ":: PKGBUILD could not detect your architecture. Some dependencies may be missing."
else
	if [[ "$CARCH" == "x86_64" ]]; then
		depends=('lib32-glibc')
	fi
fi

source=(
brother-mfc7440n.patch
http://pub.brother.com/pub/com/bsc/linux/dlf/brmfc7440nlpr-$pkgver-$_pkgrel.i386.rpm
http://pub.brother.com/pub/com/bsc/linux/dlf/cupswrapperMFC7440N-$pkgver-$_pkgrel.i386.rpm
)

md5sums=('a89aa430959a19c13d2ee064d23e7bd0'
         '573d1bc7d632541a6718b6ab933f7a8d'
         '66c762b0d5d7a09dbd5a814b56892257')

build()
{
	cd "$srcdir" || return 1
	for n in *.rpm; do
		rpmextract.sh "$n" || return 1
	done 

	cd "$srcdir/usr/" || return 1
	patch -p1 < ../brother-mfc7440n.patch || return 1

	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/usr/bin" "$pkgdir/usr"
	cp -R "$srcdir/usr/lib" "$pkgdir/usr"
	cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/Brother"

	echo Fixing paths...
	find $pkgdir -type f -exec sed -i s#/usr/local/Brother#/usr/share/Brother#g {} \;

	cd "$srcdir" || return 1
	DESTDIR=$pkgdir DRIVER_PREFIX=/usr/share/Brother \
	"$srcdir/usr/local/Brother/cupswrapper/cupswrapperMFC7440N-2.0.2" -s

	rm "$pkgdir/usr/share/Brother/cupswrapper/cupswrapperMFC7440N-2.0.2"
	rm "$pkgdir/usr/share/Brother/inf/setupPrintcap"
}

