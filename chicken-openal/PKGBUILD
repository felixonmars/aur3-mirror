# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-openal
pkgver=0.7
pkgrel=4
pkgdesc="Chicken Scheme Egg: OpenAL 1.1 bindings"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/openal"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'openal' 'freealut')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=openal&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/openal.html")
md5sums=('5eba523eca9a7b5de0ff5e9203fb63ba' '956a6f76c0a46984b39000b30ac5fe45')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "openal-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "openal-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "openal-$pkgver/$fname"
		else
			dd iflag=fullblock of="openal-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/openal-$pkgver"
	cp ../$pkgname-$pkgver.html openal.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/openal"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "openal.html" "$pkgdir/usr/share/doc/$pkgname/openal.html"
}
