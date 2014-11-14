# Maintainer : boronology <boronology at gmail dot com>
pkgname=ttf-rounded-mplus
pkgver=20140812
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Japanese rounded gothic fonts based on M+ FONTS"
arch=('any')
license=('custom')
url="http://jikasei.me/font/rounded-mplus/"
source=("http://sourceforge.jp/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F6%2F6593%2Frounded-mplus-20140812.7z"
	"http://sourceforge.jp/frs/chamber_redir.php?m=iij&f=%2Fusers%2F6%2F6592%2Frounded-x-mplus-20140812.7z"
	"http://sourceforge.jp/frs/chamber_redir.php?m=iij&f=%2Fusers%2F6%2F6594%2Frounded-l-mplus-20140812.7z"
	)

install=$pkgname.install

package() {
	cd "$srcdir"

	# install fonts
	for TTF in `ls | grep ttf`
	    do
	    install -Dm644 $TTF "$pkgdir/usr/share/fonts/TTF/$TTF"
	    done

	# install License
	for LICENSE in `ls mplus-TESTFLIGHT-058 | grep LICENSE`
	    do
	    install -Dm644 mplus-TESTFLIGHT-058/$LICENSE \
	    	    "$pkgdir/usr/share/licenses/$pkgname/$LICENSE"
	    done
}

md5sums=('e22083d62eef39802a65c85821fa9449'
         '4d8c0227986fbf2a2cf7d4fee5ea934d'
         '6739376df0b1fbdee8b1f4b9ff8d5a8f')
