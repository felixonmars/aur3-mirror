# Contributor: Devon <admin@patched.biz>
pkgname=kmpg2
pkgver=1.96
pkgrel=1
pkgdesc="A user friendly MPEG2 encoding wizard."
url="http://kmpg2.sourceforge.net/view.php/page/Voorpagina"
license=""
depends=(kommander ffmpeg transcode sox encode2mpeg y4mscaler)
makedepends=()
conflicts=(kdewebdev)
replaces=()
backup=()
install=
source=(http://surfnet.dl.sourceforge.net/sourceforge/kmpg2/KmPg2-$pkgver.tar.bz2)
md5sums=(fb76d4794fb9399b203db0b1c488fa76)

build() {

  cd $startdir/src/KmPg2-$pkgver

 /opt/kde/bin/kmdr-executor Installer.kmdr

}

