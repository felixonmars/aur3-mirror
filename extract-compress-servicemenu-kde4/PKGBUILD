# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=extract-compress-servicemenu-kde4
pkgver=1.4.4
pkgrel=2
pkgdesc="Extract and compress servicemenus for KDE4"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/Extract+And+Compress+KDE4?content=84206"
license=('GPL')
depends=('bash' 'kdebase-workspace')
optdepends=('tar: tarball support'
	    'gzip: gunzip support'
	    'bzip2: bzip2 support'
	    'p7zip: 7Zip support'
	    'rar: RAR compression support'
	    'unrar: RAR extraction support'
	    'zip: ZIP compression support'
	    'unzip: ZIP extraction support'
	    'unace: ACE extraction support')
source=(http://www.kde-apps.org/CONTENT/content-files/84206-ExtractAndCompress_v1.4.4.tar.gz)
md5sums=('d30b44172912a4223d885520a73ad7d8')

build() {

mkdir -p $startdir/pkg/usr/{bin,share/kde4/services/ServiceMenus}

for _i in $startdir/src/ExtractAndCompress_v$pkgver/src/*.desktop
do
install -D -m644 $_i $startdir/pkg/usr/share/kde4/services/ServiceMenus/
done

for _i in $startdir/src/ExtractAndCompress_v$pkgver/src/*.sh
do
install -D -m755 $_i $startdir/pkg/usr/bin/
done

for _i in $startdir/src/ExtractAndCompress_v$pkgver/src/dialogs/*.sh
do
install -D -m755 $_i $startdir/pkg/usr/bin/
done

}
