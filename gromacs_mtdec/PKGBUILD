# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=gromacs_mtdec
pkgver=3.3.2
pkgrel=2
pkgdesc="GROMACS with additional implementation of metadynamics in essential coordinates"
arch=('i686' 'x86_64')
url="http://web.vscht.cz/spiwokv/index.html"
license=('GPL')
depends=('fftw' 'lesstif' 'libsm' 'libx11' 'libxml2' 'perl')
options=('!libtool')
source=(http://web.vscht.cz/spiwokv/mtdec/gromacs332mtdec.tar.gz)
md5sums=('545bd6d903d8e8e94bd069c6368b6f25')

build()
{
  cd "${srcdir}/mtdec"
  ./configure --prefix="/usr" --program-suffix=_mtd
  make
}

package()
{
  mkdir -p "${pkgdir}/etc/profile.d/"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  cd "${srcdir}/mtdec"
  make DESTDIR="${pkgdir}" install
  
  # installing completions in correct location and environment setup script
  install -D -m755 "${srcdir}/mtdec/scripts/completion.bash" "${pkgdir}/usr/share/bash-completion/completions/gromacs_mtdec"
  mv "${pkgdir}/usr/bin/GMXRC.bash" "${pkgdir}/etc/profile.d/GMXRC_MTDEC.bash"
  mv "${pkgdir}/usr/bin/GMXRC.zsh" "${pkgdir}/etc/profile.d/GMXRC_MTDEC.zsh"
  mv "${pkgdir}/usr/bin/GMXRC.csh" "${pkgdir}/etc/profile.d/GMXRC_MTDEC.csh"
  sed "s:/usr/bin:/etc/profile.d:g" "${pkgdir}/usr/bin/GMXRC" > "${pkgdir}/etc/profile.d/GMXRC"
  sed -e "s/GMXRC/GMXRC_MTDEC/g" "${pkgdir}/etc/profile.d/GMXRC" > "${pkgdir}/etc/profile.d/GMXRC_MTDEC"
  chmod 755 "${pkgdir}/etc/profile.d/GMXRC_MTDEC"
  rm -f "${pkgdir}/etc/profile.d/GMXRC"
  rm -f "${pkgdir}/usr/bin/completion.*"
  rm -f "${pkgdir}/usr/bin/GMXRC"
}
