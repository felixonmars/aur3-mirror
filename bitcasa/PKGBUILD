# Maintainer: Matt Harrison <matt@mistbyte.com>

pkgname=bitcasa
pkgver=0.9.6.99
pkgrel=1
pkgdesc="Infinite Storage in the cloud"
arch=('x86_64')
url="http://www.bitcasa.com"
license=('custom')
depends=('apr-util' 'fuse' 'desktop-file-utils' 'hicolor-icon-theme' 'krb5' 'libidn' 'curl' 'libgcrypt' 'libtasn1' 'protobuf' 'p11-kit' 'qt' 'rtmpdump')
makedepends=('binutils' 'tar')
install=bitcasa.install
source=(
  "http://dist.bitcasa.com/release/ubuntu/pool/main/b/bitcasa/bitcasa_${pkgver}_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/universe/b/boost1.46/libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/b/boost1.46/libboost-regex1.46.1_1.46.1-7ubuntu3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/universe/b/boost1.46/libboost-thread1.46.1_1.46.1-7ubuntu3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/universe/b/boost1.46/libboost-system1.46.1_1.46.1-7ubuntu3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/c/curl/libcurl3_7.22.0-3ubuntu4_amd64.deb"
  "http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.0.0_1.0.1-4ubuntu5.3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/g/gnutls26/libgnutls26_2.12.14-5ubuntu3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/o/openldap/libldap-2.4-2_2.4.28-1.1ubuntu4_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libgssapi3-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libheimntlm0-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libasn1-8-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libhcrypto4-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libroken18-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/c/cyrus-sasl2/libsasl2-2_2.1.25.dfsg1-3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libkrb5-26-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libwind0-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libheimbase1-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/h/heimdal/libhx509-5-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/universe/l/log4cxx/liblog4cxx10_0.10.0-1.2ubuntu2_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/i/icu/libicu48_4.8.1.1-3_amd64.deb"
  "http://mirrors.rit.edu/ubuntu/pool/main/f/fuse/libfuse2_2.8.6-2ubuntu2_amd64.deb"
  "LICENSE"
  "bitcasa.sh")
sha256sums=(
  '85fcc881c0985d583e0c6dc23d0f7c53ee2246253b04e15cb5ab3f63e36ae5a9' # bitcasa_0.9.6.99_amd64.deb
  '4eecc887ee9a3ce511acd830c21a9e92babaae35d44cb6d8bfc8a7eb073ae8ef' # libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.deb
  'd08ff295ae3a48ce303404df495df4dd42596e22d7a599fe2f417709f1abb6e2' # libboost-regex1.46.1_1.46.1-7ubuntu3_amd64.deb
  '6fc8bfd0ae266ecaa0c64abbff12286f86ff194e3f69be2cf17425e213d7e2b1' # libboost-thread1.46.1_1.46.1-7ubuntu3_amd64.deb
  '684e5010e378b98da0eeba04f1848575a4c14aac158a4047b9ae386e9fc5b7a1' # libboost-system1.46.1_1.46.1-7ubuntu3_amd64.deb
  '46d58ee60211b8467f6e237d194e0919dc9ea7a49bc15e963b212899a4e5d990' # libcurl3_7.22.0-3ubuntu4_amd64.deb
  'e701f34277aabe21e42f657aaaf3f8c18ebf6d32f01181c9a97b41fa747e1fc3' # libssl1.0.0_1.0.1-4ubuntu5.3_amd64.deb
  'eb7b0fcaae1dc1931761546f01c52badb982c38c22a3d0e2303b50251d2aace1' # libgnutls26_2.12.14-5ubuntu3_amd64.deb
  '024df6e175efc8747454a4ca873598c16bc02eab6b811d418e78a5038b39dc09' # libldap-2.4-2_2.4.28-1.1ubuntu4_amd64.deb
  'cfa2e6119d5148a0c09e1b0407b32b121ee0dcbf73ac39e9522a6efce19b4197' # libgssapi3-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  '9c37b58b280f781cd3494626cab569672e10777cd4200c1bbd814ebe3ac84269' # libheimntlm0-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  '480ef08a0e86c73f60d89dd3fc1c601712cafe65663428ac3850c5a43de928aa' # libasn1-8-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  '8bda824f525937657e24246ac91bb6374c2924ba816b94c9bb040e73a8172c60' # libhcrypto4-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  'eb6b9525307eafd759949e891179eda529ae75d1e0c248cc06d6aad937224a6d' # libroken18-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  '7ee06d0eb0075b3ca01a162c844984675084bc861a03ce84b0803949ef8c799c' # libsasl2-2_2.1.25.dfsg1-3_amd64.deb
  '3c3dc5a53b8d3556c8d925aab9ff101e6c149e3794efb55faddb26a62a55f1bd' # libkrb5-26-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  '6dd9066a234bc4d99df6f1c2b625fc8d86b8e85e8571cd376f521040fef76c8e' # libwind0-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  'e75f750aea802bdff3127daaff6935e33307a0dfde8054917458a8026d65ec84' # libheimbase1-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  'b12db11e01e2593aa93adbe7f3832510fc4be9b7746212639541ebb44412d7b0' # libhx509-5-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  'ce1af021f0d5a34864b47897f5feab7d18b8023fcb76cb3e760a009c57fc2a19' # liblog4cxx10_0.10.0-1.2ubuntu2_amd64.deb
  'a2cbfbc062d20f9494e0d862f942dfe412525cc06f5031950c18c11b437e4173' # libicu48_4.8.1.1-3_amd64.deb
  '9e1083a08e8f66fac100cf8a8aa3679c43793dcd26ddd9213d4650eebaa6d88e' # libfuse2_2.8.6-2ubuntu2_amd64.deb
  '0d42620570e40e4d3ee95bd83776bcf484c235bfaa81892006ac863b9e5b7847' # LICENSE
  '634ee5a5618256f61a9c1316ccb8270cfd201161ea2a91a55fb3523939d6a695' # bitcasa.sh
)

