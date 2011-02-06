# Contributor: shahid <helllamer@gmail.com>
# Based on PKGBUILD from Martin Häger <martin.haeger@gmail.com>
pkgname=sqlplus11
pkgver=11.2.0.1
pkgrel=1
pkgdesc="Oracle database client"
arch=('i686' 'x86_64')
url="http://www.oracle.com/"
license=('custom:OTN')
depends=('gcc-libs' 'libaio')
makedepends=('chrpath')
source=(LICENSE)
install=sqlplus11.install
md5sums=('627a6cc294fe5e4a420652e5fac726ab')

case ${CARCH} in
    x86_64) 
        _files=('oracle-instantclient11.2-basic-'${pkgver}'.0-1.x86_64.zip'
                'oracle-instantclient11.2-sqlplus-'${pkgver}'.0-1.x86_64.zip')
        _download_url="http://www.oracle.com/technology/software/tech/oci/instantclient/htdocs/linuxx86_64soft.html"
        ;;
    
    i686|*) 
        _files=('instantclient-basic-linux32-'${pkgver}'.zip' 
                'instantclient-sqlplus-linux32-'${pkgver}'.zip') 
        _download_url="http://www.oracle.com/technology/software/tech/oci/instantclient/htdocs/linuxsoft.html"
        ;;
esac

build() {
  msg "Download the following files from ${_download_url} and place in /tmp. Press any key to continue..."
  for _file in ${_files[@]}
  do
      echo ${_file}
  done

  read

  msg "Extracting..."
  for _file in ${_files[@]}
  do
      unzip -o /tmp/${_file} -d ${srcdir} || return 1
  done
  
  cd ${srcdir}/instantclient_11_2  

  msg "Deleting rpaths..."
  find . -type f -exec chrpath -d {} > /dev/null 2>&1 \; 

  msg "Installing..."
  mkdir -p ${pkgdir}/usr/{lib,bin,share/licenses/sqlplus}
  find . -type f -not \( -name adrci -name sqlplus -o -name genezi -o -name "*_README" \) -exec install -m755 {} ${pkgdir}/usr/lib/ \;
  install -m755 {sqlplus,genezi,adrci} ${pkgdir}/usr/bin/
  install -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/sqlplus/ 
  
}

# vim:set ts=2 sw=2 et:
