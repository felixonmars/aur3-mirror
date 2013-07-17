# Maintainer : boronology <boronology at gmail dot com>
pkgname=otf-flop-design
pkgver=20130717
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
makedepends=('convmv')
pkgdesc="Simple OpenType japanese gothic fonts"
arch=('any')
license=('custom')
url="http://www.flopdesign.com/freefont/flopdesignfont.html"
source=(http://www.flopdesign.com/freefont/FLOPDESIGN_FONT.zip)

install=$pkgname.install

package() {
	  cd $srcdir/FLOPDESIGN_FONT
	  convmv -f cp-932 -t utf-8 --notest M*

	  # install fonts
	  install -Dm644 01FLOPDESIGN.otf "$pkgdir/usr/share/fonts/OTF/01flopdesign.otf"

	  # install TrueType fonts
	  install -Dm644 TrueType/01FLOPDESIGN.ttf "$pkgdir/usr/share/fonts/TTF/01flopdesign.ttf"
	  
	  # install IPAex fonts License
	  install -Dm644 M+、IPAフォント/ipaexg00201/IPA_Font_License_Agreement_v1.0.txt \
	      	      "$pkgdir/usr/share/licenses/$pkgname/ipaexg00201/IPA_Font_License_Agreement_v1.0.txt"

	  # install M+ fonts License
	  for LICENSE in `ls M+、IPAフォント/mplus-TESTFLIGHT-056 | grep LICENSE`
	      do
	      install -Dm644 M+、IPAフォント/mplus-TESTFLIGHT-056/$LICENSE \
	      	      "$pkgdir/usr/share/licenses/$pkgname/mplus-TESTFLIGHT-056/$LICENSE"
	      done

	  # install FLOPDESIGN fonts License
	  install -Dm644 ReadMe.txt "$pkgdir/usr/share/licenses/$pkgname/ReadMe.txt"
}

md5sums=('aae188c40600591a28f30a37b581709a')
