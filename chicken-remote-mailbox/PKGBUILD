# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-remote-mailbox
pkgver=2.0.1
pkgrel=4
pkgdesc="Chicken Scheme Egg: Remote Mailbox"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/remote-mailbox"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-tcp-server>=1.2' 'chicken-s11n>=0.9.3' 'chicken-mailbox>=2.1.2' 'chicken-miscmacros>=2.91' 'chicken-lookup-table>=1.13.1' 'chicken-check-errors>=1.12.0' 'chicken-synch>=2.1.1' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=remote-mailbox&version=$pkgver"
		"$pkgname-$pkgver.html::http://chicken.wiki.br/eggref/4/remote-mailbox.html")
md5sums=('8b67b5d0ccc35a471487ea4a8694fc04' 'a65fa8ba6811f405b491229892db3abe')

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "remote-mailbox-$pkgver"
	cat "$pkgname-$pkgver.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "remote-mailbox-$pkgver/$fname"
		elif [[ "$len" -eq 0 ]]; then
			touch "remote-mailbox-$pkgver/$fname"
		else
			dd iflag=fullblock of="remote-mailbox-$pkgver/$fname" ibs="$len" count=1 2>/dev/null
		fi
	done
	

	cd "$srcdir/remote-mailbox-$pkgver"
	cp ../$pkgname-$pkgver.html remote-mailbox.html
	
	
	mkdir -p "$pkgdir/usr/lib/chicken/5" "$pkgdir/usr/share/chicken/remote-mailbox"
		
	chicken-install -p "$pkgdir/usr"
	
		install -Dm644 "remote-mailbox.html" "$pkgdir/usr/share/doc/$pkgname/remote-mailbox.html"
}
