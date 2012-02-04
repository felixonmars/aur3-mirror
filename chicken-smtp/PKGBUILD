# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-smtp
pkgver=2.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Parser combinators and state machine for Simple Mail Transfer Protocol (RFC 5321)."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/smtp"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-typeclass' 'chicken-datatype' 'chicken-abnf>=3.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=smtp&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/smtp.html")
md5sums=('ab5341c2089cd8980cddce1f6a5a55c6' 'e4eb81ab6b26da9fac2deb94fd7d7752')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "smtp-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "smtp-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "smtp-$pkgver/$fname"
		else
			dd iflag=fullblock of="smtp-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/smtp-$pkgver"
	cp ../$pkgname-$pkgver.html smtp.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/smtp"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "smtp.html" "$pkgdir/usr/share/doc/$pkgname/smtp.html"
}
