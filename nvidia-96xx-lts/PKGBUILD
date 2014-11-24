# Maintainer: 3ED_0 <krzysztof1987 at gmail>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=nvidia-96xx-lts
_kname=lts

pkgver=96.43.23
pkgrel=6
_kver_ge="3.0"
_kver_lt="3.17"
pkgdesc="NVIDIA drivers for linux-${_kname}, 96xx branch."
url="http://www.nvidia.com/"
arch=('i686' 'x86_64')
depends=("linux-${_kname}>=${_kver_ge}"
         "linux-${_kname}<${_kver_lt}"
         "nvidia-96xx-utils=${pkgver}")
makedepends=("linux-${_kname}-headers>=${_kver_ge}"
             "linux-${_kname}-headers<${_kver_lt}")
optdepends=('xorg-server1.12: latest compatible Xorg server')
provides=('nvidia-96xx')
conflicts=('nvidia'
           'nvidia-all'
           'nvidia-96xx-all'
           'nvidia-173xx'
           'nvidia-275xx'
           'nvidia-304xx'
           'nvidia-beta-all'
           'nvidia-beta')
license=('custom')
install='nvidia.install'
options=(!strip)
_npkg=0

if [ "$CARCH" = "x86_64" ]; then
  _arch=x86_64
else
  _arch=x86
fi

source=(http://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg}.run
        nouveau_blacklist.conf
        173.14.36-37.patch
        173.14.37-38.patch)

sha256sums=('51e6adf4ba73071622045fc37169f80db3ae3e784dff53b29d35146a04042142'
            'b3dbf277d507c2a3659775968d3e57bd211b58927a62787706e0e1952e959dac'
            'c8900d09528589f8f519aa424447e31e3e9a0ca4866fe49c37ac4ed4320a6728'
            '790359354da3b08b45e33c8706548072851fba86f42089678e2a6eb6a1d3d6b7')

[ "$CARCH" = "x86_64" ] && sha256sums[0]='ce8d8253e7dab7da63fbdac449ebf190cd0c10cbfffea0f8d0165515f851bc64'

_extramodules="$(echo /usr/lib/modules/extramodules-[0-9.]*-${_kname}/version|cut -d/ -f5 2> /dev/null)"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version 2> /dev/null)"

prepare() {
  msg2 "Cleaning..."
  test ! -d NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg} \
    || rm -rf NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg}

  msg2 "Extracting..."
  sh NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg}.run --extract-only

  msg2 "Patching..."
  cd NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg}/usr/src/nv
  patch -p1 -i "$srcdir"/173.14.36-37.patch
  patch -p1 -i "$srcdir"/173.14.37-38.patch
}

build() {
  cd NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg}/usr/src/nv
  make SYSSRC=/usr/lib/modules/${_kernver}/build module
}

package() {
  install -dm755 "$pkgdir/usr/lib/modprobe.d"
  install -m644 nouveau_blacklist.conf "$pkgdir/usr/lib/modprobe.d/nouveau_blacklist-${_kname}.conf"

  cd NVIDIA-Linux-${_arch}-${pkgver}-pkg${_npkg}
  install -dm755 "$pkgdir/usr/share/licenses/${pkgname}/"
  install  -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/"

  cd usr/src/nv
  install -dm755 "$pkgdir/usr/lib/modules/${_extramodules}/"
  install  -m644 nvidia.ko "$pkgdir/usr/lib/modules/${_extramodules}/"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"

  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "$startdir/nvidia.install"
}
