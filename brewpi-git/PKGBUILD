# Maintainer: Dimitris Kanistras <kanistras@gmail.com>
pkgname=brewpi-git
pkgver=r285.33f21be
pkgrel=1
pkgdesc="A fermentation controller for brewing beer or wine."
arch=(any)
url="http://www.brewpi.com"
license=('GPL3')
depends=(cronie apache php-apache php python2 python2-pyserial python2-simplejson python2-configobj python2-psutil python2-pygit2 avrdude git)
makedepends=(git)
install=brewpi.install
source=('brewpi.cron' 'arch.patch')
md5sums=('7cdbcb2fd7988a2c185fda8032368e81'
         'b59fd17774c605a7d4f558b3cfa766c8') #generate with 'makepkg -g'

_gitscript='https://github.com/BrewPi/brewpi-script' 
_gitwww='https://github.com/BrewPi/brewpi-www'

pkgver() {
	git clone ${_gitscript} "${srcdir}/brewpi-script"
	git clone ${_gitwww} "${srcdir}/brewpi-www"

	#changing brewpi www-path to /srv/http/brewpi
	sed -i "s%var/www%srv/http/brewpi%g" ${srcdir}/brewpi-script/settings/defaults.cfg

	#applying arch-specific patch
	cd ${srcdir}/brewpi-script
	patch BrewPiProcess.py < ${startdir}/arch.patch

        cd "${srcdir}/brewpi-script/"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	#installing brewpi-script
	install -d ${pkgdir}/home/brewpi
	cp -a ${srcdir}/brewpi-script/* ${pkgdir}/home/brewpi/

	#installing http files in /srv/http/brewpi
	install -d  ${pkgdir}/srv/http/brewpi
	cp -a ${srcdir}/brewpi-www/* ${pkgdir}/srv/http/brewpi/

	#installing brewpi cron file
	install -d ${pkgdir}/etc/cron.d/
	cp ${startdir}/brewpi.cron ${pkgdir}/etc/cron.d/brewpi

}

