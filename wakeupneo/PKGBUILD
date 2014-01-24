# Maintainer:  edloaa <edloaa at googlemail dot com>
# Contributor: edloaa <edloaa at googlemail dot com>
pkgname=wakeupneo
pkgver=1.1
pkgrel=2
pkgdesc='"The Matrix" scene written in bash and python'
arch=('i686' 'x86_64')
url="http://en.wikipedia.org/wiki/The_Matrix"
license=('GPL3')
depends=('bash' 'coreutils' 'python')
source=('wakeupneo.sh' 'wakeupneo.py')
md5sums=('fc2875a036e569920fccb7fde6779f7d'
         'b0335e8b3d37fabe30032fcbfb7f49ff')

package() {
	install -D -m755 $pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
	install -D -m755 $pkgname.py "$pkgdir/usr/bin/$pkgname.py"
}