_extract_deb() {
  msg2 "Extracting deb $1"
  ar -p $1 data.tar.gz | tar zxf - -C "${srcdir}" || return 1
}

build() {
  cd $srcdir/
  msg "Extracting..."
  _extract_deb bitcasa_${pkgver}_amd64.deb

  # extract libs from ubuntu package
  _extract_deb libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.deb
  _extract_deb libboost-filesystem1.46.1_1.46.1-7ubuntu3_amd64.deb
  _extract_deb libboost-regex1.46.1_1.46.1-7ubuntu3_amd64.deb
  _extract_deb libboost-thread1.46.1_1.46.1-7ubuntu3_amd64.deb
  _extract_deb libboost-system1.46.1_1.46.1-7ubuntu3_amd64.deb
  _extract_deb libcurl3_7.22.0-3ubuntu4_amd64.deb
  _extract_deb libssl1.0.0_1.0.1-4ubuntu5.3_amd64.deb
  _extract_deb libgnutls26_2.12.14-5ubuntu3_amd64.deb
  _extract_deb libldap-2.4-2_2.4.28-1.1ubuntu4_amd64.deb
  _extract_deb libgssapi3-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libheimntlm0-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libasn1-8-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libhcrypto4-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libroken18-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libsasl2-2_2.1.25.dfsg1-3_amd64.deb data.tar.gz
  _extract_deb libkrb5-26-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libwind0-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libheimbase1-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb libhx509-5-heimdal_1.6~git20120311.dfsg.1-2_amd64.deb
  _extract_deb liblog4cxx10_0.10.0-1.2ubuntu2_amd64.deb
  _extract_deb libicu48_4.8.1.1-3_amd64.deb
  _extract_deb libfuse2_2.8.6-2ubuntu2_amd64.deb
  msg2 "Done extracting!"
}

package() {
  install -d "$pkgdir/opt/bitcasa"

  msg "Moving files"
  install -Dm755 "$srcdir/usr/bin/Bitcasa" "$pkgdir/opt/bitcasa/"
  install -Dm755 "$srcdir/bitcasa.sh" "$pkgdir/opt/bitcasa/bitcasa"

  # Install Share files
  install -Dm644 "$srcdir/usr/share/icons/hicolor/72x72/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/72x72/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/128x128/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/16x16/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/24x24/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/64x64/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/32x32/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/96x96/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/36x36/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/36x36/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/48x48/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/22x22/apps/bitcasa.png" "$pkgdir/usr/share/icons/hicolor/22x22/apps/bitcasa.png"
  install -Dm644 "$srcdir/usr/share/applications/bitcasa.desktop" "$pkgdir/usr/share/applications/bitcasa.desktop"
  install -Dm644 "$srcdir/usr/share/menu/bitcasa" "$pkgdir/usr/share/menu/bitcasa"
  install -Dm644 "$srcdir/usr/share/doc/bitcasa/changelog.gz" "$pkgdir/usr/share/doc/bitcasa/changelog.gz"
  install -Dm644 "$srcdir/usr/share/pixmaps/bitcasa.xpm" "$pkgdir/usr/share/pixmaps/bitcasa.xpm"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/bitcasa/bitcasa" "$pkgdir/usr/bin/bitcasa"
  ln -s "/opt/bitcasa/bitcasa" "$pkgdir/usr/bin/Bitcasa"

  # Install libs to the lib folder
  mv "$srcdir/usr/lib/$CARCH-linux-gnu" "$pkgdir/opt/bitcasa/lib"
  install -m644 "$srcdir/usr/lib/libboost_filesystem.so.1.46.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libboost_regex.so.1.46.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libboost_thread.so.1.46.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libboost_system.so.1.46.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/liblog4cxx.so.10" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/liblog4cxx.so.10.0.0" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicudata.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicudata.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicui18n.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicui18n.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicuio.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicuio.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicule.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicule.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libiculx.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libiculx.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicutest.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicutest.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicutu.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicutu.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicuuc.so.48" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/usr/lib/libicuuc.so.48.1.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/lib/$CARCH-linux-gnu/libcrypto.so.1.0.0" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/lib/$CARCH-linux-gnu/libssl.so.1.0.0" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/lib/libfuse.so.2" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/lib/libfuse.so.2.8.6" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/lib/libulockmgr.so.1" "$pkgdir/opt/bitcasa/lib/"
  install -m644 "$srcdir/lib/libulockmgr.so.1.0.1" "$pkgdir/opt/bitcasa/lib/"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/bitcasa/LICENSE"
  msg2 "Done moving files"
}

# vim:set ts=2 sw=2 et:
