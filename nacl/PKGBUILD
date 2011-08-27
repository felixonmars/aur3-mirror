pkgname=nacl
arch=(i686 x86_64)
pkgver=20110221
pkgrel=1
pkgdesc="NaCl (pronounced 'salt') Networking and Cryptography library"
url="http://nacl.cace-project.eu/"
license=('Public Domain')
source=(http://hyperelliptic.org/nacl/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7efb5715561c3d10dafd3fa97b4f2d20')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # The do script does by far too much magic. The following will prevent NaCL to be built for unnecessary architectures
  cat >okcompilers/c <<EOF
gcc -fomit-frame-pointer
gcc -O -fomit-frame-pointer
gcc -O3 -fomit-frame-pointer -funroll-loops
EOF

  cat >okcompilers/cpp <<EOF
g++ -fomit-frame-pointer
g++ -O -fomit-frame-pointer
g++ -O3 -fomit-frame-pointer -funroll-loops
EOF

  msg "This will take some time. Go get a coffee or something ;-)"
  ./do

  install -D -m 644 build/*/lib/*/libnacl.a "${pkgdir}/usr/lib/libnacl.a"

  install -d "${pkgdir}/usr/include/nacl"
  install -t "${pkgdir}/usr/include/nacl" build/*/include/*/*
  rm "${pkgdir}"/usr/include/nacl/{cpucycles,randombytes}.h
}
