# Contributor: Chris Mortimore <chris.mortimore@googlemail.com>
pkgname=gkrellm-timers
pkgver=1.3
pkgrel=1
pkgdesc="Various timers for GkRellm"
url="http://triq.net/gkrellm_timers.html"
depends=('gkrellm')
source=(http://triq.net/gkrellm_timers/gkrellm_timers-$pkgver.tar.gz)
md5sums=('c3b57e8bcfaf4a852b79ff919db3fab9')
build() {
	cd $startdir/src/gkrellm_timers-1.3/
	make
	mkdir -p $startdir/pkg/usr/lib/gkrellm2/plugins/
	install -m 755 gkrellm_timers.so $startdir/pkg/usr/lib/gkrellm2/plugins/
}
