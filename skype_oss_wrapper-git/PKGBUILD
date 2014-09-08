# Maintainer: Philip Pokarowski <nucrap@hotmail.de> 

pkgname=skype_oss_wrapper-git
pkgver=r16.ad9f1d8
pkgrel=2
pkgdesc="A fake libpulse.so library that mimics pulseaudio behavior for skype, instead redirecting it to OSSv4"
arch=('any')
url="https://github.com/waterlaz/skype_oss_wrapper"
license=('Revised BSD License')
depends=(skype)
makedepends=(git)
source=("$pkgname-$pkgver"::'git://github.com/waterlaz/skype_oss_wrapper.git'
		"skype_oss_wrapper.desktop")
md5sums=('SKIP'
		 '2570bbf5c904f15613a6b10885b63ac5')

pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname-$pkgver"
	PREFIX=/usr make
}

package(){
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../skype_oss_wrapper.desktop "$pkgdir"/usr/share/applications/skype_oss_wrapper.desktop
}