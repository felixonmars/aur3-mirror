# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-message-digest
pkgver=2.3.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Message Digest Support"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/message-digest"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros>=2.9' 'chicken-check-errors>=1.9.0' 'chicken-moremacros>=1.1.1' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=message-digest&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/message-digest.html")
md5sums=('db14219871f83073a36a5eec4e6a240b' 'f708d736f0c05aa44e7bdfde87a047b4')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "message-digest-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "message-digest-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "message-digest-$pkgver/$fname"
		else
			dd iflag=fullblock of="message-digest-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/message-digest-$pkgver"
	cp ../$pkgname-$pkgver.html message-digest.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/message-digest"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "message-digest.html" "$pkgdir/usr/share/doc/$pkgname/message-digest.html"
}
