# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-args
pkgver=1.4.2
pkgrel=4
pkgdesc="Chicken Scheme Egg: Command-line argument handling, on top of SRFI 37"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/args"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-srfi-37' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=args&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/args.html")
md5sums=('21018c9189af7062f671773a1ee3e1e2' '1dd01b9c01f42cde6455ea5f84fe27a0')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "args-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "args-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "args-$pkgver/$fname"
		else
			dd iflag=fullblock of="args-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/args-$pkgver"
	cp ../$pkgname-$pkgver.html args.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/args"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "args.html" "$pkgdir/usr/share/doc/$pkgname/args.html"
}
