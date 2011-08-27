pkgname=youtube-servicemenu
pkgver=1.10
pkgrel=1
pkgdesc="Konqueror/KDE service menu to download youtube videos"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Get+YouTube+Video+(improved)?content=41456&PHPSESSID=7fd78e57b111cb2df8f715a8decab73e"
license=('GPL')
depends=('kdebase-workspace' 'python-lxml')
makedepends=()
source=("http://kde-look.org/CONTENT/content-files/41456-${pkgname}-${pkgver}.tar.bz2")
md5sums=('680247e63a1c85e5a6e8e2c4ec3aa419')

build() {
cd ${srcdir}/${pkgname}-${pkgver}

mkdir -p {${pkgdir}/usr/bin/,${pkgdir}/usr/share/kde4/services/,${pkgdir}/usr/lib/get_yt_video/}
sed -i 's/^ServiceTypes=.*/Type=Service\nServiceTypes=KonqPopupMenu\/Plugin,text\/html/' get_yt_video.desktop
sed -i 's/python/python2/' get_yt_video.py

install -m 755 get_yt_video.py ${pkgdir}/usr/bin/
install -m 644 get_yt_video.desktop ${pkgdir}/usr/share/kde4/services/
find l10n -mindepth 1 -maxdepth 1 -type d -exec cp -r {} ${pkgdir}/usr/lib/get_yt_video/ \;
}
