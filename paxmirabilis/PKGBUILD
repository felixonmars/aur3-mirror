# Contributor: Jens Staal <staal1978@gmail.com>
pkgname=paxmirabilis
pkgver=20140703
pkgrel=2
pkgdesc="The POSIX standard archive tool, supporting the two most common forms of standard Unix archive (backup) files - CPIO and TAR."
arch=('i686' 'x86_64')
url="https://www.mirbsd.org/MirOS/dist/mir/cpio/"
license=('BSD')
groups=()
depends=()
makedepends=('cpio' 'bmake')
provides=('cpio')
conflicts=('cpio')
replaces=('cpio')
backup=()
options=()
install=
source=("https://www.mirbsd.org/MirOS/dist/mir/cpio/paxmirabilis-$pkgver.cpio.gz")
noextract=()

md5sums=('cdaebaf757ae397e840ea81a720a5dff')

build() {
  cd $srcdir
  # makepkg can't extract cpio files
  cpio -mid < "$pkgname-$pkgver.cpio"
  cd "$srcdir/pax"
  
  export MACHINE_OS="Linux"
  bmake || return 1
}

package() {
  cd "$srcdir/pax"
  mkdir -p ${pkgdir}/usr/{bin,share/{man/man1,licenses/${pkgname}}}
  
  install -m755 pax ${pkgdir}/usr/bin/
  cd ${pkgdir}/usr/bin/
  #pax can unfortunately not act as a drop-in replacement of gnutar in Arch
  ln -s pax paxtar
  ln -s pax cpio
  
  cd "$srcdir/pax"
  install -m644 {cpio,pax}.1 ${pkgdir}/usr/share/man/man1/
  install -m644 tar.1 ${pkgdir}/usr/share/man/man1/paxtar.1
  # no license file?
}

