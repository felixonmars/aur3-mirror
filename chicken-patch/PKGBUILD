# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-patch
pkgver=0.12
pkgrel=4
pkgdesc="Chicken Scheme Egg: Simple source patch utility."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/patch"
license=('MIT')
depends=('chicken>=4.5.0' 'chicken-eggdoc' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=patch&version=$pkgver"
		)
md5sums=('8ae284f56e49cb53680a45bb0777d572')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "patch-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "patch-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "patch-$pkgver/$fname"
		else
			dd iflag=fullblock of="patch-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/patch-$pkgver"
	
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/patch"
		
	chicken-install -p "$pkgdir/usr"
	
	
}
