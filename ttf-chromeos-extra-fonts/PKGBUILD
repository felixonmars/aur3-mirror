# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=ttf-chromeos-extra-fonts
pkgver=2013.12.09
_crosextraver=20130214
_lohitver=2.5.0
_mlver=0.740
_paduk=2.50
_notover=20130514
_knanum=3.10.0
_jomol=0.0.3c
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
optdepends=('ttf-chromeos-fonts: Part of the Chromium OS Crossfonts Suite'
	'otf-ipafont: Part of the Chromium OS Crossextrafont suite'
	'ttf-droid: Part of the Chromium OS Crossextrafont Suite'
	) 
conflicts=('ttf-google-webfonts' 'lohit-fonts')
pkgdesc="Extra fonts for Chrome OS by various author"
arch=('any')
provide=('ttf-font')
license=('Apache' 'custom:OFL-1.1')
url="http://git.chromium.org/gitweb/"
source=("http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/crosextrafonts-$_crosextraver.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/lohitfonts-cros-$_lohitver.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/ml-anjalioldlipi-$_mlver.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/my-padauk-$_paduk.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/notofonts-$_notover.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/ko-nanumfonts-$_knanum.tar.gz"
	"http://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/tibt-jomolhari-$_jomol.tar.gz"
	)

install=$pkgname.install

package()
{
	install -d -m 755 $pkgdir/usr/share/fonts/TTF
	install -m 644 $srcdir/crosextrafonts-$_crosextraver/*.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/lohitfonts-cros-$_lohitver/*.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/ml-anjalioldlipi-$_mlver/*.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/my-padauk-$_paduk/*.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/notofonts-$_notover/*.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/notofonts-$_notover/*.ttc $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/ko-nanumfonts-$_knanum/*.ttf $pkgdir/usr/share/fonts/TTF/
	install -m 644 $srcdir/tibt-jomolhari-$_jomol/*.ttf $pkgdir/usr/share/fonts/TTF/

	install -d -m 755 $pkgdir/usr/share/doc/$pkgname/{ko-nanumfonts,lohitfonts-cros,ml-anjalioldlipi,tibt-jomolhari,my-padauk}
	install -m 644 $srcdir/lohitfonts-cros-$_lohitver/LICENSE $pkgdir/usr/share/doc/$pkgname/lohitfonts-cros
	install -m 644 $srcdir/ml-anjalioldlipi-$_mlver/LICENSE $pkgdir/usr/share/doc/$pkgname/ml-anjalioldlipi
	install -m 644 $srcdir/ko-nanumfonts-$_knanum/LICENSE $pkgdir/usr/share/doc/$pkgname/ko-nanumfonts
}

md5sums=('368f114c078f94214a308a74c7e991bc'
         '2626c1d45edbff72ec2667bc81c801eb'
         '85a7927441264d3845f8aea874e2df98'
         'da54672600f62c72bc81b08f35329024'
         '1a93e15063ef757c50dc477f9a6d4428'
         'ae8f913acbff9c0106d75c1a6106d443'
         '715d38f358da74afbb6117492f3ae1b9')
