# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sha2
pkgver=2.1.0
pkgrel=4
pkgdesc="Chicken Scheme Egg: Computes 256-, 385- and 512-bit SHA2 checksums"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sha2"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-message-digest>=2.0.3' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sha2&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/sha2.html")
md5sums=('1682b6986422785a701495e0ecfc948a' '9992e0fd5a68d63aa9190e31039ead16')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sha2-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sha2-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sha2-$pkgver/$fname"
		else
			dd iflag=fullblock of="sha2-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sha2-$pkgver"
	cp ../$pkgname-$pkgver.html sha2.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sha2"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "sha2.html" "$pkgdir/usr/share/doc/$pkgname/sha2.html"
}
