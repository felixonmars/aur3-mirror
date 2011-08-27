# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sha1
pkgver=2.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Computes SHA1 (FIPS-180-1) checksums"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sha1"
license=('public')
depends=('chicken>=4.5.0' 'chicken-message-digest' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sha1&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sha1.html")
md5sums=('b473490cd282ca83ec0e7a5080896022' '85cfb61ee95d6808c4215aec456a5b10')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sha1-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sha1-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sha1-$pkgver/$fname"
		else
			dd iflag=fullblock of="sha1-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sha1-$pkgver"
	cp ../$pkgname-$pkgver.html sha1.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sha1"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sha1.html" "$pkgdir/usr/share/doc/$pkgname/sha1.html"
}
