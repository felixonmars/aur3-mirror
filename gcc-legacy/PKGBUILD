# Maintainer: Kevin JR <superkevjr@yahoo.com>

pkgname=gcc-legacy
pkgver=4.2.4
pkgrel=2
pkgdesc="The GNU C preprocessor"
arch=(i686 x86_64)
url="http://packages.debian.org"
license=('gpl')

if [[ "${CARCH}" == "i686" ]]; then
    _srcarch="i386"
else
    _srcarch="amd64"
fi

source=(
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/cpp-4.2_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/g++-4.2_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/g++-4.2-multilib_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2-base_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2-locales_4.2.4-2_all.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gcc-4.2-multilib_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gfortran-4.2_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gfortran-4.2-multilib_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gobjc++-4.2_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gobjc++-4.2-multilib_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gobjc-4.2_4.2.4-2_${_srcarch}.deb
http://ftp.de.debian.org/debian/pool/main/g/gcc-4.2/gobjc-4.2-multilib_4.2.4-2_${_srcarch}.deb
)
md5sums=(
3638b1ff762c2af3c464528493676efc
2413cca754b16c18691db94bb47010b4
b41a81568373bc2855fb0c8a600e1ba2
6f1d7f741208ea01e2a27271eaddffd8
c0b43a7aca46327707dc89d8acbc381d
6f4176ffd03f97195c95c388e7d6136e
38687fe2983e8ea3cc6d14b776783508
80b6580f88b6e20794ee2c0464f441bb
b2698bcbad1dab3868b2032075ff425b
441234d62d8e3915ac20cf695efd50cd
3b21c025ed8ebdae52e472269eed7258
e7f0b6a70f869b67f488280038e49e38
52a7b2fa1f51814bf5fd7ac4c1f1abd1
)

build() {
  msg "Extracting Debian package..."
  for i in *.deb; do 
  ar xv $i && tar xvfm data.tar.gz
  done
  install -d ${startdir}/pkg/usr
  cp -av usr ${startdir}/pkg

}
