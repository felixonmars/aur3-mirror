# Maintainer: CRT<crt.011@gmail.com>
pkgname=barnyard
pkgver=0.2.0
pkgrel=2
pkgdesc="Output spool reader for Snort"
arch=('i686' 'x86_64')
url="http://barnyard.sourceforge.net"
license=('QPL')
options=(docs)
install=barnyard.install
source=("http://sourceforge.net/projects/barnyard/files/barnyard-0.2/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/variablenix/patch/raw/master/barnyard.mysql.patch"
        "http://snort.org/users/jbrvenik/Site/Code_files/barnyard.64bit.diff")
sha512sums=('73424acf2e0c620b2f8f2f407d74812f7740234ce523e37557273998108c131311fffb16cfc2cea0f652d6b21072431081bad35b045f5654e2245786d27568e6'
            '563972d84f1c7e95257d73f6d72cf9e58e69e625b4e84a3f3717fd8bae81794f64325e8335b6ee9cf39ee9d90ebcdfde48a57ecdc5b309db95b67004c8a236e0'
	          'f445a91759b0a1f72588f5be27ecf5bb016f01c7ce30380c2e3026c304d45eb122616d5bf4905f4ec9aebd48fa3267223be6e08092ba3d50c58663be63e36a14')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Patch prevents Barnyard process to end when MySQL reconnects
  patch -Np1 -i ../barnyard.mysql.patch

  # For x86_64, Barnyard 0.2.0 needs to be patched or it will get errors when trying to read snort files
  if [[ "$CARCH" == x86_64 ]] 
  then
    patch -Np1 -i ../barnyard.64bit.diff 
  fi

  ./configure --prefix=/usr --sysconfdir=/etc --enable-mysql
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install 
  install -d "${pkgdir}"/etc
  install -m644 "${srcdir}/${pkgname}-${pkgver}"/etc/barnyard.conf "${pkgdir}"/etc
  install -D -m644 LICENSE.QPL "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.QPL
}

# vim:set ts=2 sw=2 et:

