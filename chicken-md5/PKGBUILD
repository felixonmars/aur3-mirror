# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-md5
pkgver=2.3
pkgrel=4
pkgdesc="Chicken Scheme Egg: Computes MD5 (RFC1321) checksums"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/md5"
license=('public')
depends=('chicken>=4.5.0' 'chicken-message-digest' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=md5&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/md5.html")
md5sums=('fa0881eb9cfbc39b986d7b0eaad2d965' '8447991a0ac406f69127186cf44f89f7')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "md5-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "md5-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "md5-$pkgver/$fname"
		else
			dd iflag=fullblock of="md5-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/md5-$pkgver"
	cp ../$pkgname-$pkgver.html md5.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/md5"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "md5.html" "$pkgdir/usr/share/doc/$pkgname/md5.html"
}
