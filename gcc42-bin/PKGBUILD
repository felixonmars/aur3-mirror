# Contributor: Alan Kligman <alan.kligman@gmail.com>

pkgname=gcc42-bin
pkgver=4.2.4
_pkgrel=6
pkgrel=7
pkgdesc="The GNU C preprocessor"
arch=(i686 x86_64)
url="http://packages.debian.org"
license=('gpl')
depends=('gmp4' 'mpfr2')
provides=("gcc42=4.2.4")

if [[ "${CARCH}" == "i686" ]]; then
    _srcarch="i386"
else
    _srcarch="amd64"
fi

source=(
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/cpp-4.2_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/g++-4.2_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/g++-4.2-multilib_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2-base_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2-locales_${pkgver}-${_pkgrel}_all.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2-multilib_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gfortran-4.2_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gfortran-4.2-multilib_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gobjc-4.2_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gobjc++-4.2_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gobjc-4.2-multilib_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/gobjc++-4.2-multilib_${pkgver}-${_pkgrel}_${_srcarch}.deb
http://ftp.debian.org/debian/pool/main/g/gcc-4.2/libstdc++6-4.2-dev_${pkgver}-${_pkgrel}_${_srcarch}.deb
)
md5sums=(
8cc62191f36301ce636d60f63d0f3ef4
1da3cbeeea9990de5d8e6c9ba2f59c9d
926110617a9cb8880584bfbb99d3f90c
9384fa895e4d6ea21f2d4f1323269b3a
8b91419c24713ff3419562df588caaa4
54b1b91303cc105c249716ba4ddf546c
57bcc5e68f8ea1e34ff12c56e6cfd738
a8c651763cace33a306593ab7d8258fc
f4070819e0f63c29615ece662b07dac2
14c2e32bc454743c6b63807a29dbfa67
1b67fe29e26205aac106337ee31ca9b4
8e7c6c939e7eb06425f1f6d8f2990df8
519ef5c513c04258579d01c98b50651d
e0715966e98d2aa597b869f5f2fad13b
)

build() {
  msg "Extracting Debian package..."
  for i in *.deb; do 
  ar xv $i && tar xvfm data.tar.gz
  done
  install -d ${startdir}/pkg/usr
  cp -av usr ${startdir}/pkg

}
