# Contributor: Martin Häger <martin.haeger@gmail.com>
pkgname=sqlplus
pkgver=10.2.0.4.0
pkgrel=1
pkgdesc="Oracle database client"
arch=('i686' 'x86_64')
url="http://www.oracle.com/"
license=('custom:OTN')
depends=('gcc-libs')
makedepends=('chrpath')
source=(LICENSE)
md5sums=('627a6cc294fe5e4a420652e5fac726ab')

case ${CARCH} in
    x86_64) 
        _files=('basic-10.2.0.4.0-linux-x86_64.zip'
                'sqlplus-10.2.0.4.0-linux-x86_64.zip')
        _download_url="http://www.oracle.com/technology/software/tech/oci/instantclient/htdocs/linuxx86_64soft.html"
        ;;
    
    i686|*) 
        _files=('oracle-instantclient-basic-10.2.0.4-1.i386.zip' 
                'oracle-instantclient-sqlplus-10.2.0.4-1.i386.zip') 
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
      unzip /tmp/${_file} -d ${srcdir} || return 1
  done
  
  cd ${srcdir}/instantclient_10_2  

  msg "Deleting rpaths..."
  find . -type f -exec chrpath -d {} > /dev/null 2>&1 \; 

  msg "Installing..."
  mkdir -p ${pkgdir}/usr/{lib,bin,share/licenses/sqlplus}
  find . -type f -not \( -name sqlplus -o -name genezi -o -name "*_README" \) -exec install -m755 {} ${pkgdir}/usr/lib/ \;
  install -m755 {sqlplus,genezi} ${pkgdir}/usr/bin/
  install -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/sqlplus/ 
  
}

# vim:set ts=2 sw=2 et:
