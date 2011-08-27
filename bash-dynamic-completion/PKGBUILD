pkgname='bash-dynamic-completion'
pkgver=1
pkgrel=1
pkgdesc="A simple script that automatically load any of those completion functions when it is requested for the first time"
arch=( 'i686' 'x86_64' )
url="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=467231"
license=( 'GPL' )
depends=( 'bash' 'bash-completion' 'cron' )
source=( 'dynamic_completion.sh' )
md5sums=( 'b3659f84162ebda9e0444273b2d0bd8a' )
install=dynamic_completion.install

build() {
	mkdir ${pkgdir}/etc
	mkdir ${pkgdir}/etc/cron.monthly
	cp ${srcdir}/dynamic_completion.sh ${pkgdir}/etc/cron.monthly/
}
