# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname=cudaminer
pkgver=20140228
_pkgver=2014-02-28
pkgrel=3
pkgdesc="CUDA accelerated mining application."
arch=('i686' 'x86_64')
url="https://github.com/cbuchner1/CudaMiner"
license=('GPL3')
depends=('cuda' 'curl')
makedepends=('p7zip')
backup=(etc/${pkgname}.conf)
options=(!buildflags)
install=${pkgname}.install
source=("https://codeload.github.com/cbuchner1/CudaMiner/zip/${_pkgver}"
        142-compute_10.patch
        ${pkgname}.conf
        ${pkgname}.service)
sha256sums=('d52c2fdedcd45a3e261f1ce31a5ca617bd473c2daa6f07d2c9a108cb4e5c6ec3'
            'cb61e1e2d82752b2a19dc57d22b0f59188e2eda739f88db2b67eb415edd43337'
            '52dfeb6654c358a7fc1c0f36e5ceb785ad3271e8fa3e7e93a2c6f6cecfba8322'
            'e535cafc4168d316b407fa5316430902097f2cf168acb30e2ebc35fc1ec1236f')

prepare() {
  cd ${srcdir}/CudaMiner-${_pkgver}/
  patch -p0 < ../142-compute_10.patch
}

build() {
  cd ${srcdir}/CudaMiner-${_pkgver}/

  ./autogen.sh
  ./configure --prefix=/usr --with-cuda=/opt/cuda

  # Fix for nvcc fatal: 'arch=x86-64': expected a number
  if [ "$CARCH" = "i686" ]; then
    CFLAGS="-machine 32 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
  elif [ "$CARCH" = "x86_64" ]; then
    CFLAGS="-machine 64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
  fi

  make
}

package() {
  cd ${srcdir}/CudaMiner-${_pkgver}/

  make DESTDIR="${pkgdir}/" install

  install -Dm644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README

  install -Dm644 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/${pkgname}.conf
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
