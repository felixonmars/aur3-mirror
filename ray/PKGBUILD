# Maintainer: Maxime Deraspe <maxime@deraspe.net>
# Contributor: Sébastien Boisvert <seb@boisvert.info>

pkgbase=("ray")
pkgname=("ray")
true && pkgname=("ray" "ray-doc" "ray-extra")
pkgver=2.3.1
pkgrel=3
arch=("i686" "x86_64")
pkgdesc="Parallel genome assemblies for parallel DNA sequencing"
url="http://denovoassembler.sf.net"
license=('GPL3' "LGPL3")
makedepends=("openmpi" "zlib" "bzip2" "help2man")
source=(http://downloads.sourceforge.net/project/denovoassembler/Ray-$pkgver.tar.bz2)
sha1sums=("cf7de83f671b38b51177de21604944c49e161f89")
md5sums=("82f693c4db60af4328263c9279701009")

build() {
  cd "$srcdir/Ray-$pkgver"

  sed -i 's! $(LDFLAGS)  code/TheRayGenomeAssembler.a!   code/TheRayGenomeAssembler.a $(LDFLAGS)!g' Makefile
  make HAVE_LIBZ=y HAVE_LIBBZ2=y

  export OMPI_MCA_orte_rsh_agent=/bin/false
  help2man --no-info --help-option=--help -o Ray.1 \
    -n "assemble genomes in parallel using the message-passing interface" \
    ./Ray
}

package_ray-doc() {
  pkgdesc="Ray documentation"
  arch=("any")

  cd "$srcdir/Ray-$pkgver"

  mkdir -p $pkgdir/usr/share/doc/ray/RayPlatform
  
  chmod -R 644 Documentation
  chmod +x Documentation
  cp -r Documentation/ $pkgdir/usr/share/doc/ray
  chmod -R 644 RayPlatform/Documentation
  chmod +x RayPlatform/Documentation
  cp -r RayPlatform/Documentation/ $pkgdir/usr/share/doc/ray/RayPlatform
}

package_ray-extra() {
  pkgdesc="Ray scripts and XSL sheets for post-processing"
  depends=("python" "r")
  arch=("any")

  cd "$srcdir/Ray-$pkgver"

  mkdir -p $pkgdir/usr/share/ray
  chmod -R 755 scripts
  cp -r scripts/ $pkgdir/usr/share/ray
}


package_ray() {
  pkgdesc="Parallel genome assemblies for parallel DNA sequencing"
  depends=("openmpi")

  cd "$srcdir/Ray-$pkgver"

  mkdir -p $pkgdir/usr/{bin,share/man/man1,share/doc/ray}

  install -m755 Ray $pkgdir/usr/bin/
  install -m644 Ray.1 $pkgdir/usr/share/man/man1/
  install -m644 README.md $pkgdir/usr/share/doc/ray/README
  install -m644 RayPlatform/README.md $pkgdir/usr/share/doc/ray/README.RayPlatform
  install -m644 MANUAL_PAGE.txt $pkgdir/usr/share/doc/ray/
  install -m644 AUTHORS $pkgdir/usr/share/doc/ray/
  install -m644 LICENSE.txt $pkgdir/usr/share/doc/ray/
  install -m644 gpl-3.0.txt $pkgdir/usr/share/doc/ray/
  install -m644 RayPlatform/lgpl-3.0.txt $pkgdir/usr/share/doc/ray/
  install -m644 RayPlatform/AUTHORS $pkgdir/usr/share/doc/ray/AUTHORS.RayPlatform
}

