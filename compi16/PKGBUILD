# Maintainer: David Becker <david dot becker at gmx dot org>

pkgname=compi16
pkgver=1.0
pkgrel=1
pkgdesc="A Von Neumann simulator (german,requires java-runtime)"
source=("https://dl.dropbox.com/s/pp7l5gh4japyzk8/Compi16.jar?dl=1" "https://dl.dropbox.com/s/r97olonylhaztf0/alu.gif?dl=1")
md5sums=('6157357d45da3a182e32a0aea3272b32' 'ba921c0e97f125ee3ac04235ce332deb')
license=('GPL 2')
url="http://whz-cms-10.zw.fh-zwickau.de/lkrauss/afs/compi16fW/Praktikumsanleitung/"
arch=(any)
depends=('java-runtime')

build() {
mv Compi16.jar\?dl\=1 Compi16.jar
mv alu.gif\?dl\=1 alu.gif
cat > compi16.desktop << "EOF"
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Compi16
Type=Application
Terminal=false
Exec=java -jar /opt/compi16/Compi16.jar
Icon=/opt/compi16/alu.gif
StartupNotify=truels
EOF

cat > compi16 << "EOF"
#!/bin/bash
java -jar /opt/compi16/Compi16.jar
EOF
}

package() {
install -d "${pkgdir}/opt/compi16"
install -Dm755 "${srcdir}/Compi16.jar" "${pkgdir}/opt/compi16/Compi16.jar"
install -Dm644 "${srcdir}/alu.gif" "${pkgdir}/opt/compi16/alu.gif"

install -d "${pkgdir}/usr/bin"
install -Dm755 "${srcdir}/compi16" "${pkgdir}/usr/bin/"

install -d "${pkgdir}/usr/share/applications/"
cp *.desktop ${pkgdir}/usr/share/applications/
}

