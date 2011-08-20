# Contributor: bocke <bocke@mycity.rs>

pkgname=spider
pkgver=1.1
pkgrel=1
pkgdesc="A challenging double decked solitaire game"
arch=('i686' 'x86_64')
url="ftp://ftp.slackware.com/pub/slackware/slackware-current/source/xap/xgames"
license=('custom')
depends=('libxaw')
makedepends=('imake')
source=("ftp://ftp.slackware.com/pub/slackware/slackware-current/source/xap/xgames/$pkgname.tar.gz"
		"$pkgname.desktop"
		"$pkgname.xpm"
		"slack-diff+small-fixes.patch")
md5sums=('57f97729956311a08a44abad0aeaedbf'
		 '75ed5244988f79645002ef0dddde2d5d'
		 '72331c59840fce5a3623b15bb6dd5b4d'
		 'ab3b13390a59b24ad0c5df75e8d8162b')

build() {
	cd "$srcdir/$pkgname"
	# This patch contains Slack fixes and my fixes for the compilation warnings.
	# The game should compile without the warnings. If it changes or doesn't,
	# let me know
	patch -p1 < "${srcdir}/slack-diff+small-fixes.patch"

	# setting helpdir location in imake template
	sed -i "s/help/\/usr\/share\/$pkgname-$pkgver/" "${srcdir}/$pkgname/Imakefile"

	# Building
	xmkmf -a
	make || return 1

	# Make install is broken, so we need to install everything ourselves
	# Installing binary
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 "${srcdir}/$pkgname/$pkgname" \
		"$pkgdir/usr/bin/$pkgname"
	# Installing game help files
	install -m 755 -d "${pkgdir}/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/doc.controls" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/doc.examples" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/doc.intro" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/doc.misc" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/doc.rules" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/doc.summary" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/spider.info" \
		"$pkgdir/usr/share/$pkgname-$pkgver"
	# Installing docs
	install -m 755 -d "$pkgdir/usr/share/doc/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/README" \
		"$pkgdir/usr/share/doc/$pkgname-$pkgver"
	# Installing manual
	install -m 755 -d "$pkgdir/usr/share/man/man6"
	cat "$srcdir/$pkgname/$pkgname.man" | gzip > "$pkgdir/usr/share/man/man6/spider.6.gz"
	chmod 644 "$pkgdir/usr/share/man/man6/$pkgname.6.gz"
	# Installing desktop entry and icon
	install -m 755 -d "$pkgdir/usr/share/applications"
	install -m 644 "${srcdir}/spider.desktop" "$pkgdir/usr/share/applications"
	install -m 755 -d "$pkgdir/usr/share/pixmaps"
	install -m 644 "${srcdir}/spider.xpm" "$pkgdir/usr/share/pixmaps"
	# Installing license
	install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname-$pkgver"
	install -m 644 "${srcdir}/$pkgname/copyright.h" "$pkgdir/usr/share/licenses/$pkgname-$pkgver/COPYING"
}
