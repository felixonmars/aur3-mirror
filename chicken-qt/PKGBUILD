# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-qt
pkgver=0.100
pkgrel=4
pkgdesc="Chicken Scheme Egg: A leightweight Qt 4 interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/qt"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'chicken-protobj' 'chicken-matchable' 'chicken-miscmacros' 'qt')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=qt&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/qt.html")
md5sums=('001301bdff89dbdad77df9bd7e5fa349' 'f1ed5f1d17a2fa159a601f0576e3dfbc')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "qt-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "qt-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "qt-$pkgver/$fname"
		else
			dd iflag=fullblock of="qt-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/qt-$pkgver"
	cp ../$pkgname-$pkgver.html qt.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/qt"
		export QTDIR=/usr
	
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "qt.html" "$pkgdir/usr/share/doc/$pkgname/qt.html"
}
