# Contributor: Wellington Oliveira de Andrade <wellington79@gmail.com>
pkgname=nhsups
pkgrel=1
pkgver=2.3.4
pkgdesc="Monitor Nobreack NHS"
url="http://www.nhs.com.br/softwares/Softwares"
license=('other')
arch=('i686' 'x86_64')
makedepends=()
source=('http://www.nhs.com.br/arquivos/download/nhsups_glibc_2_3_4_i386.tgz'
	'nhsupsserver'
	'nhsupsclient')

md5sums=('5f70cd785093d4ee5734dafc798d1617'
         '8ea0529cfdb80fbb19368e3ebe509242'
         '6054d3183e60b6cc01cf684dcf266485') 

if [[ $CARCH == x86_64 ]]; then 
	source[0]='http://www.nhs.com.br/arquivos/download/nhsups_glibc_2_3_4_x86_64.tgz'
	md5sums[0]='35311979906893ce9bc534867c886db5'
fi


build() {

	LOCALDIR=${pkgdir}/usr/local
	DESTDIR=$LOCALDIR/nhs
	mkdir -p $LOCALDIR
	cp -R nhsups_release $LOCALDIR || exit 1
	mv $LOCALDIR/nhsups_release $DESTDIR || exit 1
	
	echo Files copy to 
	echo $DESTDIR.
	echo	

	mkdir -p ${pkgdir}/etc/rc.d
	install -Dm744 ${srcdir}/nhsupsserver ${pkgdir}/etc/rc.d/
	install -Dm744 ${srcdir}/nhsupsclient ${pkgdir}/etc/rc.d/

	echo Init files copy in
	echo /etc/rc.d/

}
