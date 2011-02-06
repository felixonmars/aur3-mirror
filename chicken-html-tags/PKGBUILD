# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-html-tags
pkgver=0.8
pkgrel=4
pkgdesc="Chicken Scheme Egg: Procedures to generate [X]HTML code"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/html-tags"
license=('BSD')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=html-tags&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/html-tags.html")
md5sums=('f8ff1edbf3a77b0e813d16ff2644847f' 'eac06357218374f58802ae9939c2108a')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "html-tags-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "html-tags-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "html-tags-$pkgver/$fname"
		else
			dd iflag=fullblock of="html-tags-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/html-tags-$pkgver"
	cp ../$pkgname-$pkgver.html html-tags.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/html-tags"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "html-tags.html" "$pkgdir/usr/share/doc/$pkgname/html-tags.html"
}
