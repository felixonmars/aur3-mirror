# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-spiffy-dir-listing
pkgver=0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Flexible directory listing for Spiffy"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/spiffy-directory-listing"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-spiffy' 'chicken-html-utils' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=spiffy-directory-listing&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/spiffy-directory-listing.html")
md5sums=('f10c2f63b58f63a13acbce96d8812d68' '2733cc588f2073e63f93ef08765d8420')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "spiffy-directory-listing-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "spiffy-directory-listing-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "spiffy-directory-listing-$pkgver/$fname"
		else
			dd iflag=fullblock of="spiffy-directory-listing-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/spiffy-directory-listing-$pkgver"
	cp ../$pkgname-$pkgver.html spiffy-directory-listing.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/spiffy-directory-listing"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "spiffy-directory-listing.html" "$pkgdir/usr/share/doc/$pkgname/spiffy-directory-listing.html"
}
