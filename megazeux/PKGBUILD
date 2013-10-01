# Maintainer: Neil Ray <cinder1992@gmail.com>
# Contributor: bangoskank <its.hip@gmail.com>

pkgname=megazeux
pkgver=2.84c
pkgrel=1
pkgdesc="A game creation system for ANSI-esque games, featuring an interactive editor and an object-oriented scripting language."
arch=('i686' 'x86_64')
url="http://www.digitalmzx.net/"
license=('GPL')
depends=(libogg libpng libvorbis sdl)
conflicts=(megazeux-svn)
backup=(etc/megazeux-config)
source=(mzx284csrc.tar.xz::'http://vault.digitalmzx.net/download.php?rid=1984&f=5eb9f4a5007030886ddf323471ef8fd7f25c7734cc7c0ffb73906f116667efe8'
	Makefiles.patch
	megazeux.desktop)

md5sums=('7a0599c436000a38f4f2ed9ced0520e0'
         'da103d8ec93a118f94ad17102b7bd658'
         '818f775e5f16f36403e3560bef31a552')

build() {
 
  cd ${srcdir}/mzx284c

  patch -Np1 < ${srcdir}/Makefiles.patch || return 1

  ./config.sh --platform unix \
  --prefix /usr \
  --sysconfdir /etc \
  --as-needed-hack \
  --enable-release \
  || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  install -m 644 -D ${srcdir}/megazeux.desktop ${pkgdir}/usr/share/applications/megazeux.desktop

}
