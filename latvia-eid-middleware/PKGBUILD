# Maintainer: janhouse <janis.jansons@janhouse.lv>

## Usage:
##
## Enable and start pcscd:
# sudo systemctl enable pcscd
# sudo systemctl start pcscd
##
## If you use chromium with local nssdb, after installation, execute the following command:
# modutil -force -dbdir sql:~/.pki/nssdb/ -add "Latvia eID" -libfile /usr/lib/pkcs11/onepin-otlv-pkcs11.so
##
## If you use Firefox add to Preferences > Advanced > Certificates > Security devices following library:
## /usr/lib/pkcs11/onepin-otlv-pkcs11.so
## Then import certificates and restart Firefox. 

pkgname=latvia-eid-middleware
_gitname=eid-middleware
pkgver=1.1.0
pkgrel=1
pkgdesc="Digital signature middleware for Latvian eID cards."
arch=('any')
url="https://github.com/Janhouse/eid-middleware"

# Parts of the code seem to be public domain, parts GPL, parts proprietary?
license=('proprietary')

# This list probably isn't complete
depends=('pcsclite' 'ca-certificates' 'nss' 'openssl' 'zlib' 'libltdl')
# 'lib32-libltdl' 'lib32-zlib' 'lib32-glibc' 'lib32-pcsclite')
makedepends=('git')

# Run after install/uninstall
install=eid-middleware.install

# We are downloading and installing certificates because it is too much of a
# pain in the ass to do it manually. Also using checksums to make it more secure.
source=(
    'http://www.eme.lv/aia/E-ME%20SSI%20(RCA).crt'
    'http://www.eme.lv/aia/E-ME%20PSI%20(PCA).crt'
    'http://www.eme.lv/aia/E-ME%20SI%20(CA1).crt'
    'https://www.eparaksts.lv/files/e-me_si_(ca1)(1).crt'
    'https://www.eparaksts.lv/files/eme_ica_ca3.cer'
    'https://www.eparaksts.lv/files/ca4.cer'
    'https://www.eparaksts.lv/files/ica4_2014-08-09.cer'
    'https://www.eparaksts.lv/files/vas_latvijas_pasts_ssi(rca).cer'
    'http://www.e-me.lv/aia/vas%20latvijas%20pasts%20psi(pca).crt'
    'http://www.e-me.lv/aia/vas%20latvijas%20pasts%20si(ca1).crt'
    'http://www.e-me.lv/aia/vas%20latvijas%20pasts%20si(ca2).crt'
    'eid-middleware::git+https://github.com/Janhouse/eid-middleware.git')
    
md5sums=(
    'cbbdc3682db3cb1859d32952e8c66489'
    'ddd4d6de039752cd76bb14ec39995f93'
    '9164bbe8ac4791c07639a9cf7c1f6d32'
    '251b1a5be1dbeca9a5e3b90474ec0b22'
    '8423671095aa8377ec4a94f50d605d96'
    '0f46f5ca6a030a6e6f7464c57996ac91'
    'a53d9f5b35a748e6f0e93a9f485e374b'
    'f930223903eb166cc9bb66395337a63a'
    '506b54ce28911fb558a02a0a16ce86b2'
    '64797ede40ec80a099c59355a4009c65'
    '4c3a61b8305fb28be230a615020a1642'
    'SKIP')

#pkgver() {
#  cd "${_gitname}"
#  echo $(date +"%Y%m%d").$(git rev-list --count master).$(git rev-parse --short master) 
#}

build() {
  cd "$srcdir/${_gitname}/opensc-0.12.2"

  # Compile custom opensc that will be used by browsers and other apps
  LDFLAGS="" CFLAGS="-fno-strict-aliasing -g -O2 -Wall -Wextra" ./configure --prefix=/opt/latvia-eid \
    --sysconfdir=/opt/latvia-eid/etc \
    --disable-dependency-tracking \
    --enable-shared \
    --disable-static \
    --enable-strict \
    --disable-assert
  make
  
  # Compile the custom pintool
  cd ../PinTool
  make
  
  # Must change certificate format to PEM to import them properly
  cd "$srcdir"
  openssl x509 -inform der -in "E-ME%20PSI%20(PCA).crt" -out "E-ME%20PSI%20(PCA).pem"
  openssl x509 -inform der -in "E-ME%20SI%20(CA1).crt" -out "E-ME%20SI%20(CA1).pem"
  openssl x509 -inform der -in "E-ME%20SSI%20(RCA).crt" -out "E-ME%20SSI%20(RCA).pem"
  openssl x509 -inform der -in "vas%20latvijas%20pasts%20psi(pca).crt" -out "vas%20latvijas%20pasts%20psi(pca).pem"
  openssl x509 -inform der -in "vas%20latvijas%20pasts%20si(ca1).crt" -out "vas%20latvijas%20pasts%20si(ca1).pem"
  openssl x509 -inform der -in "vas%20latvijas%20pasts%20si(ca2).crt" -out "vas%20latvijas%20pasts%20si(ca2).pem"
  
}

package() {
  cd "$srcdir/${_gitname}/opensc-0.12.2"
  
  # Install this custom opensc in /opt/
  mkdir ${pkgdir}/opt/
  make DESTDIR="${pkgdir}" install
  
  # Add pin tool
  cd ../PinTool
  make INSTDIR="${pkgdir}" DESTDIR="${pkgdir}" install
  
  # Symlink it in system's bin
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/latvia-eid/lib/otlv-pintool ${pkgdir}/usr/bin/otlv-pintool

  # Symlink the lib
  mkdir -p ${pkgdir}/usr/lib/pkcs11/
  ln -s /opt/latvia-eid/lib/pkcs11/onepin-otlv-pkcs11.so ${pkgdir}/usr/lib/pkcs11/onepin-otlv-pkcs11.so
  
  # Add list of certificates 
  mkdir -p ${pkgdir}/etc/ca-certificates/conf.d/
  cat <<EOT >> ${pkgdir}/etc/ca-certificates/conf.d/latvia-eid-middleware.conf
latvia-eid-middleware/ca4.cer
latvia-eid-middleware/E-ME%20PSI%20(PCA).pem
latvia-eid-middleware/E-ME%20SI%20(CA1).pem
latvia-eid-middleware/E-ME%20SSI%20(RCA).pem
latvia-eid-middleware/eme_ica_ca3.cer
latvia-eid-middleware/e-me_si_(ca1)(1).crt
latvia-eid-middleware/ica4_2014-08-09.cer
latvia-eid-middleware/vas%20latvijas%20pasts%20psi(pca).pem
latvia-eid-middleware/vas%20latvijas%20pasts%20si(ca1).pem
latvia-eid-middleware/vas%20latvijas%20pasts%20si(ca2).pem
latvia-eid-middleware/vas_latvijas_pasts_ssi(rca).cer
EOT
  
  # Add certificates themselves
  mkdir -p ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/ca4.cer" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/E-ME%20PSI%20(PCA).pem" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/E-ME%20SI%20(CA1).pem" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/E-ME%20SSI%20(RCA).pem" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/eme_ica_ca3.cer" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/e-me_si_(ca1)(1).crt" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/ica4_2014-08-09.cer" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/vas%20latvijas%20pasts%20psi(pca).pem" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/vas%20latvijas%20pasts%20si(ca1).pem" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/vas%20latvijas%20pasts%20si(ca2).pem" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/
  cp "$srcdir/vas_latvijas_pasts_ssi(rca).cer" ${pkgdir}/usr/share/ca-certificates/latvia-eid-middleware/

  # Create directory for system wide nssdb
  mkdir -p ${pkgdir}/etc/pki/nssdb/

}
