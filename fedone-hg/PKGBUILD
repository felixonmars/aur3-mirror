# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=fedone-hg
pkgver=173
pkgrel=1
pkgdesc="The Google Wave Federation Prototype Server"
arch=('i686' 'x86_64')
url="http://code.google.com/p/wave-protocol/"
license=('APACHE')
depends=('jre')
makedepends=('apache-ant' 'jdk' 'mercurial')
optdepends=(
  "ejabberd: XMPP server written in Erlang (package author's choice)"
  "openfire: XMPP server written in Java"
  "prosody: XMPP server written in Lua"
)
options=()
install=
source=(fedone-hg.diff fedone-server.rc)
md5sums=('29719e3b8cf60248517561ef024a5bbe'
         'db4f082a0fbdc1999f2a9204f81c1304')
_hgroot=https://wave-protocol.googlecode.com/hg/
_hgrepo=wave-protocol

build() {
  cd "$srcdir"

  if [ -d ${_hgrepo} ]; then
    cd ${srcdir}/${_hgrepo}
    hg pull -u
  else 
    hg clone ${_hgroot}${_hgrepo} || return 1
    cd ${srcdir}/${_hgrepo}
  fi

  msg "Starting ant..."

  ant || return 1

  msg "Applying patches..."
  patch -Np0 < "$srcdir/fedone-hg.diff"

  msg "Installing..."
  fed1ver=`grep ^fedone.version= build.properties | cut -f2 -d=`
  install -Dm 644 dist/fedone-server-$fed1ver.jar "$pkgdir/opt/fedone/dist/fedone-server-$fed1ver.jar"
  install -Dm 644 dist/fedone-client-console-$fed1ver.jar "$pkgdir/opt/fedone/dist/fedone-client-console-$fed1ver.jar"
  install -Dm 644 dist/fedone-agent-echoey-$fed1ver.jar "$pkgdir/opt/fedone/dist/fedone-agent-echoey-$fed1ver.jar"
  install -Dm 644 dist/fedone-agent-probey-$fed1ver.jar "$pkgdir/opt/fedone/dist/fedone-agent-probey-$fed1ver.jar"
  install -Dm 644 build.properties "$pkgdir/opt/fedone/build.properties"
  install -D run-config.sh.example "$pkgdir/opt/fedone/run-config.sh.example"
  install -D run-server.sh "$pkgdir/opt/fedone/run-server.sh"
  install -D run-client-console.sh "$pkgdir/opt/fedone/run-client-console.sh"
  install -D run-agent-echoey.sh "$pkgdir/opt/fedone/run-agent-echoey.sh"
  install -D run-agent-probey.sh "$pkgdir/opt/fedone/run-agent-probey.sh"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/fedone/run-server.sh "$pkgdir/usr/bin/fedone-server"
  ln -s /opt/fedone/run-client-console.sh "$pkgdir/usr/bin/fedone-client-console"
  ln -s /opt/fedone/run-agent-echoey.sh "$pkgdir/usr/bin/fedone-agent-echoey"
  ln -s /opt/fedone/run-agent-probey.sh "$pkgdir/usr/bin/fedone-agent-probey"
  install -D "$srcdir/fedone-server.rc" "$pkgdir/etc/rc.d/fedone-server"
}

# vim:set ts=2 sw=2 et:
