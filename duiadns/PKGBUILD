# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=duiadns
pkgver=2.0.0.3
pkgrel=8
pkgdesc="Duiadns console client"
arch=('any')
url="https://www.duiadns.net/download"
#depends=()
makedepends=("curl")
source=(duia.cfg)
md5sums=('195fccce06511019f24364a2ff0c3793')
backup=(duia.cfg)

build() {
  cd "$srcdir/"
  [ $CARCH == "x86_64" ] && ARCH="x64"
  [ $CARCH == "i686"   ] && ARCH="x86"
  [ $CARCH == "armv7h" ] && ARCH="arm"
  curl https://www.duiadns.net/downloads/files/go/console/linux/${ARCH}/duia.linux.${ARCH}-${pkgver}.tar.gz > duia.linux.${ARCH}-${pkgver}.tar.gz
  tar -xvf duia.linux.${ARCH}-${pkgver}.tar.gz
  mv ./duia.linux.${ARCH}-${pkgver}/duiadns.bin ./duiadns.bin
  mv ./duia.linux.${ARCH}-${pkgver}/readme.txt ./readme

cat > duiadns <<EOF
#!/usr/bin/bash -e
[ \$EUID != 0 ] && echo "root Needed" && exit 1

mkdir -p /run/duiadns/ && cd /run/duiadns/

[ -f /run/duiadns/duia.cfg ] || ln -sv /etc/duiadns/duia.cfg ./

echo $$ > /run/duiadns/own.pid

# duia dns ignore working dir
cp /usr/lib/systemd/scripts/duiadns.bin ./duiadns.bin

while :; do
  ./duiadns.bin
  sleep 5m
done

rm /run/duiadns/own.pid
EOF

cat > duiadns.service <<EOF
[Unit]
Description=Duiadns

[Service]
ExecStart=/usr/bin/duiadns
ProtectSystem=true
PIDFile=/run/duiadns/own.pid

[Install]
WantedBy=network.target
EOF

}

package() {
  cd "$srcdir/"
  install -Dm755 duiadns    "$pkgdir/usr/bin/duiadns"
  install -Dm755 duiadns.bin    "$pkgdir/usr/lib/systemd/scripts/duiadns.bin"

  install -Dm644 readme     "$pkgdir/etc/duiadns/readme"
  install -Dm644 duia.cfg   "$pkgdir/etc/duiadns/duia.cfg"

  install -Dm644 duiadns.service "$pkgdir/usr/lib/systemd/system/duiadns.service"
}
