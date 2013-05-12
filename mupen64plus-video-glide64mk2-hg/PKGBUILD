pkgname=mupen64plus-video-glide64mk2-hg
pkgver=88
pkgrel=1
pkgdesc="Video plugin for Mupen64Plus 2.0 based on 10th anniversary release code from gonetz. Latest hg pull."
url="http://bitbucket.org/richard42/mupen64plus-video-glide64mk2"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-hg)
depends=(mupen64plus-core-hg)
makedepends=(mercurial)
source=("hg+https://bitbucket.org/richard42/mupen64plus-video-glide64mk2")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/${pkgname%-*}
	echo $(hg identify -n)
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr DESTDIR=${pkgdir} install
}