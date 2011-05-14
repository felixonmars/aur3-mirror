# Contributor: Kyle Smith <askreet@gmail.com>
#

pkgname=xcb-util-all
pkgver=0.3.8
pkgrel=1
pkgdesc="Utility libraries for XC Binding"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxcb' 'xcb-proto' 'xorg-util-macros')
makedepends=('gperf' 'autoconf' 'pkgconfig' 'automake' 'git')
provides=('xcb-util' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm')
conflicts=(${provides[*]})
url="http://xcb.freedesktop.org"
source=('http://xcb.freedesktop.org/dist/xcb-util-0.3.8.tar.gz'
	'http://xcb.freedesktop.org/dist/xcb-util-image-0.3.8.tar.gz'
	'http://xcb.freedesktop.org/dist/xcb-util-keysyms-0.3.8.tar.gz'
	'http://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.8.tar.gz'
	'http://xcb.freedesktop.org/dist/xcb-util-wm-0.3.8.tar.gz')
md5sums=('08ae7994646bbd8d741b954d40a0572a'
	'b6d1359b5851ea319a81e15c18f34aeb'
	'3d6608213de3b7581cfe64d68035a83f'
	'8097c46659bb2cf60c6a8c72604b8524'
	'5a6c17935e44c52a00af7d4355a88650')

build() {

  for dir in xcb-util-0.3.8 xcb-util-image-0.3.8 xcb-util-keysyms-0.3.8 xcb-util-renderutil-0.3.8 xcb-util-wm-0.3.8; do

    cd "$srcdir/$dir"

    ./configure --prefix=/usr || return 1
    make DESTDIR="$pkgdir" install || return 1

  done


}
