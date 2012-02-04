# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-vandusen
pkgver=0.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: A cheeky IRC bot"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/vandusen"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-irc' 'chicken-chicken-doc' 'chicken-environments' 'chicken-uri-common' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=vandusen&version=$pkgver"
		)
md5sums=('87f39994fd59b947818f35041048db96')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "vandusen-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "vandusen-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "vandusen-$pkgver/$fname"
		else
			dd iflag=fullblock of="vandusen-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/vandusen-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/vandusen"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
