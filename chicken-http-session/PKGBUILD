# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-http-session
pkgver=2.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Facilities for managing HTTP sessions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/http-session"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-sha1' 'chicken-spiffy' 'chicken-intarweb' 'chicken-uri-common' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=http-session&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/http-session.html")
md5sums=('58450798b0b6e00ac606f69b88d50f8c' '61744684816ba69c7fcfd08745b5dec7')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "http-session-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "http-session-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "http-session-$pkgver/$fname"
		else
			dd iflag=fullblock of="http-session-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/http-session-$pkgver"
	cp ../$pkgname-$pkgver.html http-session.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/http-session"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "http-session.html" "$pkgdir/usr/share/doc/$pkgname/http-session.html"
}
