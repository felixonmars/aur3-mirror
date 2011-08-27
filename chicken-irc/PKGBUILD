# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-irc
pkgver=1.9.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple IRC client"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/irc"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=irc&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/irc.html")
md5sums=('68c22f1154a10a7290997cfe91474c87' '739c3571c7c16db5bd6dcc505fd8c711')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "irc-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "irc-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "irc-$pkgver/$fname"
		else
			dd iflag=fullblock of="irc-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/irc-$pkgver"
	cp ../$pkgname-$pkgver.html irc.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/irc"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "irc.html" "$pkgdir/usr/share/doc/$pkgname/irc.html"
}
