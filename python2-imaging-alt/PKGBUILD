# Maintainer : Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Yanus Poluektovich <ypoluektovich@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: simo <simo@archlinux.org>

_name=python2-imaging
pkgname=python2-imaging-alt
pkgver=1.1.7
pkgrel=2
pkgdesc="PIL. Provides image processing capabilities for python. The -alt in the name is just so it doesn't get replaced by python2-pillow"
arch=('i686' 'x86_64')
url="http://www.pythonware.com/products/pil/index.htm"
license=('custom:"pil"')
depends=('python2' 'libjpeg' 'freetype2' 'lcms') 
makedepends=('tk' 'sane')
optdepends=('tk: for the ImageTK module'
            'sane: for the ImageSane module')
provides=("python2-imaging=${pkgver}" "pil=${pkgver}" "python-imaging=${pkgver}" 'python2-pillow=1.0')
conflicts=('python2-imaging' 'pil' 'python-imaging' 'python2-pillow')
source=(
        "http://effbot.org/downloads/Imaging-${pkgver}.tar.gz"
        'patch_freetype_includes.patch'
        )
md5sums=('fc14a54e1ce02a0225be8854bfba478e'
         'd0fdf5b560fb010dde8a9c40f1f84e9c')

prepare() {
  pwd
  # Package "freetype2" has its includes in a directory with the same name,
  # but these sources want it in "freetype". This patch fixes it.
  patch "Imaging-${pkgver}/_imagingft.c" patch_freetype_includes.patch
}

build() {
  cd "${srcdir}/Imaging-${pkgver}"

  # FS#33452
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  python2 setup.py build_ext
  cd Sane
  python2 setup.py build_ext
}

package() {
  cd "${srcdir}/Imaging-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  
  pushd Sane
  python2 setup.py install --root="${pkgdir}" --optimize=1
  popd
  
  install -dm755 "${pkgdir}/usr/include/python2.7/"
  install -m644 -t "${pkgdir}/usr/include/python2.7/" libImaging/*.h 

  # do not have files ending in .py in /usr/bin
  for f in pildriver pilprint pilconvert pilfile pilfont; do
    mv "${pkgdir}"/usr/bin/${f}{.py,}
  done

  # Install license
  install -Dm644 "${srcdir}/Imaging-${pkgver}/README" \
                 "${pkgdir}/usr/share/licenses/${_name}/README"
}
