# Maintained by Alexander Kazarin <boiler@co.ru>
# I think this alpha version is much stable in network game than current beta

pkgname=blobby2-alpha
pkgver=0.8a
pkgrel=2
pkgdesc="Blobby Volley (alpha)"
url="http://sourceforge.net/projects/blobby/"
license=('GPL')
conflicts=('blobby2')
depends=('sdl' 'zip' 'physfs')
makedepends=('cmake')
arch=(i686 x86_64)
source=(http://downloads.sourceforge.net/project/blobby/Blobby%20Volley%202%20%28Linux%29/Beta%200.9b/blobby2-linux-${pkgver}.tar.gz
        blobby2.desktop
	blobby2.png)

md5sums=('75e7d46039d5e8fe1ed2d174244143a9'
         'b9b7621bfcbc3d18f511cea0afd5ab7a'
         'c1bc427b41a0a3facd771ac83c7fb412')

build() {
  cd "$srcdir"
  tar -xzf "blobby2-linux-${pkgver}.tar.gz"

  cd ${srcdir}/blobby-alpha-8 || return 1
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -dm755 $pkgdir/usr/share/{applications,pixmaps}
  install -m644 $srcdir/blobby2.desktop $pkgdir/usr/share/applications
  install -m644 $srcdir/blobby2.png $pkgdir/usr/share/pixmaps

  install -dm755 $pkgdir/usr/share/blobby/data
  install -m644 $pkgdir/usr/share/blobby/server.xml $pkgdir/usr/share/blobby/data

  echo -e "#!/bin/sh\ncd /usr/share/blobby && /usr/bin/blobby-server \$@" > $pkgdir/usr/bin/blobby-server.sh
  chmod 755 $pkgdir/usr/bin/blobby-server.sh
}
