# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-ftp
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Simple FTP client"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ftp"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=ftp&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/ftp.html")
md5sums=('bd7da59cb72240851b50f9c3cfa4aa45' '171fefcc64caa784bd1a6405c8c673e6')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "ftp-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "ftp-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "ftp-$pkgver/$fname"
		else
			dd iflag=fullblock of="ftp-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/ftp-$pkgver"
	cp ../$pkgname-$pkgver.html ftp.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/ftp"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "ftp.html" "$pkgdir/usr/share/doc/$pkgname/ftp.html"
}
