pkgname=eunektes
pkgver=1.3.2
pkgrel=2
pkgdesc="A script for lossless backup of DVDs to MKV"
url="http://kde-apps.org/content/show.php/Eunektes?content=137599"
arch=(any)
depends=(python2 python2-qt kdebindings-python lsdvd vobcopy ogmtools mkvtoolnix mplayer ffmpeg libdvdcss)
source=("http://kde-apps.org/CONTENT/content-files/137599-eunektes")
license=("GPL")
_srcfile="137599-eunektes"

package() 
{
	install -D -m755 ${srcdir}/${_srcfile} ${pkgdir}/usr/bin/eunektes
}
md5sums=('2cf002af6085d3097fa16c5e42623867')
