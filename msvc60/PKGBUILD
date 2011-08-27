# Contributor: vn158 <vn158 at seznam dot cz>

pkgname=msvc60
pkgver=1
pkgrel=2
pkgdesc="Latest version of the Microsoft Visual C++ 6.0 SP4 run-time files"
url="http://www.microsoft.com/"
arch=(i686 x86_64)
makedepends=('cabextract')
license=('custom:redistributable')
source=(http://download.microsoft.com/download/vc60pro/update/1/w9xnt4/en-us/vc6redistsetup_enu.exe)
md5sums=('dd50945bcf3e09e22453be43684f3d39')
noextract=(vc6redistsetup_enu.exe)
options=(!strip)

build() {

  cd "$startdir"
  install -d -m755 pkg/usr/share/$pkgname

  cd "$startdir"/src

  cabextract -q vc6redistsetup_enu.exe
  cabextract -q vcredist.exe
  
  cp -a asycfilt.dll atla.dll atlu.dll comcat.dll mfc42.dll mfc42u.dll msvcirt.dll msvcp60.dll msvcrt.dll oleaut32.dll olepro32.dll stdole2.tlb ../pkg/usr/share/$pkgname
  find ../pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find ../pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

}
	