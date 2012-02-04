# Contributor: Justin Davis <jrcd83@gmail.com>
pkgname='prankm'
pkgver='0.01'
pkgrel='2'
pkgdesc="Parallel ping ranker for pacman's mirrorlist"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent-fastping')
url='http://github.com/juster/prankm'
source=("prankm-${pkgver}.tar.gz::http://github.com/juster/prankm/tarball/v${pkgver}")
md5sums=('daf769cce02233bfd2368a7d0396b9dd')

build() {
  COMMIT='06810e1'
  cd "${srcdir}/juster-prankm-${COMMIT}"
  pod2man prankm | gzip -c --best > prankm.8.gz
  install -m755 -D prankm      "${pkgdir}/usr/sbin/prankm"
  install -m644 -D prankm.8.gz "${pkgdir}/usr/share/man/man8/prankm.8.gz"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End: