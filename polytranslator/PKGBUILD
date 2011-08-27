# Contributor sputnick <gilles *DOT* quenot *AT* gmail *DOT* com>
pkgname=polytranslator
pkgver=0.2
pkgrel=3
pkgdesc="Language translator in GUI and CLI with many options and multiple engines. Allow to translate with google or/and babelfish. ( replace google-translator )."
license=('GPL')
arch=('any')
depends=(
	'perl-clipboard'
	'perl-lingua-translate'
	'perl-lingua-translate-google'
	'xclip'
	'zenity'
)
url="https://redmine.sputnick-area.net/projects/show/polytranslator"
source=(http://www.sputnick-area.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7abcb8f279f040d8e33f313c35061609')

build() {
   cd $startdir
   install -D -m755 ${srcdir}/${pkgname} $pkgdir/usr/bin/${pkgname} || return 1
}
