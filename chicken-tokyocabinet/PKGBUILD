# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-tokyocabinet
pkgver=2.01
pkgrel=4
pkgdesc="Chicken Scheme Egg: Tokyo Cabinet DBM interface"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tokyocabinet"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'tokyocabinet')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=tokyocabinet&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/tokyocabinet.html")
md5sums=('149c0aee29f50f8f47cfb28fe56f625f' 'b1bef7ec7d26703a9c933ca494cadf7f')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "tokyocabinet-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "tokyocabinet-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "tokyocabinet-$pkgver/$fname"
		else
			dd iflag=fullblock of="tokyocabinet-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/tokyocabinet-$pkgver"
	cp ../$pkgname-$pkgver.html tokyocabinet.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/tokyocabinet"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "tokyocabinet.html" "$pkgdir/usr/share/doc/$pkgname/tokyocabinet.html"
}
