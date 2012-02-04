# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=lilykde
pkgver=0.6.5
pkgrel=1
pkgdesc="A KDE tool for working with the LilyPond music typesetter."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/LilyKDE?content=75241"
license=('GPL')
depends=('sip' 'pykde' 'pyqt3' 'python' 'pate' 'lilypond')
source=(http://lilykde.googlecode.com/files/lilykde-$pkgver.tar.gz)
md5sums=('491fe6f06143e76f142b1718df9be8bd')

build() {

cd $startdir/src/lilykde-$pkgver
make || return 1
make PREFIX=/opt/kde DESTDIR=$startdir/pkg install || return 1
mv $startdir/pkg/opt/kde/share/apps/katepart/syntax/lilypond.xml $startdir/pkg/opt/kde/share/apps/katepart/syntax/lilypond2.xml

}
