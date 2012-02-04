# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-pop3
pkgver=1.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Mail retrieval via the POP3 protocol"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/pop3"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-matchable' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=pop3&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/pop3.html")
md5sums=('08f2a2b7795fbfd04f90aa601010529d' '376b04c35e54c5b4773401a7cc1ebed9')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "pop3-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "pop3-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "pop3-$pkgver/$fname"
		else
			dd iflag=fullblock of="pop3-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/pop3-$pkgver"
	cp ../$pkgname-$pkgver.html pop3.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/pop3"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "pop3.html" "$pkgdir/usr/share/doc/$pkgname/pop3.html"
}
