# Contributor: vn158 <vn158 at seznam dot cz>
pkgname=dvdshrink
pkgver=3.2.0.15
pkgrel=1
pkgdesc="Backup DVD disks"
arch=(i686 x86_64)
url="http://www.dvdshrink.org/"
license=('custom:freeware')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=(innounp icoutils)
source=($pkgname $pkgname.desktop http://www.dwn.cz/sw/dvdshrink32setup.zip)
md5sums=('6ee583f46539bb5042bebaae0bc17330'
         '8f0e6d4c817b1374e1e1dabbe82dd1f1'
         'e6b0a6346fe640365f4ab9d5c7d9fb93')
noextract=()
options=(!strip)

build() {
  cd "$startdir"/src
  innounp -x -q dvdshrink32setup.exe

  cd "$startdir"

  wrestool -x -t14 src/\{app\}/DVD\ Shrink\ 3.2.exe > dvdshrink.ico 2> /dev/null
  icotool -x dvdshrink.ico
  mv -f dvdshrink*32x32x8.png dvdshrink.png

  install -d -m755 pkg/usr/share/$pkgname
  install -d -m755 pkg/usr/share/$pkgname/Still\ Images
  install -d -m755 pkg/usr/share/$pkgname/Web
  install -d -m755 pkg/usr/share/$pkgname/Web/Images

  cp -a src/\{app\}/*.exe pkg/usr/share/$pkgname
  cp -a src/\{app\}/Still\ Images/* pkg/usr/share/$pkgname/Still\ Images
  cp -a src/\{app\}/Still\ Images/* pkg/usr/share/$pkgname/Web/Images
  
  tr -d \\r < src/\{app\}/License.txt > pkg/usr/share/$pkgname/License.txt
  tr -d \\r < src/\{app\}/Version\ History.txt > pkg/usr/share/$pkgname/Version\ History.txt

  tr -d \\r < src/\{app\}/Web/Acknowledgements.htm > pkg/usr/share/$pkgname/Web/Acknowledgements.htm
  tr -d \\r < src/\{app\}/Web/Contents.htm > pkg/usr/share/$pkgname/Web/Contents.htm
  tr -d \\r < src/\{app\}/Web/DVD\ Shrink Help.htm > pkg/usr/share/$pkgname/Web/DVD\ Shrink Help.htm
  tr -d \\r < src/\{app\}/Web/DVD\ Shrink.htm > pkg/usr/share/$pkgname/Web/DVD\ Shrink.htm
  tr -d \\r < src/\{app\}/Web/Guides.htm > pkg/usr/share/$pkgname/Web/Guides.htm
  tr -d \\r < src/\{app\}/Web/Introduction.htm > pkg/usr/share/$pkgname/Web/Introduction.htm
  tr -d \\r < src/\{app\}/Web/License.htm > pkg/usr/share/$pkgname/Web/License.htm
  tr -d \\r < src/\{app\}/Web/Quality.htm > pkg/usr/share/$pkgname/Web/Quality.htm
  tr -d \\r < src/\{app\}/Web/Version\ History.htm > pkg/usr/share/$pkgname/Web/Version\ History.htm

  find pkg/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find pkg/usr/share/$pkgname -type f -exec chmod 644 "{}" \;

  install -d -m755 pkg/usr/bin
  install -m755 $pkgname pkg/usr/bin
  
  # Install desktop file
  install -D -m644 $pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
}
