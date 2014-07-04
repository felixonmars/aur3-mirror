# $Id: PKGBUILD 69719 2012-04-23 02:56:20Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=cuda6
_pkgname=cuda
pkgver=6.0.37
pkgrel=2
pkgdesc="NVIDIA's GPU programming toolkit"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/object/cuda_home.html"
license=('custom:NVIDIA')
depends=('gcc-libs' 'opencl-nvidia')
replaces=('cuda-toolkit' 'cuda-sdk' 'cuda')
provides=('cuda-toolkit' 'cuda-sdk' 'cuda')
optdepends=('gdb: for cuda-gdb')
if [ "$CARCH" == "x86_64" ]; then
	getArch=64
else
	getArch=32
fi
options=(!strip staticlibs)
install=cuda.install
source=(http://developer.download.nvidia.com/compute/cuda/6_0/rel/installers/cuda_${pkgver}_linux_${getArch}.run
        cuda.sh
        cuda.conf)
md5sums=( $([[ "$CARCH" == "x86_64" ]] && echo '22f50793b6704fe987983302fa7d1707' || echo 'a6e594b849522a1a9d5b16f0470ef11a')
       	 '7e5990e03eea90075f5a500e91a0c3d3'
       	 'ffe1e6fb7f97b23da28fd94a5fd7356d')

prepare() {
  sh cuda_${pkgver}_linux_${getArch}.run -extract=${srcdir}

  [[ "$CARCH" == "x86_64" ]] && ./cuda-linux64-rel-*.run --noexec --keep || ./cuda-linux-rel-*.run --noexec --keep
  ./cuda-samples-linux-*.run --noexec --keep

  # path hacks

  # 1rd sed line: sets right path to install man files
  # 2rd sed line: hack to lie installer, now detect launch script by root
  # 3rd sed line: sets right path in .desktop files and other .desktop stuff (warnings by desktop-file-validate)
  sed -e "s|/usr/share|${srcdir}/../pkg/${_pkgname}/usr/share|g" \
      -e 's|can_add_for_all_users;|1;|g' \
      -e 's|=\\"$prefix\\\"|=/opt/cuda|g' -e 's|Terminal=No|Terminal=false|g' -e 's|ParallelComputing|ParallelComputing;|g' \
      -i pkg/install-linux.pl

  # set right path in Samples Makefiles
  sed 's|\$cudaprefix\\|\\/opt\\/cuda\\|g' -i pkg/install-sdk-linux.pl

  # use python2
  find pkg -name '*.py' | xargs sed -i -e 's|env python|env python2|g' -e 's|bin/python|bin/python2|g'
}

package() {
  cd pkg
  perl install-linux.pl -prefix="${pkgdir}/opt/cuda" -noprompt
  perl install-sdk-linux.pl -cudaprefix="${pkgdir}/opt/cuda" -prefix="${pkgdir}/opt/cuda/samples" -noprompt

  # allow gcc 4.9 to work
  sed -i "/unsupported GNU/d" $pkgdir/opt/cuda/include/host_config.h

  install -Dm755 "${srcdir}/cuda.sh" "${pkgdir}/etc/profile.d/cuda.sh"
  install -Dm644 "${srcdir}/cuda.conf" "${pkgdir}/etc/ld.so.conf.d/cuda.conf"

  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s /opt/cuda/doc/pdf/EULA.pdf "${pkgdir}/usr/share/licenses/${_pkgname}/EULA.pdf"

  # remove redundant man and samples
  rm -fr "${pkgdir}/opt/cuda/doc/man"
  rm -fr "${pkgdir}/opt/cuda/cuda-samples"
}
