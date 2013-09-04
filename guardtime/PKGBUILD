# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=guardtime
pkgver=1.0.r10
pkgrel=1
pkgdesc="Command-line tools for GuardTime Keyless Signature Service"
arch=("i686" "x86_64")
url="http://www.guardtime.com/resources/client-software/"
license=("Apache")
depends=(curl gcc-libs openssl zlib)

case $CARCH in
'i686')   _srcarch='i386';;
'x86_64') _srcarch='x86_64';;
esac

source=("http://download.guardtime.com/gtime-${pkgver/.r/-}.el6.$_srcarch.rpm")
        #"http://download.guardtime.com/gtime_1.0-9_amd64.deb"
        #"http://www.guardtime.com/downloads/KSIDesktopSigner-local-1.2.jar"
        #"http://download.guardtime.com/VerificationTool-0.3.5.jar")
#noextract=("KSIDesktopSigner-local-1.2.jar"
#           "VerificationTool-0.3.5.jar")
sha1sums=('402ca3a36543e110907e2ca4444c644b3f6c8f68')
          #'ac2a31a02279506337f5bf481fde6a32a9d44fbe'
          #'f402cae53605fbd1e2f422a74ef9f9f1a1ccec7c')

package() {
  cp -a "$srcdir/usr" "$pkgdir/usr"
  sed -i 's/\(libcrypto\.so\)\.10/\1\x00\x00\x00/' \
    "$pkgdir/usr/bin/gtime" "$pkgdir/usr/bin/gtime-test"
}

# vim: ts=2:sw=2:et:ft=sh
