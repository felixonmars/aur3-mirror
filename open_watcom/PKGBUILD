# Adopted by: Felix Stirlitz <m.p.isaev@yandex.com>
# adjust the configuration below to change options
pkgname=open_watcom
pkgver=1.9.0
pkgrel=3
pkgdesc="The Open Watcom C/C++ compiler, binary distribution"
arch=('i686' 'x86_64')
url="http://www.openwatcom.org"
license=('custom:OWPL-1')
source=( 'ftp://ftp.heanet.ie/pub/openwatcom/open-watcom-c-linux-1.9' )
noextract=( 'open-watcom-c-linux-1.9' )
md5sums=('960fe6b5cf88769a42949f5fedf62827')
options=(!strip)

build() {
    chmod +x ./open-watcom-c-linux-1.9
}

package() {
	_tmpnam="$(mktemp /tmp/options.$$.XXXXXXXXX)"
	sed -e 's/#.*$//g' >"$_tmpnam" <<EOF
ms=true                        # small memory model libraries
mm=true                        # medium memory model libraries
mc=true                        # compact memory model libraries
ml=true                        # large memory model libraries
mh=true                        # huge memory model libraries
doshost=true                   # DOS host binaries
os2host=false                  # OS/2 host binaries
dostarg=true                   # DOS target libraries
os2targ=false                  # OS/2 target libraries
nlmtarg=false                  # Novell Netware target
rdoshost=false                 # RDOS host binaries
rdostarg=false                 # RDOS target libraries
lnxhost=true                   # Linux host binaries
lnxtarg=true                   # Linux target libraries
winhost=false                  # Windows host binaries
wnthost=false                  # Windows target libraries
wintarg=false                  # Windows NT host binaries
wnttarg=false                  # Windows NT target libraries
tools16=true                   # 16-bit tools
samples=true                   # Samples
helpfiles=false                # Help files
win16_helpfiles=false          # Win16 help files
win32_helpfiles=false          # Windows NT help files
htmlhelp_helpfiles=false       # CHM help files
whelp_helpfiles=false          # WHELP help files
os2_helpfiles=false            # OS/2 help files
pdf_helpfiles=true             # PDF help files
rtsource=true                  # Runtime library source
3r=true                        # Register calling convention libraries
3s=true                        # Stack calling convention libraries
cplusplus=true	               # C++ support
EOF
	./open-watcom-c-linux-1.9 -i -dDstDir="$pkgdir/opt/watcom" -dOWDir="/opt/watcom" -f="$_tmpnam"
	install -d "$pkgdir/usr/share/licenses/watcom"
	install -Dm644 "$pkgdir/opt/watcom/license.txt" "$pkgdir/usr/share/licenses/watcom/license.txt"
	_pkgdirsane="$(echo "$pkgdir" | sed -e 's,[\[^$.+*\\?],\\&,g')"
	sed -i -e "s,$_pkgdirsane,," "$pkgdir/opt/watcom/owsetenv.sh"
	rm -f "$_tmpnam"
}
