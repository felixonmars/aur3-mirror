# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>
pkgname=pbmpcd
pkgver=20071119
pkgrel=2
pkgdesc="pbmpcd connects the music player daemon (mpd) with a bemused client"
depends=('python-pybluez>=0.7' 'python-mpdclient2' 'start-stop-daemon')
arch=('i686' 'x86_64')
url=('http://arton.cunst.net/mpd/')
license=('GPL')
source=(http://arton.cunst.net/mpd/pbmpcd-${pkgver}.zip pbmpcd.rc)
md5sums=('6e6ef5b293c72ad31cd2fea50acc54d1'
         'ba160f373af11f1c91fc4120ea34ca4a')
build()
{
	mkdir -p ${startdir}/pkg/{usr/bin,etc/rc.d}
	cp ${startdir}/src/pbmpcd/pbmpcd.py ${startdir}/pkg/usr/bin/pbmpcd
	cp ${startdir}/src/pbmpcd.rc ${startdir}/pkg/etc/rc.d/pbmpcd
	chmod 755 ${startdir}/pkg/usr/bin/pbmpcd

}
