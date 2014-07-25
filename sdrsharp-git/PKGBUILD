# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: KJ4EHD ryan_turner

_pkgname=sdrsharp
pkgname=$_pkgname-git
pkgver=533.e07ac67
pkgrel=1
pkgdesc="A high performance Software Defined Radio application"
arch=('i686' 'x86_64')
url="http://sdrsharp.com/"
license=('MIT' 'MS-RSL')
depends=('rtl-sdr' 'mono' 'portaudio')
provides=('sdrsharp')
conflicts=('sdrsharp-svn')
makedepends=('git' 'monodevelop' 'icoutils')
source=(git://github.com/cgommel/sdrsharp 'sdrsharp.desktop' 'sdrsharp.sh')
md5sums=(SKIP '6794e8e2808057bfea16c4daec23973f'
         'c149a9113fe43e685b8a8763a1dda884')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"

  # Build
  mdtool build -c:Release SDRSharp.sln
}

package() {
  echo "-------------------------------------------------------"
  echo "package"
  echo "-------------------------------------------------------"
  cd "$srcdir/$_pkgname/Debug/"
 
  # Modify config
  sed -i '/SDRSharp.SoftRock.SoftRockIO,SDRSharp.SoftRock/d' SDRSharp.exe.config
  sed -i '/SDRSharp.FUNcube.FunCubeIO,SDRSharp.FUNcube/d' SDRSharp.exe.config
  sed -i '/SDRSharp.FUNcubeProPlus.FunCubeProPlusIO,SDRSharp.FUNcubeProPlus/d' SDRSharp.exe.config
  sed -i '/SDRSharp.RTLTCP.RtlTcpIO,SDRSharp.RTLTCP/d' SDRSharp.exe.config
  sed -i '/SDRSharp.SDRIQ.SdrIqIO,SDRSharp.SDRIQ/d' SDRSharp.exe.config
#  sed -i 's/<!-- <add key="RTL-SDR \/ USB" value="SDRSharp.RTLSDR.RtlSdrIO,SDRSharp.RTLSDR" \/> -->/<add key="RTL-SDR \/ USB" value="SDRSharp.RTLSDR.RtlSdrIO,SDRSharp.RTLSDR" \/>/' SDRSharp.exe.config

  # Create PNG of icon
  icotool -x "$srcdir/$_pkgname/SDRSharp/mixer.ico"

  # Install
  mkdir -p "$pkgdir/opt/$_pkgname"
  cp -a * "$pkgdir/opt/$_pkgname"

  install -Dm644 ../LICENSE "$pkgdir/opt/$_pkgname"
  install -Dm644 ../LISENSING_SCOPE "$pkgdir/opt/$_pkgname"

  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
