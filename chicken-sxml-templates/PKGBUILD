# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-sxml-templates
pkgver=0.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: A simple facility for subtituting values into SXML expressions"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/sxml-templates"
license=('public')
depends=('chicken>=4.5.0' 'chicken-sxml-transforms' 'chicken-records' 'chicken-setup-helper' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=sxml-templates&version=$pkgver"
		)
md5sums=('715431f96aeff5611921ec78f3e98004')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "sxml-templates-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "sxml-templates-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "sxml-templates-$pkgver/$fname"
		else
			dd iflag=fullblock of="sxml-templates-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/sxml-templates-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/sxml-templates"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
