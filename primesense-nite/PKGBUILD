# Maintainer: Nicolas Avrutin  <nicolasavru@gmail.com>
# Contributor: hauptmech <hauptmech@gmail.com>

pkgname=primesense-nite
pkgver=1.5.2.21
pkgrel=4
pkgdesc="PrimeSense NITE drivers"
url="http://www.openni.org/Downloads/OpenNIModules.aspx"
arch=('x86_64' 'i686')
license=('custom')
depends=('openni-git')
install="primesense-nite.install"

if [[ "$CARCH" == "i686" ]]; then
  _platform=x86
   sha256sums=('8be3bf3b325ff6a3538381e8aacf2b7632a4dab422c1bd54ac7ee81d75a140e4')
elif [[ "$CARCH" == "x86_64" ]]; then
  _platform=x64
   sha256sums=('57cd7daa38e82321270179574c3a96b9e8e92348b4c7011c8d58af3d1b2fdb45')
fi

source=("http://www.openni.org/wp-content/uploads/2012/12/NITE-Bin-Linux-${_platform}-v${pkgver}.tar.zip"
        "install.sh"
        "LICENSE")
sha256sums+=('0568042ec69e4e82a64f142903f2e16fb33b717f9c477cf2dee6ed3eb319af13'
             'a669c69b86fccb508564740f8bce98c27c84465e36e932af375d249a61b26734')

_name="NITE-Bin-Dev-Linux-${_platform}-v${pkgver}"

prepare() {
  cd "$srcdir"
  tar -xjf NITE-Bin-Linux-${_platform}-v${pkgver}.tar.bz2
  cd "${srcdir}"/$_name
  cp -f ../install.sh ./
}

package() {
  cd "${srcdir}"/$_name
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/share/java
  mkdir -p $pkgdir/usr/bin
  export PACKAGINGDIR="$pkgdir"
  sh install.sh
  cd "${srcdir}"/$_name
  mkdir -p ${pkgdir}/usr/share/primesense-nite
  cp regscript.sh ${pkgdir}/usr/share/primesense-nite
  cp Bin/*dll ${pkgdir}/usr/share/primesense-nite

  cd "${srcdir}"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
