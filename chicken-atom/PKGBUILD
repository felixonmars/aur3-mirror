# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-atom
pkgver=0.1.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Atom 1.0 feed reader and writer"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/atom"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' 'chicken-ssax' 'chicken-sxml-serializer>=0.2' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=atom&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/atom.html")
md5sums=('88ce5b755e9a1819308364f03a51a5ae' 'e23ae1f77f93ad6ac3ff9bd464618233')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "atom-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "atom-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "atom-$pkgver/$fname"
		else
			dd iflag=fullblock of="atom-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/atom-$pkgver"
	cp ../$pkgname-$pkgver.html atom.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/atom"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "atom.html" "$pkgdir/usr/share/doc/$pkgname/atom.html"
}
