#!/bin/bash

appdir=/usr/share/ultimatepp
destdir=$1$appdir

# Copy the stuffs
mkdir -p $destdir
mkdir -p $1/usr/bin
mkdir -p $1/usr/share/pixmaps
mkdir -p $1/usr/share/applications
cp -r uppsrc $destdir
cp -r examples $destdir
cp -r bazaar $destdir
cp -r tutorial $destdir
cp -r reference $destdir
cp $destdir/uppsrc/ide.out $1/usr/bin/theide
cp GCC.bm $destdir/GCC.bm
rm -r $destdir/uppsrc/_out

# Place the application icon
cp $destdir/uppsrc/ide/icon16x16.png $1/usr/share/pixmaps/theide.png

# Create the launcher script

cat > $1/usr/bin/upp << EOF
#!/bin/bash

if [ ! -d \${HOME}/.upp ]; then
	mkdir \${HOME}/.upp
	mkdir \${HOME}/.upp/theide
	mkdir \${HOME}/.upp/out
	mkdir \${HOME}/.upp/MyApps
	cp /usr/share/ultimatepp/GCC.bm \${HOME}/.upp/theide/GCC.bm

	echo UPP = \"${appdir}/uppsrc\"\;OUTPUT = \"\${HOME}/.upp/out\"\; > \${HOME}/.upp/theide/uppsrc.var
	echo UPP = \"${appdir}/examples\;${appdir}/uppsrc\"\;OUTPUT = \"\${HOME}/.upp/out\"\; > \${HOME}/.upp/theide/examples.var
	echo UPP = \"${appdir}/reference\;${appdir}/uppsrc\"\;OUTPUT = \"\${HOME}/.upp/out\"\; > \${HOME}/.upp/theide/reference.var
	echo UPP = \"${appdir}/tutorial\;${appdir}/uppsrc\"\;OUTPUT = \"\${HOME}/.upp/out\"\; > \${HOME}/.upp/theide/tutorial.var
	echo UPP = \"${appdir}/bazaar\;${appdir}/uppsrc\"\;OUTPUT = \"\${HOME}/.upp/out\"\; > \${HOME}/.upp/theide/bazaar.var
	echo UPP = \"\${HOME}/MyApps\;${appdir}/uppsrc\"\;OUTPUT = \"\${HOME}/.upp/out\"\; > \${HOME}/.upp/theide/MyApps.var
fi

theide

EOF
chmod 755 $1/usr/bin/upp

# Create the desktop file
cat > $1/usr/share/applications/ultimatepp.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Ultimate++
Type=Application
Categories=Development;IDE;
Terminal=false
Exec=upp
Icon=/usr/share/pixmaps/theide.png
EOF

