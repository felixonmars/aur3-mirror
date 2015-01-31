pkgname=cpprestsdk-git
pkgdesc='The C++ REST SDK is a Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design. (Codename: casablanca)'
pkgver=v2.1.0.r780.g219daed
pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
pkgrel=3
source=("$pkgname"'::git+https://git01.codeplex.com/casablanca'
        'CMakeLists.txt.diff')
arch=('any')
url=('http://casablanca.codeplex.com/')
license=('Apache')
makedepends=(
  'cmake'
)
depends=(
  'boost>1.54' # boost_system is needed
  'openssl'
)
sha512sums=('SKIP'
            'e9d6798ce5ee49b9de8e3f97a1bfb43d949f1bbac4bbe21a5442eda109b12c55e755d1e3d6bcf92363ce57e40d72f1d4a67f527dbd40f3f983aaf0d9368f4a36')

package() {
  patch -u "$srcdir"/"$pkgname"/Release/CMakeLists.txt CMakeLists.txt.diff
  
  cd "$srcdir"/"$pkgname"/Release
  
  mkdir -p build.release
  cd build.release
  
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release
  
  install -m644 -D "$srcdir"/$pkgname/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/license.txt
  
  make install
}
