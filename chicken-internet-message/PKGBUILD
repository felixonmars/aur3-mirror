# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-internet-message
pkgver=4.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser combinators for Internet Message Format (RFC 5322)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/internet-message"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-abnf>=3.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=internet-message&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/internet-message.html")
md5sums=('7d3df5c7e65818813c10da18f140c49e' '9765956e26f461e57a5fdd57736dcda9')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "internet-message-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "internet-message-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "internet-message-$pkgver/$fname"
		else
			dd iflag=fullblock of="internet-message-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/internet-message-$pkgver"
	cp ../$pkgname-$pkgver.html internet-message.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/internet-message"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "internet-message.html" "$pkgdir/usr/share/doc/$pkgname/internet-message.html"
}
