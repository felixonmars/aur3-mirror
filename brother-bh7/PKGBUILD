# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-bh7
pkgver=1.0.0
pkgrel=1
pkgdesc="This package provides all cups wrapper drivers for models DCP-130C DCP-330C DCP-540CN DCP-750CW FAX-1860C FAX-1960C FAX-2480C FAX-2580C MFC-240C MFC-3360C MFC-440CN MFC-5460CN MFC-5860CN MFC-660CN MFC-665CW MFC-845CW"
arch=('i686' 'x86_64')
license=("GPL" 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
[ $CARCH == "x86_64" ] && depends=('cups' 'lib32-glibc') && source=(
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-cups-wrapper-bh7/brother-cups-wrapper-bh7_1.0.0-10-0ubuntu5_amd64.deb
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-lpr-drivers-bh7/brother-lpr-drivers-bh7_1.0.1-1-0ubuntu3_amd64.deb
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-cups-wrapper-common/brother-cups-wrapper-common_1.0.0-10-0ubuntu5_amd64.deb
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-lpr-drivers-common/brother-lpr-drivers-common_1.0.0-4-0ubuntu1_amd64.deb) && md5sums=(
  '975773e31a0f657cd7bf03d411b6191f'
  '589d5bcbd530e15fd3f7218a6eb342c8'
  'c656345afbb951780958069e2aed9db2'
  '6dc720f964d2be0a9e117289bec56a30') && t="amd64"
[ $CARCH == "i686" ] && depends=('cups') && source=(
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-cups-wrapper-bh7/brother-cups-wrapper-bh7_1.0.0-10-0ubuntu5_i386.deb
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-lpr-drivers-bh7/brother-lpr-drivers-bh7_1.0.1-1-0ubuntu3_i386.deb
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-cups-wrapper-common/brother-cups-wrapper-common_1.0.0-10-0ubuntu5_i386.deb
  http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-lpr-drivers-common/brother-lpr-drivers-common_1.0.0-4-0ubuntu1_i386.deb) && md5sums=(
  '467c41d3c848cd19e5302cc8cf677146'
  'eed000c2b09185f7658594321fcefaaf'
  '90c39c2270f9b3d231f5f930e208e73e'
  '42bb28bcdd3ec22ff50fa63db87cefb6') && t="i386"
build() {
 cd $srcdir || return 1
 ar -x brother-cups-wrapper-bh7_1.0.0-10-0ubuntu5_${t}.deb || return 1
 mv data.tar.gz data.1.tar.gz || return 1
 ar -x brother-cups-wrapper-common_1.0.0-10-0ubuntu5_${t}.deb || return 1
 mv data.tar.gz data.2.tar.gz || return 1
 ar -x brother-lpr-drivers-bh7_1.0.1-1-0ubuntu3_${t}.deb || return 1
 mv data.tar.gz data.3.tar.gz || return 1
 ar -x brother-lpr-drivers-common_1.0.0-4-0ubuntu1_${t}.deb || return 1
 mv data.tar.gz data.4.tar.gz || return 1
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.1.tar.gz || return 1
 tar -xzf ${srcdir}/data.2.tar.gz || return 1
 tar -xzf ${srcdir}/data.3.tar.gz || return 1
 tar -xzf ${srcdir}/data.4.tar.gz || return 1
}
