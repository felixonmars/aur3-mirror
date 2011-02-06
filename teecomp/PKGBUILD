# Maintainer:  Dup <ddup1@dupnet.org>

pkgname=teecomp
pkgver=0.5.2
_bamver=0.2.0
_dirname=teeworlds
pkgrel=2
pkgdesc="A patched teeworlds client which add cool features like player stat, auto record demo and more"
arch=('i686' 'x86_64')
url="http://spl0k.unreal-design.com/teeworlds/"
license=('custom')
depends=('alsa-lib' 'mesa' 'sdl')
makedepends=('python')
conflicts=('teeworlds')
replaces=('teewars')
source=(http://www.teeworlds.com/files/${_dirname}-${pkgver}-src.tar.gz
        http://www.teeworlds.com/files/bam-${_bamver}.tar.gz
        teeworlds.desktop
        teeworlds.png
      	fix_datadir_search.patch
	    teecomp-0.7.0_tw-0.5.2.patch
		fix_python3.patch)
md5sums=('f605f6df9f1714dcda4cba1d281cc757'
         'd4efe74591a73c1cec8b34d76ffd1049'
         '3944aaf7a8c19a83510b2b39c4cddf5f'
         '44f39e398409232a0e0a431ed46d8cc8'
         '673791ecb74274346456f0fae53b4428'
         '90e1303fc830ae00a51c8fa867531f86'
		 '876ff667a7eabdd9d3433f9261bef261')

build() {
  # Build bam (used to build teewars)
  # Now it is released separately I should make a separate package...
  cd ${srcdir}/bam-${_bamver} || return 1
  ./make_unix.sh || return 1

  # Build teewars
  cd ${srcdir}/teeworlds-${pkgver}-src/
  # fix to run bam with python2 instead python 3 executable
  patch -p0 -i ../fix_python3.patch 
  # fix for FS 13118 which will be applied in next release
  patch -p1 -i ../fix_datadir_search.patch
  patch -p1 -i ../teecomp-0.7.0_tw-0.5.2.patch
  ../bam-${_bamver}/src/bam server_release client_release

  # Install data files  
  mkdir -p ${pkgdir}/usr/share/${_dirname}/data
  cp -r ${srcdir}/${_dirname}-${pkgver}-src/data/* \
    ${pkgdir}/usr/share/${_dirname}/data

  install -Dm755 ${srcdir}/${_dirname}-${pkgver}-src/${_dirname} \
    ${pkgdir}/usr/bin/${_dirname}
  install -Dm755 ${srcdir}/${_dirname}-${pkgver}-src/${_dirname}_srv \
    ${pkgdir}/usr/bin/${_dirname}_srv
 
  install -Dm644 ${srcdir}/${_dirname}.desktop \
    ${pkgdir}/usr/share/applications/${_dirname}.desktop
  install -Dm644 ${srcdir}/${_dirname}.png \
    ${pkgdir}/usr/share/pixmaps/${_dirname}.png
  install -Dm644 ${srcdir}/${_dirname}-${pkgver}-src/license.txt \
    ${pkgdir}/usr/share/licenses/${_dirname}/license.txt
}
