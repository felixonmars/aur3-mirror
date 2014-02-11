pkgname=libnacl
arch=(i686 x86_64)
pkgver=20110221
pkgrel=3
pkgdesc="NaCl (pronounced 'salt') Networking and Cryptography library (works with pynacl)"
url="http://nacl.cace-project.eu/"
license=('Public Domain')
source=(http://hyperelliptic.org/nacl/nacl-${pkgver}.tar.bz2)
md5sums=('7efb5715561c3d10dafd3fa97b4f2d20')
options=('staticlibs')

build() {
  cd "$srcdir/nacl-${pkgver}"

  # The do script does by far too much magic. The following will prevent NaCL to be built for unnecessary architectures
  cat >okcompilers/c <<EOF
gcc -O3 -fomit-frame-pointer -funroll-loops -fPIC
EOF

  cat >okcompilers/cpp <<EOF
g++ -O3 -fomit-frame-pointer -funroll-loops -fPIC
EOF

  # Force the ./do script to print build status to screen
  sed -i "s/exec 2\?>.*//" do

  # Remove the tests and some problematic directories
  # The assembly implementations are nice, but aren't position independent so we can't use them
  rm -rf tests
  rm -rf crypto_onetimeauth/poly1305/amd64
  rm -rf crypto_onetimeauth/poly1305/x86
  rm -rf crypto_stream/salsa20*/*xmm*

  msg "This will take some time. Go get a coffee or something ;-)"
  ./do

}

package() {
  cd "$srcdir/nacl-${pkgver}"

  shost=`hostname | sed 's/\..*//' | tr -cd '[a-z][A-Z][0-9]'`
  
  install -D -m 644 build/$shost/lib/*/libnacl.a "${pkgdir}/usr/lib/libnacl.a"
  install -D -m 644 build/$shost/lib/*/randombytes.o "${pkgdir}/usr/lib/randombytes.o"

  install -d "${pkgdir}/usr/include/nacl"
  install -t "${pkgdir}/usr/include/nacl" build/$shost/include/*/*
}
