# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: languiar <languitar at semipol dot de>

# 0.2.5-2: Updated URL, and package() functions
# 0.2.5-3: Added fix_pool_schedule.patch

pkgname=boost.threadpool
pkgver=0.2.5
_threadpoolver=0_2_5
pkgrel=3
pkgdesc="a cross-platform C++ thread pool library"
arch=('i686' 'x86_64')
url=http://threadpool.sourceforge.net/
license=('custom')

depends=('boost')
makedepends=()
source=("http://downloads.sourceforge.net/threadpool/threadpool-${_threadpoolver}-src.zip"
        "fix_pool_schedule.patch")

prepare() {
        cd "$srcdir/threadpool-${_threadpoolver}-src/threadpool"

        patch -Np2 -i $srcdir/fix_pool_schedule.patch 
}

package() {
        cd "$srcdir/threadpool-${_threadpoolver}-src/threadpool"

        mkdir -p "$pkgdir/usr/include/boost"
        cp -rT boost/ $pkgdir/usr/include/boost/
	install -Dm644 "LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh syn=sh et
sha256sums=('ab5a78d0f6ed7bd258a6095b3ba1854b40932e0e655fa492607bd2a940898889'
            '54c939715de85434326ad2388af025164c566942a564bea85cc66d313c18d3bb')
